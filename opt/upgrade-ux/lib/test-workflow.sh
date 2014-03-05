# test-workflow.sh

WORKFLOW_test_DESCRIPTION="a simple test workflow"
set -A WORKFLOWS ${WORKFLOWS[@]} "test"

function WORKFLOW_test {
    SourceStage "test"
}
