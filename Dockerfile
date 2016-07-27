# mumble-server
#
# Version 1.0.0

FROM alpine:3.4
MAINTAINER Thomas Ingvarsson <ingvarsson.thomas@gmail.com>

RUN apk add --no-cache murmur

CMD ["murmurd", "-ini", "/etc/murmur.ini", "-fg"]