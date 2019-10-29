FROM amazonlinux:latest

RUN yum install -y postgresql.x86_64
RUN yum install -y tar
RUN yum install -y unzip
RUN yum install -y nano
RUN yum install -y procps

ENTRYPOINT ["tail", "-f", "/dev/null"]
