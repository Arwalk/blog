ARG HUGO_VERSION="0.95.0"
FROM klakegg/hugo:$HUGO_VERSION-asciidoctor

build:
    COPY --dir . /src
    RUN --entrypoint
    SAVE ARTIFACT /src/public