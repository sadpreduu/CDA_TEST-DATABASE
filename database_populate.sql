Enter password: ********
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 89
Server version: 10.8.3-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| cda1               |
| cda_test_database  |
| gip                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.001 sec)

MariaDB [(none)]> use cda_test_database
Database changed
MariaDB [cda_test_database]> show tables;
+-----------------------------+
| Tables_in_cda_test_database |
+-----------------------------+
| mvx_cliente                 |
| mvx_produto                 |
| mvx_venda                   |
| mvx_venda_itens             |
+-----------------------------+
4 rows in set (0.001 sec)

MariaDB [cda_test_database]> load data local infile 'C:/Users/pedri/Documents/data/cliente.csv'
    -> into table mvx_cliente
    -> fields terminated by ','
    -> enclosed by '"'
    -> lines terminated by '\r\n'
    -> ignore 1 lines
    -> (id, nome);
Query OK, 4 rows affected (0.132 sec)
Records: 4  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [cda_test_database]> load data local infile 'C:/Users/pedri/Documents/data/produto.csv'
    -> into table mvx_produto
    -> fields terminated by ','
    -> enclosed by '"'
    -> lines terminated by '\r\n'
    -> ignore 1 lines
    -> (id, nome);
Query OK, 47 rows affected (0.138 sec)
Records: 47  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [cda_test_database]> load data local infile 'C:/Users/pedri/Documents/data/venda.csv'
    -> into table mvx_venda
    -> fields terminated by ','
    -> enclosed by '"'
    -> lines terminated by '\r\n'
    -> ignore 1 lines
    -> (id, cliente_id, data);
Query OK, 37 rows affected (0.112 sec)
Records: 37  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [cda_test_database]> load data local infile 'C:/Users/pedri/Documents/data/venda_itens.csv'
    -> into table mvx_venda_itens
    -> fields terminated by ','
    -> enclosed by '"'
    -> lines terminated by '\r\n'
    -> ignore 1 lines
    -> (id, venda_id, produto_id, valor, quantidade);
Query OK, 87 rows affected (0.165 sec)
Records: 87  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [cda_test_database]> show tables;
+-----------------------------+
| Tables_in_cda_test_database |
+-----------------------------+
| mvx_cliente                 |
| mvx_produto                 |
| mvx_venda                   |
| mvx_venda_itens             |
+-----------------------------+
4 rows in set (0.001 sec)

MariaDB [cda_test_database]> select * from mvx_cliente;
+-------+----------------+
| id    | nome           |
+-------+----------------+
| 21856 | Jar Jar Binks  |
| 39550 | R2D2           |
| 44993 | C-3PO          |
| 49400 | Jabba the Hutt |
+-------+----------------+
4 rows in set (0.000 sec)

