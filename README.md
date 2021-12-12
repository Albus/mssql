[Idea from t-oster](https://github.com/t-oster/mssql-docker-zfs)


```shell
docker build -t mssql:2019 .
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=password' \
-p 1433:1433 -d --restart always -e 'MSSQL_PID=Express' \
--mount type=tmpfs,destination=/tmp,tmpfs-mode=1777,tmpfs-size=5Gb \
-v mssql:/var/opt/mssql/data:consistent \
--name mssql --hostname mssql --user root:root mssql:2019
```
