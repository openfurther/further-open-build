#!/bin/sh
VERSION="$1"
PWD=$PWD
if [[ $1 == "" ]]; then
	echo "Usage: ./checkout.sh <version>"
	echo "Version required"
	exit
fi
cd ../further-open-config/
git checkout ${VERSION}
cd ../further-open-core
git checkout ${VERSION}
cd ../further-open-datasources
git checkout ${VERSION}
cd ../further-open-db/
git checkout ${VERSION}
cd ../further-open-extras/
git checkout ${VERSION}
cd ../further-open-fabric-deployment/
git checkout ${VERSION}
cd ../further-open-i2b2/
git checkout ${VERSION}
cd ../further-open-osgi/
git checkout ${VERSION}
cd ../further-open-precompile/
git checkout ${VERSION}
cd ../further-open-terminology/
git checkout ${VERSION}
cd ../further-open-xquery/
git checkout ${VERSION}
cd ../further-open-precompile/
git checkout ${VERSION}
cd ${PWD}
