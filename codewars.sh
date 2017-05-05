#!/bin/bash

if [ -z "$1" ]; then
    echo "missing kata (path) name."
    exit 1;
fi
if [ -d "$1" ]; then
    echo "kata already exists."
    exit 1;
fi

PROJ=$1

mkdir $PROJ;

(cat <<-EOF
PROJ=$PROJ

include ../tools/c.mk
EOF
) > $PROJ/makefile;

(cat <<-EOF
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

int main(int argc, char* argv[]) {
  assert(1 == 0);
  return 0;
}
EOF
) > $PROJ/main.c;
