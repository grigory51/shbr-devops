#!/bin/bash
set -ex

../java/gradlew bootJar -p ../java -PbuildDir=$(pwd)
cp ../python/main.py ./