MariaDB [cda_test_database]> select * from mvx_produto;
+-------+--------------------------------------------------+
| id    | nome                                             |
+-------+--------------------------------------------------+
|   447 | ESC NOVICA ADAPT (114)                           |
|   705 | ABS NAT L24 P16 UND GEL ESP C/ABAS (2090)        |
|   706 | FDA GERIAMAX ADULTO (G) 8 UND (765)              |
|   707 | FDA GERIAMAX ADULTO (M) 9 UND(3159)              |
|  1532 | SABAO 500G URCA PASTA                            |
|  1568 | ABS DEFINITY 1A1 8 UND S/ ABAS (1163)            |
|  1569 | ABS DEFINITY 1A1 8 UND C/ABAS (1164)             |
|  1629 | AMAC URCA 5 L BRISA AZUL                         |
|  2040 | BATATA STAX 156G SOUR CREAM&ONIO                 |
|  2041 | BATATA STAX 156G CHEDDAR                         |
|  2156 | BATATA STAX 163 G ORIGINAL                       |
|  2475 | TODDYNHO 200ML TRADICIONAL                       |
|  5663 | TOA UME NATURAL BABY L100 P80 (3130)             |
| 14243 | B CEREAL (D) 22G NUTRY AVEIA/BAN/MEL             |
| 14610 | TOA UMED 40 UND BACKYARDIGANS CONF (3725)        |
| 22681 | BISC 150G TODDY COOKIES ORIGINAL                 |
| 27780 | MR MUSC COZINHA LR AP 500ML 315514               |
| 29160 | LAVA ROUPA 5 L LIQ URCA AZUL                     |
| 30824 | LAVA ROUPA 5 L LIQ URCA VERDE                    |
| 38353 | PROT SOLAR 200ML NIVEA FPS 50                    |
| 44036 | DESOD 42G INTENS CONTR CLINICAL FEM              |
| 44037 | DESOD 42G INTENS CONTR CLINICAL MASC             |
| 45894 | AMAC CONC URCA 1 L BRISA DA PRIMAV               |
| 48947 | AGUA MICELLAIR 200ML NIVEA 7EM1                  |
| 50032 | MOLHO 60ML TABASCO PEPPER SAUCE RED ORIGINAL     |
| 50033 | MOLHO 60ML TABASCO PEPPER SAUCE GREEN            |
| 51610 | BISC 150G TODDY COOKIES CHOCOLATE                |
| 52110 | ESPJ ESFREBOM C/6 MULTIUSO + POTE GRATIS         |
| 54534 | PRENDEDOR ESFREBOM PLASTICO EMBOR. 12 UND        |
| 54669 | SACO P/ LIXO BRILHUS ROLO 50L C/ 30 UND          |
| 59113 | SABONETE 85G NIVEA HIDRATANTE TALCO&OLEO AMEN    |
| 59215 | HIDRATANTE 400ML NIVEA FIRMADOR TODO TIPO D PEL  |
| 60211 | DESENGORDURANTE 500 ML URCA                      |
| 60663 | AMENDOIM 100 G SEM PELE MANIX                    |
| 60852 | TONICO FACIAL 200ML NIVEA CONTRLE DE BRILHO      |
| 63731 | BISC 350 G MABEL ROSQUINHAS CHOCOLATE            |
| 64122 | BISC 350 G MABEL ROSQUINHAS BANANA CANELA        |
| 64231 | MASCARA DESCARTAVEL NATURAL CLEAN C/ 50 UND      |
| 64255 | FANDANGOS 50 G QUEIJO                            |
| 64257 | FANDANGOS 52 G QUEIJO                            |
| 64353 | BATATA LAYS 80 G SOUR CREAM                      |
| 65324 | MASCARA CIRUGICA DESCARTAVEL NAT CLEAN PROF C/50 |
| 65720 | DORITOS 140G SWEET CHILLI                        |
| 65781 | BATATA PALHA 215 G ELMA CHIPS TRADICIONAL        |
| 65804 | AZEIT ANDORINHA 500ML EV - IMP                   |
| 66197 | FANDANGOS 45 G QUEIJO                            |
| 66294 | GIN 250 ML ROCK'S PET POCKET                     |
+-------+--------------------------------------------------+
47 rows in set (0.001 sec)

