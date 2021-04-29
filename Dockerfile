FROM golang:latest AS builder
WORKDIR /app

COPY main.go /app
RUN go mod init alissongomes.dev/codeeducation && \
    go install . && \
    go build -ldflags "-s -w"

FROM scratch
COPY --from=builder /app/codeeducation /
CMD [ "/codeeducation" ]