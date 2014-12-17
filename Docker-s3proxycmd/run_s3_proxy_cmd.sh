#!/bin/bash

printf "access_key=%s\nsecret_key=%s\nproxy_host=%s\nproxy_port=%s" "$access_key" "$secret_key" "$proxy_host" "$proxy_port" > /tmp/.s3cfg

s3cmd --config /tmp/.s3cfg $@