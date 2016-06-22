#
# PKI image.
#
# Usage:
# $ docker run -v $(pwd)/certs:/etc/certs hkjn/pki myclient
#
FROM hkjn/alpine

MAINTAINER Henrik Jonsson <me@hkjn.me>

ENV GOPATH /go
ENV PATH $PATH:$GOPATH/bin
WORKDIR $GOPATH
RUN apk add --no-cache go git gcc musl-dev

RUN go get -tags nopkcs11 \
        github.com/cloudflare/cfssl/cmd/cfssl && \
    go get github.com/cloudflare/cfssl/cmd/cfssljson

COPY configs/ /etc/configs
COPY generate /usr/local/bin/

ENTRYPOINT ["generate"]

