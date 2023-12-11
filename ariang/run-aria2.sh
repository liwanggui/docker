#!/bin/bash

nohup aria2c --enable-rpc --rpc-allow-origin-all \
        --rpc-secret=$RPC_SECRET --dir=$DOWNLOAD_DIR \
        --conf-path=/root/.aria2/aria2.conf &
