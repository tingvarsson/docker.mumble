FROM alpine:latest
LABEL maintainer Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

ARG BUILD_DATE
ARG VCS_REF
ARG MUMBLE_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="tingvarsson/mumble"
LABEL org.label-schema.description="Mumble server image based on Alpine Linux"
LABEL org.label-schema.vcs-url="https://github.com/tingvarsson-docker/docker.mumble"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.version=$MUMBLE_VERSION

RUN apk add --no-cache \
      murmur \
      qt5-qtbase-mysql \
      qt5-qtbase-postgresql

VOLUME ["/config"]

ADD ["murmur.ini", "/config/murmur.ini"]

EXPOSE 64738
EXPOSE 64738/udp

CMD ["murmurd", "-fg", "-ini", "/config/murmur.ini"]
