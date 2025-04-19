.. -*- coding: utf-8; fill-column: 88; -*-

.. organize section decoration according to the Python's Style Guide
   for documenting as given here:
   https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#sections

   # with overline, for parts
   * with overline, for chapters
   =, for sections
   -, for subsections
   ^, for subsubsections
   ", for paragraphs

   We start assuming our "top level" is a chapter

   xxx .. include:: <isonum.txt>
   xxx .. include:: <isopub.txt>
   these includes add UTF-8 unicode bits

   try to use the ReST subset of Sphinx for Github rendering

*******************
TestProgramTemplate
*******************

Create a directory to use as the Workspace directory.  Name it as you like, in this
example, ``Workspace``; cd it.  Clone the ``TestProgramTemplate`` repository into it as
the ``test-code`` directory:

.. code:: bash

  [adhoc]$ mkdir Workspace
  [adhoc]$ cd Workspace
  [Workspace]$ git clone git@github.com:jmderic/TestProgramTemplate.git test-code
  ...

After the clone, do an out-of-tree build of the simple test program and run it:

.. code:: bash

  [Workspace]$ ./test-code/dev_tools/cmake_build.sh
  ...
  [Workspace]$ ./build_20250419_100938/test 
  Hello, World!
  [Workspace]$ 

The datestamp on your build directory may vary.  Now you can modify the source code in
``./test-code/main.cpp`` and do a re-build and re-run:

.. code:: bash

  [Workspace]$ cd build_20250419_100938
  [build_20250419_100938]$ BLD_DIR=`pwd` BLD_TYPE=rebuild source ../test-code/dev_tools/build_vars && ninja -v -k 0
  ...
  [build_20250419_100938]$ ./test 
  Hello, Bubba!
  [build_20250419_100938]$ 

Or, alternatively, after modifying ``./test-code/main.cpp``, you could run the initial
cmake_build.sh command in the context shown and create a new out-of-tree build directory
with a different date stamp.
