#!/bin/sh

htpasswd -Bbc /htpasswd $REGISTRY_USER $REGISTRY_PASSWORD

export REGISTRY_AUTH_HTPASSWD_PATH=/htpasswd

if [ ! -f "$REGISTRY_HTTP_TLS_CERTIFICATE" ]; then
	openssl req -newkey rsa:4096 -nodes -sha256 -keyout $REGISTRY_HTTP_TLS_KEY -x509 -days 365 -out $REGISTRY_HTTP_TLS_CERTIFICATE -subj "$REGISTRY_HTTP_TLS_SUBJ"
fi

/entrypoint.sh /etc/docker/registry/config.yml
