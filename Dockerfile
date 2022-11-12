FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    clang-format \
    git

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
