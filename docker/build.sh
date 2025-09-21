#! /bin/bash

set -x

localedef -v -c -i ru_RU -f UTF-8 ru_RU.UTF-8

set -e

#RELEASE=
RELEASE='RELEASE=1'

rm -rf .git

go build -o /usr/bin/p2e ./polygon2ejudge
make ./algolymp BIN_DIR=/usr/bin/algolymp
