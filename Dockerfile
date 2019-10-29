FROM amazonlinux:latest

RUN yum install -y postgresql.x86_64
RUN yum install -y tar

ENTRYPOINT ["tail", "-f", "/dev/null"]
