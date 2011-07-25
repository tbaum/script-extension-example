#!/bin/bash -e

eval `heroku config -s | grep NEO4J_URL`

curl -XPOST --data-binary @backend/config.ru $NEO4J_URL/script/config
curl -XPOST --data-binary @backend/Gemfile $NEO4J_URL/script/gemfile
curl -XPOST $NEO4J_URL/script/restart
