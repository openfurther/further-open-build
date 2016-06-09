#!/bin/sh
FURTHER_ROOT=$PWD/..
echo $FURTHER_ROOT
cd ../further-open-precompile
ant -f build.precompile.xml -Dreference.further.dir=$FURTHER_ROOT
cd -
pwd=$PWD
#for p in `echo further-open-core further-open-core/core further-open-core/core/core-api further-open-core/core/core-test further-open-core/ds further-open-osgi`; do
for p in `echo further-open-core further-open-core/core further-open-core/core/core-api further-open-core/core/core-test further-open-core/ds`; do
	cd $p
	echo $p
	mvn -N clean install
	cd $pwd
done

# now check if FURTHER_PASSWORD is set
if [[ "${FURTHER_PASSWORD}" == "" ]] ; then
	echo
	echo "FURTHER_PASSWORD must be set before proceeding"
else
	echo
	echo "'Run mvn clean install'"
fi
