#!/bin/bash
# -*- mode: shell-script; fill-column: 80 -*-
# $Id: exec_sequential.sh 65 2012-12-29 22:13:05Z mark $

# 

CMD_TOKEN=`echo "$*" | sed -e 's;[/ :];_;g'`

trap 'rm -rf ${CMD_TOKEN}-lock ${CMD_TOKEN}-code' 1 2 13 15
if mkdir ${CMD_TOKEN}-lock 2>/dev/null; then 
    echo "\"$@\" invoked with ${CMD_TOKEN}-lock"
    $@
    echo $? > ${CMD_TOKEN}-code
    rmdir ${CMD_TOKEN}-lock
else 
    while test -d ${CMD_TOKEN}-lock; do sleep 1; done
    echo "\"$@\" completed; ${CMD_TOKEN}-lock released"
fi

# following is not perfect, but it tries to cleanup all the *-code files.  Some
# proceses may report success when there's really a failure; but, if that
# happens, other's will have already reported the failure
if test -f ${CMD_TOKEN}-code; then
    EXIT_CODE=`cat ${CMD_TOKEN}-code`
    sleep 2
    rm -f ${CMD_TOKEN}-code
    exit ${EXIT_CODE}
fi
    
