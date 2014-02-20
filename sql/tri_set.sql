USE test;
DROP TRIGGER IF EXISTS tri_set_insert;
DROP TRIGGER IF EXISTS tri_set_update;
DROP TRIGGER IF EXISTS tri_set_delete;

#############################################################################
# tri_set_insert
# this sql use to trigger set new key:value
# when insert new values to table account
#############################################################################

    delimiter |

CREATE TRIGGER tri_set_insert AFTER INSERT ON account
    FOR EACH ROW
    BEGIN
    DECLARE done INT DEFAULT 99; 
    DECLARE ret  INT DEFAULT 99; 
    DECLARE fre  INT DEFAULT 99; 
SET @ret=redis_servers_set_v2("127.0.0.1",6379);
SET @done=redis_command_v2("127.0.0.1",6379,"set",concat("account:",new.acct_num),concat("acct_num:",new.acct_num, " amount:", new.amount));
SET @fre=free_resources();
    END;| 
    delimiter ;

#############################################################################
# tri_set_update
# this sql use to trigger set new key:value
# when update a row in table account
#############################################################################

    delimiter |
CREATE TRIGGER tri_set_update AFTER UPDATE ON account
    FOR EACH ROW
    BEGIN
    DECLARE done INT DEFAULT 99; 
    DECLARE ret  INT DEFAULT 99; 
    DECLARE fre  INT DEFAULT 99; 
SET @ret=redis_servers_set_v2("127.0.0.1",6379);
SET @done=redis_command_v2("127.0.0.1",6379,"set",concat("account:",new.acct_num),concat("acct_num:",new.acct_num, " amount:", new.amount));
SET @fre=free_resources();
    END;| 
    delimiter ;


#############################################################################
# tri_set_delete
# this sql use to trigger delete new key:value
# when delete a row in table account
#############################################################################

    delimiter |
CREATE TRIGGER tri_set_delete AFTER DELETE ON account
    FOR EACH ROW
    BEGIN
    DECLARE done INT DEFAULT 99; 
    DECLARE ret  INT DEFAULT 99; 
    DECLARE fre  INT DEFAULT 99; 
SET @ret=redis_servers_set_v2("127.0.0.1",6379);
#SET @done=redis_command_v2("127.0.0.1",6379,"set",concat("account:",old.acct_num),concat("del_acct_num:",old.acct_num, " amount:", old.amount));
SET @done=redis_command_v2("127.0.0.1",6379,"del",concat("account:",old.acct_num),"deleted success.");
SET @fre=free_resources();
    END; |
    delimiter ;
