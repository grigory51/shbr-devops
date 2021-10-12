FROM golang:1.16.4 as builder
WORKDIR /

ADD main.go main.go
RUN go build -o shbr-echo main.go
RUN chmod a+x shbr-echo


FROM ubuntu:focal
COPY --from=builder /shbr-echo /shbr-echo

EXPOSE 10000
CMD ["/shbr-echo"]