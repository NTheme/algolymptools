#! /bin/bash

set -x

localedef -v -c -i ru_RU -f UTF-8 ru_RU.UTF-8

set -e

#RELEASE=
RELEASE='RELEASE=1'

rm -rf .git

go build -C /app/polygon2ejudge -o /usr/bin/p2e .
make -C /app/algolymp BIN_DIR=/usr/bin/algolymp
