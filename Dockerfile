FROM golang:1.8 AS builder

WORKDIR /go/src/app

COPY main.go ./

#build the binary with debug information removed
RUN go build -ldflags '-w -s' -a -installsuffix cgo -o /server

FROM scratch
COPY --from=0 /server /server
EXPOSE 8000
ENTRYPOINT ["./server"]