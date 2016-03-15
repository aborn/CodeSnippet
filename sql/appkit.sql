# 更新appconfig
update `Ele_Config` set `status` = 0 where eleScene = 'appconfig' and parentId=0

# 删除
delete from Ele_Scene where id=38

# 删除某个场景的数据
delete from `Ele_Content_Config` where eleId in (select eleId from Ele_Config where `eleScene` = 'testop2');
delete from Ele_Config where `eleScene` = 'testop2';
