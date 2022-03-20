set windows-powershell := true

version := "0.89.4"

build:
    docker run -v {{invocation_directory()}}:/src -p 1313:1313 klakegg/hugo:{{version}}-asciidoctor

server:
    docker run -v {{invocation_directory()}}:/src -p 1313:1313 klakegg/hugo:{{version}}-asciidoctor server -D -p 1313