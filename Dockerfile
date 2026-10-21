FROM php:8.4.27-fpm-trixie

RUN apt update && \
    apt install -y nginx cron

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd

LABEL Author="mokeyjay<i@mok.moe>"
LABEL Version="2026.10.21"
LABEL Description="Pixiv 每日排行榜小挂件运行环境"