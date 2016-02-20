#!/bin/bash

htpasswd -Bbc /htpasswd $REGISTRY_USER $REGISTRY_PASSWORD

export REGISTRY_AUTH_HTPASSWD_PATH=/htpasswd

/bin/registry /etc/docker/registry/config.yml
