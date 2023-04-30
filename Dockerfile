FROM golang:latest AS builder
WORKDIR /usr/app
COPY *.go ./
RUN go build hello-go.go

FROM scratch
WORKDIR /usr/app
COPY --from=builder /usr/app .
CMD [ "./hello-go" ]