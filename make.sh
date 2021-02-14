#!/bin/sh

CONTAINER_RUNTIME="${1:-podman}" 

rm -rf out/
${CONTAINER_RUNTIME} build -t genie-build .
${CONTAINER_RUNTIME} run --name genie-built genie-build bash -c "make && make install"
${CONTAINER_RUNTIME} cp genie-built:/usr/libexec/genie ./out
${CONTAINER_RUNTIME} cp genie-built:/etc/genie.ini ./out
${CONTAINER_RUNTIME} rm genie-built
${CONTAINER_RUNTIME} rmi genie-build
ls -al out/

