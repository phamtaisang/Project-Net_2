create database  bookstore 
go
USE bookstore  
GO
create table  category(
	id int not NULL IDENTITY(1,1) primary key ,
	name NVARCHAR(100) not null,
	parent int not null default 0,
	status tinyint not null default 0,
	created_at date not null,
	update_at DATE not null default GETDATE()
)
GO
create table  producer(
	id int not NULL IDENTITY(1,1) primary KEY,
	name NVARCHAR(255) not null,
	created_at date not null,
	update_at DATE not null default GETDATE() 
)
GO
create table PRODUCT(
	id int not NULL IDENTITY(1,1) primary key ,
	name nvarchar(255) not null,
	author nvarchar(255) not null,
	price int not null,
	discount tinyint default 0,
	images varchar(255),
	producerid int,
	catID int,
	description text,
	status tinyint not null default 0,
	created_at datetime  DEFAULT GETDATE() ,
	CONSTRAINT fk_cat 
	FOREIGN KEY (catID) REFERENCES category(id) ,
	CONSTRAINT fk_producer
	FOREIGN KEY(producerid) REFERENCES producer(id) 

)
GO

create table account(
	id int not NULL IDENTITY(1,1) primary key ,
	name nvarchar(255) not null,
	email varchar(255) UNIQUE  not null,
	password varchar(255) not null,
	address nvarchar(255) NOT null,
	phone varchar(15) NOT null,
	role tinyint not null default 0,
	status tinyint not null default 1,
	created_at datetime not null,
	update_at DATETIME not null default GETDATE(),
	
)
GO
create TABLE bill(
	id int not NULL IDENTITY(1,1) primary key,
	accountId int not null,
	total int not null,
	status int not null,
	created_at date not null,
	update_at DATETIME not null default GETDATE(),
	CONSTRAINT fk_account
	FOREIGN KEY (accountId) REFERENCES account(id)
)
GO
create table billdetail(
	id int not NULL IDENTITY(1,1) primary key ,
	billID int not null,
	productId int not null,
	quantity int not null,
	price int not null,
	discount tinyint default 0,
	sum_price int not null,
	created_at date not null,
	update_at DATETIME not null default GETDATE(),
	CONSTRAINT fk_bill
	FOREIGN KEY (billID) REFERENCES bill(id),
	CONSTRAINT fk_product
	FOREIGN KEY (productId) REFERENCES product(id)
)
GO
create table feedback(
	id int not NULL IDENTITY(1,1) primary key ,
	productid int not null,
	accountid int not null,
	comment text not null,
	created_at date not null,
	update_at DATETIME not null default GETDATE(),
	CONSTRAINT fk_fbproduct
	FOREIGN KEY (productid) REFERENCES PRODUCT(id),
	CONSTRAINT fk_fbaccount
	FOREIGN KEY (accountid) REFERENCES account(id)
)
