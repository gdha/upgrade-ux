# mkdist-workflow.sh

WORKFLOW_mkdist_DESCRIPTION="create a compressed tar archive distribution"
set -A WORKFLOWS ${WORKFLOWS[@]} "mkdist"

function WORKFLOW_mkdist {

    ARCHIVE=/tmp/${PRODUCT}-${VERSION}.tar
    rm -f ${ARCHIVE%.*}.tar*  # only remove *.tar[.gz] files

    LogPrint "Creating archive '$ARCHIVE'"
    cd "${DIR_PREFIX}"
    find . -type f | grep -v -E '(./.git/|./var/opt/dupro/log/)' > /tmp/$PRODUCT.list
    tar -vcf "$ARCHIVE" $( cat /tmp/$PRODUCT.list )
    StopIfError "Could not create the archive"
    cd - 2>/dev/null

    [[ -f "$ARCHIVE" ]] && gzip "$ARCHIVE"
    if [[ -f "$ARCHIVE".gz ]]; then
        LogPrint "Archived saved as ${ARCHIVE}.gz"
    else
        LogPrint "Archived saved as ${ARCHIVE}"
    fi
    rm -f /tmp/$PRODUCT.list
}
