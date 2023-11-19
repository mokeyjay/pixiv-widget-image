FROM php:8.0.30-fpm-bullseye

RUN apt update && \
    apt install -y nginx cron

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd

LABEL Author="mokeyjay<i@mokeyjay.com>"
LABEL Version="2023.11.20"
LABEL Description="Pixiv 每日排行榜小挂件运行环境"