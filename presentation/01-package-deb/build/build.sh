#!/bin/bash
set -ex

../java/gradlew bootJar -p ../java -PbuildDir=$(pwd)
make -C ../cpp build-release
cp ../python/main.py ./