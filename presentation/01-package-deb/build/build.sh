#!/bin/bash
set -ex

BUILD_JAVA="$(pwd)/build-java"
BUILD_PYTHON="$(pwd)/build-python"

mkdir -p ${BUILD_JAVA}
mkdir -p ${BUILD_PYTHON}

../java/gradlew bootJar -p ../java -PbuildDir=${BUILD_JAVA}
make -C ../cpp build-release
cp ../python/main.py ./build-python/