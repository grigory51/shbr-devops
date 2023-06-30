FROM golang:1.20.4 as builder

WORKDIR /build

ADD main.go main.go

RUN go build -o shbr-echo main.go

FROM ubuntu:jammy-20230605

COPY --from=builder /build/shbr-echo /usr/bin/shbr-echo

CMD ["/usr/bin/shbr-echo"]