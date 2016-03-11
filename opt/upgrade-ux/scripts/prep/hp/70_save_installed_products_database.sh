# This utility is designed to detect several types of problems
##      which can occur in the Installed Products Database (IPD).
##      These are missing INFO, INDEX and README files or zero-length
##      INFO, INDEX and README files.

IPD=/var/adm/sw/products/
pfiles=pfiles
Report="$VAR_DIR/$DS/IPD_report.before"
zero=0
cnt=0
errcnt=0

[[ -f "$Report" ]] && return # no need to run it multiple times in preview

Log "Looking for zero or missing INDEX/INFO/README files (IPD check)"

for k in INDEX INFO README
do
    echo "Looking for zero-length $k files" >> $Report
    i=0
    i=$(find $IPD -name $k -size 0c|wc -w)
    if (( i = 0 )) ; then
        echo "No zero-length $k files found" >> $Report
    else
	errcnt=$((errcnt + 1))
        `find $IPD -name $k -size 0c -print >> ${Report}`
	echo >> $Report
    fi
done

# create the list to manage for missing INFO and INDEX files.
# note that README files are not mandatory.

cd $IPD
ls > $TMP_DIR/IPD.dirs.out

echo "Looking for missing INDEX/INFO/README files" >> $Report

while read i; do
    if [[ -d $IPD$i ]] ; then       # only process directories
        if [[ "$i" = "ifiles" ]] ; then
            continue
	else
            cd $IPD$i
	    if [[ ! -d  $pfiles ]] ; then
                echo "$IPD$i is missing a pfiles directory" >> $Report
	    else
		cd $pfiles
	        if [[ ! -f  INDEX ]] ; then
                    echo "$IPD$i/$pfiles is missing an INDEX file" >> $Report
		    cnt=cnt+1
	        fi
	        if [[ ! -f  INFO ]] ; then   # $i is a bundle
		    continue
                else
		    cd ..   # go back to product directory
                    ls > $TMP_DIR/IPD.filesets.out
		    while read dir; do
		        cd $dir
		        if [[ ! -f  INFO ]] ; then
                            echo "$IPD$i/$dir is missing an INFO file" >> $Report
			    cnt=cnt+1
		        fi
		        if [[ ! -f  INDEX ]] ; then
			    echo "$IPD$i/$dir is missing an INDEX file" >> $Report
			    cnt=$((cnt + 1))
                        else   # INDEX exists; check for README file
			    ctr=0
			    ctr=$(egrep "<[ ]*README" INDEX|wc -w)
			    if [ $ctr != $zero ] && [ ! -f README ] ; then
			        echo "$IPD$i/$dir is missing a README file" >> $Report
			        cnt=$((cnt + 1))
                            fi
                        fi # [[ ! -f  INDEX ]]
		        cd ..
                    done < $TMP_DIR/IPD.filesets.out
                 fi # [[ ! -f  INFO ]]
	      fi # [[ ! -d  $pfiles ]]
         fi # [[ "$i" = "ifiles" ]]
    fi # [[ -d $IPD$i ]]
done < $TMP_DIR/IPD.dirs.out


if [ $cnt = $zero ] ; then
    echo "No missing INFO, INDEX, or README files" >> $Report
fi

errcnt=$((errcnt + cnt))

if (( errcnt > 0 )) ; then
cat >>  ${Report}  <<EOF
NOTE:   Any missing or zero-length files listed above should be
        replaced from backup or from a depot containing a valid
        version of the file.
        Once all files are restored or otherwise replaced with
        valid versions, you will need to rebuild the IPD using
        the following command:

        Where missing or zero-length INDEX files are found,
        no search for a README file is possible.  Therefore,
        IPD check should be rerun after restoring missing or
        zero-length INDEX files.
 
    # swmodify -a state=configured OS-Core.Q4
EOF
LogPrint "Found zero or missing INDEX/INFO/README files (check $Report)"
fi # if (( errcnt > 0 ))

Log "IPD check completed."
