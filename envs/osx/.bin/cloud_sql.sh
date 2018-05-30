#!/bin/bash

PATH_TO_THIS_DIR=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

cd ${PATH_TO_THIS_DIR}
curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
chmod +x cloud_sql_proxy
