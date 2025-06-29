FROM alpine:3

RUN mkdir hello
ADD text/*.txt hello
# menambahkan semua file extensi txt dari folder text
# ke folder hello di dalam docker image yang sudah dibuat
CMD cat "hello/world.txt"
