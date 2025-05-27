#!/bin/bash
service mariadb start
kill $(cat /var/run/mysqld/mysqld.pid)
exec mysqld