build:
    docker run -v $(pwd):/src -p 1313:1313 klakegg/hugo:0.89.4-asciidoctor

server:
    docker run -v $(pwd):/src -p 1313:1313 klakegg/hugo:0.89.4-asciidoctor server -D -p 1313