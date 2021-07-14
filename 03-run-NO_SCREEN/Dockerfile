FROM golang:1.16.4 as builder
WORKDIR /

ADD main.go main.go
RUN go build -o shbr-echo main.go
RUN chmod a+x shbr-echo


FROM ubuntu:focal

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y screen tmux curl net-tools iproute2
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/* \
    && rm -rf /var/log/apt\
    && rm -rf /root/.cache

COPY --from=builder /shbr-echo /shbr-echo

EXPOSE 10000
CMD ["/bin/tail", "-f", "/dev/null"]