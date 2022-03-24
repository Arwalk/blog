set windows-powershell := true

version := "0.95.0"

build:
    docker run --rm -v {{invocation_directory()}}:/src -p 1313:1313 klakegg/hugo:{{version}}-asciidoctor

server:
    docker run --rm -v {{invocation_directory()}}:/src -p 1313:1313 klakegg/hugo:{{version}}-asciidoctor server -D -p 1313