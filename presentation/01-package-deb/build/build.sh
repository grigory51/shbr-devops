#!/bin/bash
set -ex

BUILD_JAVA="$(pwd)/build-java"
BUILD_PYTHON="$(pwd)/build-python"
BUILD_GO="$(pwd)/build-go"

mkdir -p ${BUILD_JAVA}
mkdir -p ${BUILD_PYTHON}
mkdir -p ${BUILD_GO}

env -i PATH="$PATH" make -C ../cpp build-release

../java/gradlew bootJar -p ../java -PbuildDir=${BUILD_JAVA} --no-daemon

cp ../python/main.py ./build-python/

go build -o ./build-go/shbr-echo ../go/main.go
