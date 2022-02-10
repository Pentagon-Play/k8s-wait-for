# alpine:3.12.1
FROM alpine@sha256:c0e9560cda118f9ec63ddefb4a173a2b2a0347082d7dff7dc14272e7841a5b5a


ARG VCS_REF
ARG BUILD_DATE

ENV KUBE_LATEST_VERSION="v1.21.0"

RUN apk add --update --no-cache ca-certificates=20191127-r4 curl=7.78.0-r0 jq=1.6-r1 \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

ADD wait_for.sh /usr/local/bin/wait_for.sh

ENTRYPOINT ["wait_for.sh"]
