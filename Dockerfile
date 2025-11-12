FROM docker:29.0.0-cli-alpine3.22
ENV WEBHOOK_VERSION=2.8.2
ENV SYSTEM_ARCH=linux-amd64
RUN wget -qO webhook.tar.gz https://github.com/adnanh/webhook/releases/download/$WEBHOOK_VERSION/webhook-$SYSTEM_ARCH.tar.gz && \
    tar -xzf webhook.tar.gz && \
    mv webhook-$SYSTEM_ARCH/webhook /usr/local/bin/webhook && \
    rm webhook.tar.gz && \
    rmdir webhook-$SYSTEM_ARCH
EXPOSE 9000
CMD ["webhook", "-nopanic" ,"-hooks", "/etc/webhook/hooks.yaml", "-hooks", "/etc/webhooks/hooks.json"]