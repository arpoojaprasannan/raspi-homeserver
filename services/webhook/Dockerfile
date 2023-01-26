FROM        thecatlady/webhook
RUN         apk update && apk add --no-cache docker-cli
WORKDIR     /config
EXPOSE      9000
ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/webhook"]
CMD         ["-verbose", "-hotreload", "-hooks=hooks.yml"]