# -*- Mode: Makefile; fill-column: 80 -*-
# $Id: Makefile 85 2013-01-26 22:42:50Z mark $

# Makefile_local is a of a subdir file where subdir makes an executable

# sample build line after cd'ing to this directory:
# /appl/pm/vendor/make/sol-sparc/3.82/bin/make -r -k -j 40

SOURCEROOT := ${shell ls build_common/Make.rules > /dev/null 2>&1; \
                while test x$$? != x0; \
                do if test `pwd` = /; then exit 1; fi; \
                cd ..; ls build_common/Make.rules > /dev/null 2>&1; done; \
                pwd }

# 'all' target _must_ be defined first and by the ALL_GOALS variable enabling
# recursive call with a single goal; note: currently the order of building the
# targets is not guaranteed
ALL_GOALS := test01
CLEAN_GOALS:=$(ALL_GOALS:%=clean_%)
.PHONY: all clean maketest ${ALL_GOALS} ${CLEAN_GOALS}
all: ${ALL_GOALS}

clean: ${CLEAN_GOALS}

include ${SOURCEROOT}/build_common/Make.rules

ifeq (${SINGLE_GOAL},true)
# make called for a single goal

## TARGETS
#following is an aid for testing changes to this or included files
maketest:
	echo ${SOURCEROOT}

## following items apply to multiple specific targets
$(LIBDIR)/%.so :
	$(MAKE) -C ${SOURCEROOT} $*

## for all the specific targets below, see target and source specification in
## this dir's Make.source_lists

## test01
#test01_JMDLIBLIST:=jmdlog jmdprocess
test01_JMDLIBLIST:=
$(BINDIR)/test01 : ${test01_JMDLIBLIST:%=$(LIBDIR)/lib%.so}
# current list of items we can add to on a target by target basis; other items
# can be added but must be templated (i.e., $(${GOALS}_LIBS) ) in Make.rules
test01_DEFINES :=
test01_INCLUDES := -I../nucleus -I../logging -I../reactor -I../process -I$(BOOST_HOME)
#test01_LIBS := -L../lib ${test01_JMDLIBLIST:%=-l%} -L$(BOOST_HOME)/lib -lboost_program_options -lboost_regex $(BOOST_THREAD_LIB) -lboost_system
test01_LIBS := -L../lib ${test01_JMDLIBLIST:%=-l%} -L/usr/lib/boost148 -lboost_program_options -lboost_regex $(BOOST_THREAD_LIB) -lboost_system
### test01_CPPFLAGS := -library=rwtools7_std -xpagesize=4M -xprefetch_level=2
### test01_LDFLAGS := -library=rwtools7_std -xpagesize=4M -xprefetch_level=2

endif # make called for a single goal