MariaDB [cda_test_database]> select * from mvx_venda;
+---------+------------+------------+
| id      | cliente_id | data       |
+---------+------------+------------+
| 3966540 |      39550 | 2021-08-02 |
| 3971036 |      39550 | 2021-08-05 |
| 3973692 |      39550 | 2021-08-09 |
| 3976647 |      39550 | 2021-08-11 |
| 3976738 |      39550 | 2021-08-11 |
| 3978424 |      39550 | 2021-08-12 |
| 3979238 |      44993 | 2021-08-13 |
| 3980600 |      21856 | 2021-08-16 |
| 3981477 |      39550 | 2021-08-17 |
| 3983610 |      39550 | 2021-08-18 |
| 3984006 |      39550 | 2021-08-18 |
| 3987719 |      39550 | 2021-08-23 |
| 3989670 |      39550 | 2021-08-24 |
| 3991743 |      39550 | 2021-08-26 |
| 3991746 |      39550 | 2021-08-26 |
| 3992191 |      39550 | 2021-08-26 |
| 3993373 |      44993 | 2021-08-27 |
| 3994929 |      39550 | 2021-08-30 |
| 3996380 |      21856 | 2021-08-31 |
| 3998760 |      39550 | 2021-09-01 |
| 4001825 |      21856 | 2021-09-05 |
| 4005830 |      49400 | 2021-09-09 |
| 4006602 |      39550 | 2021-09-09 |
| 4007943 |      44993 | 2021-09-10 |
| 4009140 |      44993 | 2021-09-13 |
| 4010241 |      49400 | 2021-09-14 |
| 4010244 |      49400 | 2021-09-14 |
| 4010256 |      39550 | 2021-09-14 |
| 4010257 |      21856 | 2021-09-14 |
| 4011062 |      39550 | 2021-09-14 |
| 4013258 |      21856 | 2021-09-16 |
| 4014604 |      39550 | 2021-09-17 |
| 4019409 |      39550 | 2021-09-22 |
| 4020602 |      21856 | 2021-09-23 |
| 4024205 |      39550 | 2021-09-28 |
| 4026958 |      49400 | 2021-09-29 |
| 4030567 |      39550 | 2021-10-04 |
+---------+------------+------------+
37 rows in set (0.000 sec)

