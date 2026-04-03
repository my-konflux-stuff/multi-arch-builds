FROM registry.access.redhat.com/ubi9/go-toolset@sha256:20df565583170ad5eee098f0c910f1efcad4f3a80edc0cfcc29f11db155acb01 AS builder
# FROM registry.fedoraproject.org/fedora:40
WORKDIR /src
COPY bing.go .
RUN go build -o bing bing.go

FROM registry.access.redhat.com/ubi9/ubi:9.4-1181
COPY --from=builder /src/bing /bin/bing
CMD ["/bin/bing"]
