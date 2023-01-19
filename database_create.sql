Enter password: ********
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 85
Server version: 10.8.3-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> drop database CDA_TEST_DATABASE;
Query OK, 0 rows affected (0.449 sec)

MariaDB [(none)]> create database CDA_TEST_DATABASE;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> use  CDA_TEST_DATABASE
Database changed
MariaDB [CDA_TEST_DATABASE]> create table mvx_cliente (id int primary key, nome varchar(4000) not null);
Query OK, 0 rows affected (0.503 sec)

MariaDB [CDA_TEST_DATABASE]> create table mvx_produto (id int primary key, nome varchar(4000) not null);
Query OK, 0 rows affected (0.464 sec)

MariaDB [CDA_TEST_DATABASE]>  create table venda (id int primary key, cliente_id int not null, data date not  null);
Query OK, 0 rows affected (0.269 sec)

MariaDB [CDA_TEST_DATABASE]> drop table venda;
Query OK, 0 rows affected (0.385 sec)

MariaDB [CDA_TEST_DATABASE]>  create table mvx_venda (id int primary key, cliente_id int not null, data date not  null);
Query OK, 0 rows affected (0.290 sec)

MariaDB [CDA_TEST_DATABASE]> alter table mvx_venda add constraint fkclienteid foreign key (cliente_id) references mvx_cliente (id);
Query OK, 0 rows affected (1.655 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CDA_TEST_DATABASE]> create table mvx_venda_itens (id int primary key, venda_id int not null, produto_id int not null, valor varchar(4000) not null, quantidade varchar(4000) not null);
Query OK, 0 rows affected (0.300 sec)

MariaDB [CDA_TEST_DATABASE]> alter table mvx_venda_itens add constraint fkvenda_id foreign key (venda_id) references mvx_venda (id);
Query OK, 0 rows affected (0.531 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CDA_TEST_DATABASE]> alter table mvx_venda_itens add constraint fkproduto_id foreign key (produto_id) references mvx_produto (id);
Query OK, 0 rows affected (0.701 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CDA_TEST_DATABASE]> desc mvx_cliente;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| id    | int(11)       | NO   | PRI | NULL    |       |
| nome  | varchar(4000) | NO   |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
2 rows in set (0.163 sec)

MariaDB [CDA_TEST_DATABASE]> desc mvx_produto;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| id    | int(11)       | NO   | PRI | NULL    |       |
| nome  | varchar(4000) | NO   |     | NULL    |       |
+-------+---------------+------+-----+---------+-------+
2 rows in set (0.018 sec)

MariaDB [CDA_TEST_DATABASE]> desc mvx_venda;
+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| id         | int(11) | NO   | PRI | NULL    |       |
| cliente_id | int(11) | NO   | MUL | NULL    |       |
| data       | date    | NO   |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
3 rows in set (0.070 sec)

MariaDB [CDA_TEST_DATABASE]> desc mvx_venda_itens;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| id         | int(11)       | NO   | PRI | NULL    |       |
| venda_id   | int(11)       | NO   | MUL | NULL    |       |
| produto_id | int(11)       | NO   | MUL | NULL    |       |
| valor      | varchar(4000) | NO   |     | NULL    |       |
| quantidade | varchar(4000) | NO   |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
5 rows in set (0.137 sec)
