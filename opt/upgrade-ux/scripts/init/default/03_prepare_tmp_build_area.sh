# 03_prepare_tmp_build_area.sh
# 
# create temporary work area and register removal exit task
# Security: GenerateTempDirName now uses mktemp -d and creates the directory
# atomically, eliminating the TOCTOU race that existed with the old RANDOM-based
# approach where mkdir followed a separate name-generation step.
BUILD_DIR="$( GenerateTempDirName )"   # returns something like "/tmp/upgrade-ux_aX3k9f" (already created)
StopIfError "Could not create build area via mktemp"
QuietAddExitTask "cleanup_build_area_and_end_program"

TMP_DIR="$BUILD_DIR"
