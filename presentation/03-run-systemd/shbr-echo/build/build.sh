#!/bin/bash
set -ex

make -C /cpp build-release

BUILD_JAVA="$(pwd)/build-java"
mkdir -p ${BUILD_JAVA}
/java/gradlew bootJar -p /java -PbuildDir=${BUILD_JAVA}

BUILD_PYTHON="$(pwd)/build-python"
mkdir -p ${BUILD_PYTHON}
cp /python/main.py ./build-python/
