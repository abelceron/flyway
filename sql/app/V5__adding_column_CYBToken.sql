ALTER TABLE ${flyway:database}.personal
    ADD COLUMN sus_cyb_token varchar(100) not null AFTER lastnamename;
SHOW GRANTS FOR 'app_fclogic'@'%';