#!/bin/sh
FURTHER_ROOT=$PWD/..
echo $FURTHER_ROOT
cd ../further-open-precompile
ant -f build.precompile.xml -Dreference.further.dir=$FURTHER_ROOT
cd -
