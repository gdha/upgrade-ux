# upgrade-workflow.sh

WORKFLOW_upgrade_DESCRIPTION="upgrade the operating system"
set -A WORKFLOWS ${WORKFLOWS[@]} "upgrade"

function WORKFLOW_upgrade {
    # init will initialize CURRENT_STATUS variable
    SourceStage "init"

    proceed_to_next_stage "prep" && SourceStage "prep"
    proceed_to_next_stage "preremove" && SourceStage "preremove"
    proceed_to_next_stage "preinstall" && SourceStage "preinstall"
    proceed_to_next_stage "install" && SourceStage "install"
    proceed_to_next_stage "postinstall" && SourceStage "postinstall"
    proceed_to_next_stage "postremove" && SourceStage "postremove"
    proceed_to_next_stage "configure" && SourceStage "configure"
    proceed_to_next_stage "postexecute" && SourceStage "postexecute"

    SourceStage "cleanup"
}
