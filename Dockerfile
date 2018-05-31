FROM postgres:10.3-alpine
LABEL maintainer="Rodrigo de Avila <rodrigo.avila@mailtop.com.br>"

RUN wget "s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    apk add --update groff less python && \
    rm /var/cache/apk/* && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle

COPY dump.sh dump.sh

CMD ["bash", "dump.sh"]
