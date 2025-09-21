#! /bin/bash

set -x

localedef -v -c -i ru_RU -f UTF-8 ru_RU.UTF-8

set -e

#RELEASE=
RELEASE='RELEASE=1'

rm -rf .git

go build -C /app/polygon2ejudge -o /usr/bin/p2e .
make /app/algolymp BIN_DIR=/usr/bin/algolymp

mkdir -p .config/polygon2ejudge
mkdir -p .config/algolymp

cat > ~/./config/polygon2ejudge/user_config.yaml <<'YAML'
version: user.2
api_key: 
api_secret: 
polygon_login: 
polygon_password:
ejudge_login: 
ejudge_password: 
nolint_string: ""
YAML

cat > ~/./config/algolymp/config.json <<'JSON'
{
        "ejudge": {
                "url": "http://ejudge-net/",
                "login": "ejudge",
                "password": "ejudge",
                "judgesDir": "/home/judges"
        },
        "system": {
                "editor": "vim"
        },
        "polygon": {
                "url": "https://polygon.codeforces.com",
                "apiKey": "",
                "apiSecret": ""
        }
}
JSON
