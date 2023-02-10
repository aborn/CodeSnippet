use test;
insert into temp values("gr", 108333, "goooogle");
#insert into account values(12, 1.2)
#insert into account values(13, 1.4)
#SET @ret=redis_command_v2("127.0.0.1",6379,"set","greenp",
#        json_object
#        (
#            NEW.id as "id",
#            NEW.name as "userName",NEW.title as "title"
#            )
#        );

# three different mysql operation.
#update tablename set colum=newvalue where condition;
#update amount set amount=1.4 where acct_num=1;
#delete from tablename where condition;
#delete from account where acct_num<200;
#insert into tablename values(a1,a2), (b1,b2);
#insert into account values(17, 17.2);

# 查询表中某个字段(eleName)是否重复行
select * from <table-name> where a="avalue" group by `eleName` having count(eleName)<>1

# 查询某个字段不重复的记录
select distinct domainKey from MetaInfo;

# 修改字段长度 (修改表user中字段name的长度为50)
alter table user modify column name varchar(50);


# 更新字段为null的值为新值
update mp_markdown_meta set post_time='1970-01-01 00:00:00' where isnull(post_time) ;
