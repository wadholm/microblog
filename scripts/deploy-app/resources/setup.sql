create database <db-name> character set utf8 collate utf8_bin;
create user '<user>'@'localhost' identified by '<password>';
grant all privileges on <db-name>.* to '<user>'@'localhost';
flush privileges;
