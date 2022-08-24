ALTER TABLE ${flyway:database}.personal
    ADD COLUMN apodo varchar(100) not null AFTER sus_cyb_token;