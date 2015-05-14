# no shebag ... must be sourced -*- mode: shell-script; fill-column: 80 -*-
# $Id: lib_path_runtime_fixup.sh 54 2012-12-29 08:19:22Z mark $

if [ -d $BUILDROOT ]; then
    export LD_LIBRARY_PATH=${ADHOC_LIB_PATH:-/nopath_here}:$BUILDROOT/lib:$LD_LIBRARY_PATH
else

    echo "BUILDROOT must point to the top of the build tree"
    echo "\"$BUILDROOT\" is not a directory"
fi
