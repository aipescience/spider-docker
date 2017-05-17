Docker files for a Spider-Engine MariaDB cluster
================================================

Based on the Dockerimages of the MariaDB project. See also:

* https://hub.docker.com/_/mariadb/
* https://github.com/docker-library/mariadb/blob/master/10.1/Dockerfile
* https://github.com/docker-library/mariadb/blob/master/10.1/docker-entrypoint.sh

Setup
-----

1. Configure /etc/hosts

    ```
    172.16.10.100 spider00.docker spider00
    172.16.10.101 spider01.docker spider01
    172.16.10.102 spider02.docker spider02
    172.16.10.103 spider03.docker spider03
    172.16.10.104 spider04.docker spider04
    ```

2. Create a network for the spider nodes

    ```
    docker network create --gateway 172.16.10.1 --subnet 172.16.10.0/24 spider
    ```

3. Build docker image

    ```
    docker-compose build
    ```

4. Run the containers

    ```
    docker-compose up
    ```

Usage
-----

The different MariaDB instances are then accessible on the hosts spider00 - spider04 on port `3306`.

```
mysql -h spider00 -uroot
```

or

```
mysql -h spider00
```

or using this `~/.my.cnf`:

```
[client]
user=root
password=0000
```
