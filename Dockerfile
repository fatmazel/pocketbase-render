FROM alpine:latest

RUN apk add --no-cache ca-certificates unzip wget zip

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.23.12/pocketbase_0.23.12_linux_amd64.zip -O /tmp/pb.zip \
    && unzip /tmp/pb.zip -d /pb/ \
    && rm /tmp/pb.zip

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data_v2", "--origins=*"]
