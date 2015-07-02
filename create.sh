#!/bin/bash

CWD=$(pwd)

docker run -i -t --name itorch -d -p 8888:8888 -v $CWD/volume:/root/volume reachlabkr/itorch:7

cd $CWD
