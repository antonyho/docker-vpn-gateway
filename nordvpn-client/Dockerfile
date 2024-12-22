FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

ENTRYPOINT [ "/entrypoint.sh" ]