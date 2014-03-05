function MailHeaders
{
    # input paramters (string of text) is used for subject line
    echo "From: ${FromUser:-root}"
    echo "To: ${ToUser:-root}"
    echo "Subject: $*"
    echo "Content-type: text/html"
    echo "$*" | grep -q "FAILED"
    if [[ $? -eq 0 ]]; then
        echo "Importance: high"
        echo "X-Priority: 1"
    else
        echo "Importance: normal"
	echo "X-Priority: 3"
    fi
    echo ""
}

function StartOfHtmlDocument
{
    # define HTML style (this function should be called 1st)
    echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">'
    echo '<HTML> <HEAD>'
    echo "<META NAME=\"CHANGED\" CONTENT=\" $(date) \">"
    echo "<META NAME=\"DESCRIPTION\" CONTENT=\"$PRGNAME\">"
    echo "<META NAME=\"subject\" CONTENT=\"Results of $PRGNAME\">"
    echo '<style type="text/css">'
    echo "Pre     {Font-Family: Courier-New, Courier;Font-Size: 10pt}"
    echo "BODY        {FONT-FAMILY: Arial, Verdana, Helvetica, Sans-serif; FONT-SIZE: 12pt;}"
    echo "A       {FONT-FAMILY: Arial, Verdana, Helvetica, Sans-serif}"
    echo "A:link      {text-decoration: none}"
    echo "A:visited   {text-decoration: none}"
    echo "A:hover     {text-decoration: underline}"
    echo "A:active    {color: red; text-decoration: none}"
    echo "H1      {FONT-FAMILY: Arial, Verdana, Helvetica, Sans-serif;FONT-SIZE: 20pt}"
    echo "H2      {FONT-FAMILY: Arial, Verdana, Helvetica, Sans-serif;FONT-SIZE: 14pt}"
    echo "H3      {FONT-FAMILY: Arial, Verdana, Helvetica, Sans-serif;FONT-SIZE: 12pt}"
    echo "DIV, P, OL, UL, SPAN, TD"
    echo "{FONT-FAMILY: Arial, Verdana, Helvetica, Sans-serif;FONT-SIZE: 11pt}"
    echo "</style>"
}

function SetTitleOfDocument
{
    # define title of HTML document and start of body (should be called 2th)
    echo "<TITLE>${PRGNAME} - $(hostname)</TITLE>"
    echo "</HEAD>"
    echo "<BODY>"
    echo "<CENTER>"
    echo "<H1> <FONT COLOR=blue>"
    echo "<P><hr><B>${PRGNAME} - $(hostname) - $*</B></P>"
    echo "</FONT> </H1>"
    echo "<hr> <FONT COLOR=blue> <small>Created on \"$(date)\" by $PRGNAME</small> </FONT>"
    echo "</CENTER>"
}

function EndOfHtmlDocument
{
    echo "</BODY> </HTML>"
}

function CreateTable
{
    # start of a new HTML table
    echo "<table width=100% border=0 cellspacing=0 cellpadding=0 style=\"border: 1 solid #000080\">"
}

function EndTable
{
    # end of existing HTML table
    echo "</table>"
}

function TableRow
{
    # function should be called when we are inside a table
    typeset row="$1"
    columns=""
    typeset color=${2:-white}  # default background color is white
    typeset -i c=0

    case "$( echo "$row" | cut -c1-3 )" in
        "** " ) columns[0]='**'
		row=$( echo "$row" | cut -c4- )
                ;;
	"== " ) columns[0]="==" 
                row=$( echo "$row" | cut -c4- )
                ;;
	*     ) columns[0]=""  ;;
    esac
    columns[1]=$( echo "$row" |  sed -e 's/\(.*\)\[.*/\1/' )   # the text with ** and [ ... ]
    echo "$row" | grep -q '\['
    if [[ $? -eq 0 ]]; then
        columns[2]=$( echo "$row" | sed -e 's/.*\(\[.*\]\)/\1/' )  # contains [  OK  ]
    else
        columns[2]=""
    fi
    
    # set the colors correct
    case "$( echo "${columns[2]}" | sed -e 's/\[//;s/\]//' -e 's/ //g' )" in
        "OK")           color="#00CA00" ;;      # greenish
        "FAILED")       color="#FF0000" ;;      # redish
        "WARN")
                if [[ "${columns[0]}" = "**" ]]; then
                        color="#E8E800"         # yellow alike
                else
                        color="#FB6104"         # orange alike
                fi
                ;;
        "SKIP")         color="#000000" ;;      # black
    esac

    echo "<tr bgcolor=\"$color\">"

    while (( $c < ${#columns[@]} )); do
        if [[ "$color" = "#FF0000" ]] || [[ "$color" = "#FB6104" ]] || [[ "$color" = "#000000" ]]; then
                # foreground color white if background color is redish or orangish or black
                echo "  <td align=left><font size=-1 color="white">\c"
        else
                echo "  <td align=left><font size=-1>\c"
        fi

	str=$( echo "${columns[c]}" | sed -e 's/^[:blank:]*//;s/[:blank:]*$//' )  # remove leading/trailing spaces
        [[ $c -eq 1 ]] && printf "<b>$str</b>" || printf "$str"
        echo "</td>"
        c=$((c + 1))
    done
    echo "</tr>"
}

function CreateParagraphLine
{
    echo "<P><HR></P>"
}

function GenerateHTMLMail
{
    MailHeaders "$*"
    StartOfHtmlDocument
    SetTitleOfDocument "$*"
    CreateTable
    cat $LOGFILE | while read LINE
    do
	case "$( echo $LINE | cut -c1-6 )" in
            "======"|"######" ) # markers to split up in tables
		      EndTable
		      CreateParagraphLine
		      CreateTable
		      ;;
               *    ) TableRow "$LINE" ;; 
	esac
    done
    EndTable
    EndOfHtmlDocument
}

