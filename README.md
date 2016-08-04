Docker files for a Spider-Engine MariaDB cluster
================================================

Based on the Dockerimages of the MariaDB project. See also:

* https://hub.docker.com/_/mariadb/
* https://github.com/docker-library/mariadb/blob/master/10.1/Dockerfile
* https://github.com/docker-library/mariadb/blob/master/10.1/docker-entrypoint.sh

Build docker image
------------------

```
docker build -t spider .
```

Create a network for the spider nodes
-------------------------------------

```
docker network create spider
```

Run the containers
------------------

(e.g. for one head node and four shard nodes)

```
docker run -d --name spider00 --net=spider -p 33060:3306 -e MYSQL_ROOT_PASSWORD=0000 spider
docker run -d --name spider01 --net=spider -p 33061:3306 -e MYSQL_ROOT_PASSWORD=0000 spider
docker run -d --name spider02 --net=spider -p 33062:3306 -e MYSQL_ROOT_PASSWORD=0000 spider
docker run -d --name spider03 --net=spider -p 33063:3306 -e MYSQL_ROOT_PASSWORD=0000 spider
docker run -d --name spider04 --net=spider -p 33064:3306 -e MYSQL_ROOT_PASSWORD=0000 spider
```

The different MySQL instances are then accessible on the host on port `33060`-`33064`. You can connect using

```
mysql -h 127.0.0.1 -P 33060 -uroot -p
```

or

```
mysql -P 33060
```

or using this `~/.my.cnf`:

```
[client]
user=root
password=0000
host=127.0.0.1
```
