FROM registry:2
MAINTAINER Jean-Avit Promis "docker@katagena.com"

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV REGISTRY_PASSWORD registry-password

ENTRYPOINT ["/start.sh"]
