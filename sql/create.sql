use test;
DROP TABLE IF EXISTS bench;
DROP TABLE IF EXISTS bench_no_index;

CREATE TABLE bench (
	  idx INT(10) NOT NULL PRIMARY KEY,
	  name VARCHAR(20) NOT NULL,
	  des VARCHAR(100) NOT NULL
);

insert into bench value(0,'000','shanghai');

CREATE TABLE bench_no_index (
	  idx INT(10) NOT NULL,
	  name VARCHAR(20) NOT NULL,
	  des VARCHAR(100) NOT NULL
);
insert into bench_no_index value(0,'000','shanghai');

