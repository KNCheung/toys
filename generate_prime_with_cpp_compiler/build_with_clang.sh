#!/usr/bin/env bash
if [ -n "$1" ]; then
    min_value=$1
else
    min_value=2
fi

if [ -n "$2" ]; then
    max_value=$2
else
    max_value=256
fi

max_depth=$((max_value+64))

clang++ -DMIN_VALUE=$min_value -DMAX_VALUE=$max_value -std=c++14 -ferror-limit=${max_depth} -ftemplate-depth=${max_depth} main.cpp -o build/wtf 2>&1 | grep error
