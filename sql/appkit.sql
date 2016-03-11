# 更新appconfig
update `Ele_Config` set `status` = 0 where eleScene = 'appconfig' and parentId=0

# 删除
delete from Ele_Scene where id=38
