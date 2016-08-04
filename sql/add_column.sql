ALTER TABLE `BInfo` ADD `buId` INT(11) DEFAULT '0' COMMENT ' 事业群id';
ALTER TABLE `SharkPushConfig` ADD `status` INT(11) DEFAULT '0' COMMENT ' 命令字状态';
ALTER TABLE `BInfo` ADD `appUnionId` VARCHAR(2048) DEFAULT '0' NOT NULL COMMENT ' 公司范围内appid，唯一标识';
ALTER TABLE `BInfo` ADD `extInfo` TEXT DEFAULT '' COMMENT '扩展信息';
