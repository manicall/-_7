--12.1
 USE sample;
 CREATE MASTER KEY
 ENCRYPTION BY PASSWORD = 'pls4w9d16!'
 GO
 CREATE CERTIFICATE cert01
 WITH SUBJECT = 'Certificate for dbo'; 

 --12.2
SELECT p.name, c.name, certificate_id
 FROM sys.database_principals p, sys.certificates c
 WHERE p.principal_id = p.principal_id

-- symmetric encryption 
create table users(
	id int not null, 
	userName varchar(20), 
	userPass varchar(20),
	encryptedUserPass varbinary(128))
go

insert into users (id, userName, userPass) values(1, 'Maxim', 'password')
insert into users (id, userName, userPass) values(1, 'Andrey', 'drowssap')

create symmetric key myKey
with algorithm = aes_256
encryption by certificate cert01
go

open symmetric key myKey
decryption by certificate cert01

update users set encryptedUserPass = ENCRYPTBYKEY(key_guid('myKey'), userPass)

close symmetric key myKey
go

select * from users

-- symmetric decryption 
alter table users
add decryptedUserPass varchar(20)
go

open symmetric key myKey
decryption by certificate cert01

update users set decryptedUserPass = CONVERT(varchar, decryptByKey(encryptedUserPass))

close symmetric key myKey
go
select * from users

-- transparent encryption
use master
go
create master key encryption by password = 'mySecretKey'
go
create certificate myCertificate with subject = 'myCertificate'
go
use sample;
go
create database encryption key
with algorithm = aes_128
encryption by server certificate myCertificate
go

alter database sample
set encryption on;
go
select * from sys.dm_database_encryption_keys
where encryption_state = 3;


-- asymmetric encryption 
 create table asymUsers(
	id int not null, 
	userName varchar(20), 
	userPass varchar(20),
	encryptedUserPass varbinary(max))
go

insert into asymUsers (id, userName, userPass) values(1, 'Irina', 'trigonom')
insert into asymUsers (id, userName, userPass) values(1, 'Varvara', 'parallep')

create asymmetric key myAsymKey
with algorithm = RSA_2048
encryption by password = 'asymPass'
go

update asymUsers set encryptedUserPass = encryptByAsymKey(asymKey_ID('myAsymKey'), userPass)

select * from asymUsers

-- asymmetric decryption 
alter table asymUsers
add decryptedUserPass varchar(20)
go

update asymUsers set decryptedUserPass = 
	CONVERT(varchar(max), decryptByAsymKey(asymKey_ID('myAsymKey'), encryptedUserPass, N'asymPass'))
go

select * from asymUsers