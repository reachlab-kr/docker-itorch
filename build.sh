#!/bin/bash

CWD=$(pwd)

cd docker && docker build --tag reachlabkr/itorch:7 .

cd $CWD
