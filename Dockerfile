FROM golang:1.19 AS builder

WORKDIR /app

COPY ./go .

RUN go build -o main

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]