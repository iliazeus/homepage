FROM alpine:3.19 AS build
RUN apk add make

ARG TERA_CLI_VERSION="0.5.0"
ARG TERA_CLI_RELEASE="tera-cli-v$TERA_CLI_VERSION-x86_64-unknown-linux-musl"

RUN wget -O "./tera-cli.tar.gz" \
  "https://github.com/guangie88/tera-cli/releases/download/v$TERA_CLI_VERSION/$TERA_CLI_RELEASE.tar.gz"
RUN tar xzf "./tera-cli.tar.gz" "$TERA_CLI_RELEASE/tera" -O > "/bin/tera" && chmod a+x /bin/tera

COPY . .
RUN make clean && make

FROM scratch
COPY ./assets ./assets
COPY --from=build ./index.html ./
