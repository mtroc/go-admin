#源镜像
FROM golang:latest
#设置工作目录
WORKDIR /app
#将服务器的go工程代码加入到docker容器中
ADD . .
#go构建可执行文件
RUN go build .
#暴露端口
EXPOSE 8000
#初起化
# RUN ./go-admin init -c ./config/docker.yml
# CMD ["./go-admin","init","-c","./config/docker.yml"] 
#"./go-admin" "init" "-c" "./config/docker.yml"
#最终运行docker的命令
# ENTRYPOINT  ["./go-admin","server","-c","./config/docker.yml"]