FROM registry.access.redhat.com/ubi9/go-toolset@sha256:75ecb48dfaec6655bd589091902e3b9328c300befba34cb06fc5e7323099e17d AS builder
# FROM registry.fedoraproject.org/fedora:40
WORKDIR /src
COPY bing.go .
RUN go build -o bing bing.go

FROM registry.access.redhat.com/ubi9/ubi:9.7-1774415752
COPY --from=builder /src/bing /bin/bing
CMD ["/bin/bing"]
