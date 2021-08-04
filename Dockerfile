# 
# Building Stage 
# 
FROM golang:1.7 AS builder 
RUN mkdir -p /build
WORKDIR /build
ADD . /build
RUN CGO_ENABLED=0 GOOS=linux go build ./app.go

# 
# Execution Stage
# 
FROM golang:1.7-alpine
RUN mkdir -p /app
COPY --from=builder /build /app 
WORKDIR /app
CMD ["./app"]