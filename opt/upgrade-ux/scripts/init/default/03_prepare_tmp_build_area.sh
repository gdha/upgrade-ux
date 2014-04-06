# 03_prepare_tmp_build_area.sh
# 
# create temporary work area and register removal exit task
BUILD_DIR="$(mktemp)"
[[ ! -d $BUILD_DIR ]] && mkdir -p $BUILD_DIR
StopIfError "Could not create build area '$BUILD_DIR'"
QuietAddExitTask cleanup_build_area_and_end_program

TMP_DIR=$BUILD_DIR
if [[ ! -d $TMP_DIR ]] ; then
    mkdir -p $TMP_DIR
    StopIfError "Could not create TMP_DIR=$TMP_DIR"
    QuietAddExitTask cleanup_build_area_and_end_program
fi
