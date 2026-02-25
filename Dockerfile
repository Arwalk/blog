FROM hugomods/hugo AS builder

ARG ZIG_VER=0.15.2

RUN apk add --no-cache curl wget tar bash xz asciidoctor

RUN curl https://ziglang.org/download/${ZIG_VER}/zig-$(uname -m)-linux-${ZIG_VER}.tar.xz -o zig-linux.tar.xz
RUN tar xf zig-linux.tar.xz
RUN mv zig-$(uname -m)-linux-${ZIG_VER}/ /opt/zig
COPY . /site
WORKDIR /site
RUN /opt/zig/zig build
RUN hugo build --minify --destination /public

FROM nginx:alpine
COPY --from=builder /public /usr/share/nginx/html
EXPOSE 80