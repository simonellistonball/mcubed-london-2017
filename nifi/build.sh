#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm $DIR/docker/custom/*.nar

for bundle in $DIR/nifi-*
do 
  pushd $bundle
  mvn clean package -DskipTests && cp *-nar/target/*.nar $DIR/docker/custom/
  popd 
done 

pushd $DIR/docker/
./build.sh

popd
