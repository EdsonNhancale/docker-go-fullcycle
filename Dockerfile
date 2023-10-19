FROM golang:1.4-alpine AS builder

WORKDIR /go/src/app

COPY ./ ./

RUN go build -o /server

FROM alpine:2.6
WORKDIR /
COPY --from=0 /server /server
EXPOSE 8000
ENTRYPOINT ["/server"]
