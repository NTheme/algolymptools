FROM fedora:40 AS dependencies

RUN dnf -y update && dnf -y install go vim pandoc

RUN dnf clean all

FROM dependencies AS build

WORKDIR /app
COPY . /app

RUN /app/docker/build.sh

COPY docker/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
