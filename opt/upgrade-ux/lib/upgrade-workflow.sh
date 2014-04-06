# upgrade-workflow.sh

WORKFLOW_upgrade_DESCRIPTION="upgrade the operating system"
set -A WORKFLOWS ${WORKFLOWS[@]} "upgrade"

function WORKFLOW_upgrade {
    SourceStage "init"
    SourceStage "prep"
    SourceStage "preremove"
    SourceStage "preinstall"
    SourceStage "cleanup"
}
