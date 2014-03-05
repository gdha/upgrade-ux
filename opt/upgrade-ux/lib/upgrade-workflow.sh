# upgrade-workflow.sh

WORKFLOW_upgrade_DESCRIPTION="upgrade the operating system"
set -A WORKFLOWS ${WORKFLOWS[@]} "upgrade"

function WORKFLOW_upgrade {
    SourceStage "prep"
}
