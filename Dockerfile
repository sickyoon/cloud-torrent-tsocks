FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /root/simple-torrent
ENV PATH=$HOME/go/bin:$PATH
RUN git clone https://github.com/sickyoon/simple-torrent.git . && \
  go get -v -u github.com/shuLhan/go-bindata/... && \
  go get -v -t -d ./... && \
  cd static && \
  sh generate.sh

ENV GO111MODULE=on CGO_ENABLED=0

# HACK UNTIL UPSTREAM TORRENT REPO IS MERGED
RUN go mod vendor

RUN go build -mod=vendor -ldflags "-s -w -X main.VERSION=$(git describe --tags)" -o /usr/local/bin/simple-torrent
############################
# STEP 2 build a small image
############################
FROM alpine
COPY --from=builder /usr/local/bin/simple-torrent /usr/local/bin/simple-torrent
RUN apk update && apk add ca-certificates
ENTRYPOINT ["simple-torrent"]
