FROM alpine:3.18 AS builder

WORKDIR /tmp

COPY --from=golang:1.21-alpine3.18 /usr/local/go/ /usr/local/go/

ENV PATH="/usr/local/go/bin:${PATH}"

RUN apk add git && \
    git clone https://github.com/mrtimp/cdk-notifier.git && \
    cd cdk-notifier && \
    git checkout origin/feature/move-to-github-prs-from-issues && \
    GOARCH=amd64 GOOS=linux go build && \
    chmod 755 cdk-notifier

FROM alpine:3.18

#ARG VERSION=2.9.0
#ARG OS=linux
#ARG ARCH=amd64

#RUN apk add curl gzip && \
#	curl --silent --location "https://github.com/karlderkaefer/cdk-notifier/releases/download/v${VERSION}/cdk-notifier_${OS}_${ARCH}.gz" -o /tmp/cdk-notifier.gz && \
#	gunzip /tmp/cdk-notifier.gz && chmod +x /tmp/cdk-notifier && rm -rf /tmp/cdk-notifier.gz && \
#	mv /tmp/cdk-notifier /usr/local/bin/cdk-notifier && \
#	apk del curl gzip

COPY --from=builder /tmp/cdk-notifier/cdk-notifier /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
