FROM ubuntu:18.04

ARG pg_version

RUN apt-get update
RUN apt-get install nano
RUN apt-get install unzip
RUN apt-get install -y curl ca-certificates gnupg

RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update

RUN apt-get install -y postgresql-client:${pg_version}

ENTRYPOINT ["tail", "-f", "/dev/null"]
