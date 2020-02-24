use Training_12DecMumbai

create schema PizzaApp



 create table PizzaApp.tb_Roles
(
  ID int primary key identity,
  RoleName varchar(50)
 )
 
 insert into PizzaApp.tb_Roles values('Admin')
 insert into PizzaApp.tb_Roles values('Employee')
 insert into PizzaApp.tb_Roles values('Customer')

 ---------------------------------------------------------

 create table PizzaApp.tb_Users
 (
   UserID int primary key identity,
   FirstName varchar(150) not null,
   LastName varchar(150) not null,
   Username varchar(150) not null,
   Password varchar(150) not null,
   Email varchar(150) not null,
   Address varchar(150) not null,
   PhoneNumber varchar(150) not null,
   City varchar(150) not null,
   UserRoleType int FOREIGN KEY REFERENCES PizzaApp.tb_Roles(ID)
  )

  

select RoleName from Pizzeria.tb_Roles join Pizzeria.tb_Users on Pizzeria.tb_Roles.ID=Pizzeria.tb_Users.UserRoleType



------------------------------------------------------------

 create table PizzaApp.tb_PizzaCategory
(
  CategoryID int primary key identity,
  CategoryName varchar(50) not null,
  
)

insert into PizzaApp.tb_PizzaCategory values('Veg')
insert into PizzaApp.tb_PizzaCategory values('NonVeg')


---------------------------------------------

create table PizzaApp.tb_Pizzas
(
  PizzaID int primary key identity,
  PizzaName varchar(50) not null,
  Logo varchar(500) not null,
  CategoryID int FOREIGN KEY REFERENCES PizzaApp.tb_PizzaCategory(CategoryID),
  Price money not null
)


----------------------------------------------------------------

Create table PizzaApp.tb_Orders
(
  OrderId int  primary key identity(10,1),
  OrderStatus bit not null,
  TotalPrice money not null,
  DeliveryDateTime datetime not null,
  UserID int foreign key references PizzaApp.tb_Users(UserID),
  PizzaID int foreign key references PizzaApp.tb_Pizzas(PizzaID)
)


insert into PizzaApp.tb_Orders values(1,150,'11/19/2014 1:29 AM',1,1)
insert into PizzaApp.tb_Orders values(1,250,'11/19/2019 1:29 AM',2,2)
---------------------------------------------------------------------


create table PizzaApp.tb_Adminlogin
(
	Id int Identity primary key,
	AdminUserName varchar(10) not null,
	AdminPassword varchar(25) not null
)

insert into PizzaApp.tb_Adminlogin values('admin', 'admin')

--------------------------------------------------------------------

create table PizzaApp.tb_UserLoginCredential
(
	Id int Identity primary key,
	username varchar(10) not null,
	[password] varchar(25) not null
)




select *from PizzaApp.tb_Roles
select *from PizzaApp.tb_Users
select *from PizzaApp.tb_PizzaCategory
select *from PizzaApp.tb_Pizzas
select *from PizzaApp.tb_Orders
select *from PizzaApp.tb_Adminlogin
select *from PizzaApp.tb_UserLoginCredential


drop table PizzaApp.tb_Roles
drop table PizzaApp.tb_Users
drop table PizzaApp.tb_PizzaCategory
drop table PizzaApp.tb_Pizzas
drop table PizzaApp.tb_Orders
drop table PizzaApp.tb_Adminlogin
drop table PizzaApp.tb_UserLoginCredential
