#!/bin/sh
FURTHER_ROOT=$PWD/..
echo $FURTHER_ROOT
pwd=$PWD
cd ../further-open-precompile
ant -f build.precompile.xml -Dreference.further.dir=$FURTHER_ROOT
status=$?
if [[ $status -ne 0 ]]; then
	echo
	echo "There was an error during precompile."
	echo
	exit;
fi
cd $pwd
pwd=$PWD
for module in `echo further-open-core further-open-core/core further-open-core/core/core-api further-open-core/core/core-test further-open-core/ds`; do
	cd $module
	echo $module
	mvn -N clean install
	status=$?
	cd $pwd
	if [[ $status -eq 0 ]] ; then
		echo "Continuing..."
	else
		echo
		echo "There was an error compiling module: $module..."
		echo
		exit;
	fi
done

# now check if FURTHER_PASSWORD is set
if [[ "${FURTHER_PASSWORD}" = "" ]] ; then
	echo
	echo "FURTHER_PASSWORD must be set before proceeding"
else
	echo
	echo "Run 'mvn clean install'"
fi
