# 03_prepare_tmp_build_area.sh
# 
# create temporary work area and register removal exit task
#BUILD_DIR="$(mktemp)"   # on HPUX is returns a string; on linux it creates a temporary filename 
BUILD_DIR="$( GenerateTempDirName )"   # returns something like "/tmp/upgrade-ux_12345"
if [[ ! -d "$BUILD_DIR" ]]; then
    mkdir -p "$BUILD_DIR"
    StopIfError "Could not create build area '$BUILD_DIR'"
    QuietAddExitTask cleanup_build_area_and_end_program
fi

TMP_DIR="$BUILD_DIR"
if [[ ! -d "$TMP_DIR" ]] ; then
    mkdir -p "$TMP_DIR"
    StopIfError "Could not create TMP_DIR=$TMP_DIR"
    QuietAddExitTask cleanup_build_area_and_end_program
fi