MariaDB [cda_test_database]> select * from mvx_venda_itens;
+----+----------+------------+-------+------------+
| id | venda_id | produto_id | valor | quantidade |
+----+----------+------------+-------+------------+
|  1 |  3966540 |       5663 | 11.31 | 1.000      |
|  2 |  3966540 |      51610 | 21.96 | 4.000      |
|  3 |  3966540 |       2156 | 9.21  | 1.000      |
|  4 |  3971036 |       1568 | 18.9  | 10.000     |
|  5 |  3971036 |       1569 | 20.79 | 11.000     |
|  6 |  3971036 |       2475 | 7.38  | 6.000      |
|  7 |  3971036 |      54669 | 11.49 | 1.000      |
|  8 |  3971036 |       2156 | 9.21  | 1.000      |
|  9 |  3973692 |      65781 | 19.08 | 3.000      |
| 10 |  3973692 |       2156 | 9.21  | 1.000      |
| 11 |  3976647 |      60663 | 11.82 | 3.000      |
| 12 |  3976738 |      30824 | 23.5  | 1.000      |
| 13 |  3976738 |      65324 | 18.91 | 1.000      |
| 14 |  3978424 |      64257 | 4.86  | 3.000      |
| 15 |  3978424 |      22681 | 10.98 | 2.000      |
| 16 |  3978424 |       2475 | 7.38  | 6.000      |
| 17 |  3979238 |       2040 | 0     | 2.000      |
| 18 |  3979238 |      50032 | 14.16 | 1.000      |
| 19 |  3979238 |      50033 | 14.16 | 1.000      |
| 20 |  3979238 |      22681 | 5.49  | 1.000      |
| 21 |  3980600 |        447 | 9.49  | 1.000      |
| 22 |  3980600 |      54534 | 20.12 | 2.000      |
| 23 |  3980600 |      59215 | 19.86 | 1.000      |
| 24 |  3980600 |      65324 | 18.91 | 1.000      |
| 25 |  3980600 |       2156 | 18.42 | 2.000      |
| 26 |  3981477 |      64231 | 23.66 | 1.000      |
| 27 |  3983610 |      65324 | 18.91 | 1.000      |
| 28 |  3984006 |       2156 | 9.21  | 1.000      |
| 29 |  3984006 |      60663 | 3.94  | 1.000      |
| 30 |  3987719 |        707 | 18.8  | 2.000      |
| 31 |  3989670 |       2156 | 9.21  | 1.000      |
| 32 |  3989670 |      66197 | 3.22  | 2.000      |
| 33 |  3989670 |      22681 | 5.49  | 1.000      |
| 34 |  3991746 |       1569 | 24.57 | 13.000     |
| 35 |  3991746 |       1568 | 24.57 | 13.000     |
| 36 |  3992191 |       5663 | 22.62 | 2.000      |
| 37 |  3992191 |      14610 | 7.02  | 1.000      |
| 38 |  3993373 |      38353 | 31.91 | 1.000      |
| 39 |  3993373 |       2040 | 0     | 2.000      |
| 40 |  3994929 |        707 | 18.8  | 2.000      |
| 41 |  3996380 |      60852 | 15.39 | 1.000      |
| 42 |  3998760 |      66197 | 4.83  | 3.000      |
| 43 |  3998760 |       2475 | 7.64  | 6.000      |
| 44 |  4001825 |      64255 | 2.88  | 2.000      |
| 45 |  4001825 |       2475 | 3.82  | 3.000      |
| 46 |  4001825 |       1629 | 26.74 | 8.000      |
| 47 |  4005830 |      44036 | 12.59 | 1.000      |
| 48 |  4005830 |      44037 | 12.54 | 1.000      |
| 49 |  4005830 |      59113 | 9.42  | 6.000      |
| 50 |  4005830 |       1532 | 3.51  | 1.000      |
| 51 |  4005830 |      52110 | 10.02 | 1.000      |
| 52 |  4005830 |      27780 | 13.03 | 1.000      |
| 53 |  4005830 |      66294 | 8.46  | 1.000      |
| 54 |  4005830 |      48947 | 16.53 | 1.000      |
| 55 |  4006602 |      66197 | 6.44  | 4.000      |
| 56 |  4006602 |      64231 | 23.66 | 1.000      |
| 57 |  4006602 |      45894 | 7.21  | 1.000      |
| 58 |  4007943 |      29160 | 23.5  | 1.000      |
| 59 |  4007943 |      65804 | 18.9  | 1.000      |
| 60 |  4007943 |       2040 | 18.42 | 2.000      |
| 61 |  4009140 |      63731 | 3.09  | 1.000      |
| 62 |  4009140 |      64122 | 3.09  | 1.000      |
| 63 |  4009140 |      60663 | 3.94  | 1.000      |
| 64 |  4010241 |      64231 | 16.63 | 1.000      |
| 65 |  4010241 |       2041 | 9.21  | 1.000      |
| 66 |  4010241 |       2040 | 9.21  | 1.000      |
| 67 |  4010241 |      64353 | 5.03  | 1.000      |
| 68 |  4010244 |      64231 | 33.26 | 2.000      |
| 69 |  4010256 |      64231 | 16.63 | 1.000      |
| 70 |  4010257 |      64231 | 16.63 | 1.000      |
| 71 |  4011062 |      64231 | 16.63 | 1.000      |
| 72 |  4011062 |       2156 | 9.21  | 1.000      |
| 73 |  4013258 |      64231 | 16.63 | 1.000      |
| 74 |  4014604 |        706 | 9.4   | 1.000      |
| 75 |  4014604 |        707 | 9.4   | 1.000      |
| 76 |  4019409 |      14243 | 23.42 | 24.000     |
| 77 |  4020602 |      65720 | 11.1  | 3.000      |
| 78 |  4024205 |      14243 | 23.42 | 24.000     |
| 79 |  4026958 |      29160 | 23.5  | 1.000      |
| 80 |  4030567 |      54669 | 12.15 | 1.000      |
| 81 |  4030567 |      60211 | 6.84  | 2.000      |
| 82 |  4030567 |        705 | 4.71  | 1.000      |
| 83 |  4030567 |       5663 | 11.31 | 1.000      |
| 84 |  4030567 |      14610 | 7.12  | 1.000      |
| 85 |  4030567 |       2475 | 15.28 | 12.000     |
| 86 |  4030567 |       2156 | 9.21  | 1.000      |
| 87 |  4030567 |      66197 | 3.22  | 2.000      |
+----+----------+------------+-------+------------+
87 rows in set (0.001 sec)

MariaDB [cda_test_database]>

