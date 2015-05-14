# -*- Mode: Makefile; fill-column: 80 -*-
# $Id: Makefile 88 2013-05-17 05:36:30Z mark $

SOURCEROOT := ${shell ls build_common/Make.rules > /dev/null 2>&1; \
                while test x$$? != x0; \
                do if test `pwd` = /; then exit 1; fi; \
                cd ..; ls build_common/Make.rules > /dev/null 2>&1; done; \
                pwd }

ALL_EXES := test01
#ALL_LIBS := libjmdlog libjmdprocess
ALL_LIBS :=
ALL_GOALS := $(ALL_EXES)
CLEAN_GOALS:=$(ALL_EXES:%=clean_%) $(ALL_LIBS:%=clean_%)
.PHONY: all clean maketest ${ALL_GOALS} ${CLEAN_GOALS}
all: ${ALL_GOALS}

clean: ${CLEAN_GOALS}
	@rm -f *-code
	@rm -rf bin lib

SEQ_PROG:=${SOURCEROOT}/build_common/exec_sequential.sh

ifeq (${MAKECMDGOALS},${empty})
GOALS:=${ALL_GOALS}
else
GOALS:=$(MAKECMDGOALS:all=${ALL_GOALS})
endif

$(info $$TOP make called for goal: "${GOALS}"; flags: "${MAKEFLAGS}"; \
overrides: "${MAKEOVERRIDES}")

test01 :
	$(MAKE) -C test01_src $@ FROM_TOP=true

clean_test01 :
	$(MAKE) -C test01_src $@

# lib example
#libjmdlog clean_libjmdlog :
#	$(SEQ_PROG) $(MAKE) -C logging $@
