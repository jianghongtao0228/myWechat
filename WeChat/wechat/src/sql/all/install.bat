rem MYSQL 5.1
set MYSQL=mysql -h localhost -u root -proot --default-character-set=utf8

%MYSQL% < 00_wechat/00_CreateDB.sql
%MYSQL% < 00_wechat/01.C_PR_SYSTEM.sql
%MYSQL% < 00_wechat/02.CT_WECHAT.sql

pause
