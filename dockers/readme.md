#以下命令全在项目根目录运行
#先建立镜像
docker build -t go-admin:latest ../

#运行mysql
docker-compose up -d mysql
#运行redis
docker-compose up -d redis
#初起化数据库(第一次必跑) 死坑。。。
docker-compose up -d init
#运行后端
docker-compose up -d go-admin
#运行前端
docker-compose up -d go-admin-ui