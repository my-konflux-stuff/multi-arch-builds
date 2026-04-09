FROM registry.access.redhat.com/ubi9/go-toolset@sha256:8c5aeac74b4b60dc2e5e44f6b639186b7ec2fec8f0eb9a36d4a32dcf8e255f52 AS builder
# FROM registry.fedoraproject.org/fedora:40
WORKDIR /src
COPY bing.go .
RUN go build -o bing bing.go

FROM registry.access.redhat.com/ubi9/ubi:9.7-1774415752
COPY --from=builder /src/bing /bin/bing
CMD ["/bin/bing"]
