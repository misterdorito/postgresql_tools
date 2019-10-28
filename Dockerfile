FROM amazonlinux:latest

RUN yum install -y postgresql.x86_64

ENTRYPOINT ["tail", "-f", "/dev/null"]
