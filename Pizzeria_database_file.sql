use Training_12DecMumbai

create schema Pizzeria


create table Pizzeria.tb_Roles
(
  ID int primary key identity,
  RoleName varchar(50)
 )
 
 


 create table Pizzeria.tb_Users
 (
   ID int primary key identity,
   FirstName varchar(150) not null,
   LastName varchar(150) not null,
   Username varchar(150) not null,
   Password varchar(150) not null,
   Email varchar(150) not null,
   Address varchar(150) not null,
   PhoneNumber varchar(150) not null,
   City varchar(150) not null,
   UserRoleType int FOREIGN KEY REFERENCES Pizzeria.tb_Roles(ID)
  )

  

select RoleName from Pizzeria.tb_Roles join Pizzeria.tb_Users on Pizzeria.tb_Roles.ID=Pizzeria.tb_Users.UserRoleType

  create table  Pizzeria.tb_PizzaCategory
  (
    CategoryID int primary key identity,
	CategoryName varchar(150) not null
  )

 

 insert into Pizzeria.tb_PizzaCategory values('Veg')
 insert into Pizzeria.tb_PizzaCategory values('NonVeg')

  create table Pizzeria.tb_Pizzas
  (
    ID int primary key identity,
	CategoryID int FOREIGN KEY REFERENCES Pizzeria.tb_PizzaCategory(CategoryID),
	PizzaName varchar(150) not null,
	PizzaLogo varbinary(max) not null,
  )

  Alter Table Pizzeria.tb_Pizzas  
       Alter column PizzaLogo image  

  select * from Pizzeria.tb_Pizzas

  

  
  



  create table Pizzeria.tb_PizzaSize
  ( 
  ID int primary key identity,
  PizzaSize varchar(150)
  )

 
  create table Pizzeria.tb_PizzaPrice
  (
    ID int primary key identity,
	PizzaID int FOREIGN KEY REFERENCES Pizzeria.tb_Pizzas(ID),
	SizeID int FOREIGN KEY REFERENCES Pizzeria.tb_PizzaSize(ID),
	Price money not null
  )

  insert into Pizzeria.tb_PizzaPrice values(7,1,150.0000)
  insert into Pizzeria.tb_PizzaPrice values(7,2,200.0000)
  insert into Pizzeria.tb_PizzaPrice values(7,3,250.0000)

  create table Pizzeria.tb_Orders
  (
   O_ID int not null ,
   UserID int FOREIGN KEY REFERENCES Pizzeria.tb_Users(ID),
   PizzaPriceID int FOREIGN KEY REFERENCES Pizzeria.tb_PizzaPrice(ID),
   OrderStatus bit not null,
   OrderType varchar(150),
   DelivaryDateTime datetime not null,
   DeliveryAddress varchar(300) not null,
   Quantity int not null,
   constraint PK_Order primary key(O_ID,PizzaPriceID,Quantity) --here we need to filter data like if max(O_ID)>1 
  )


  select PizzaID from Pizzeria.tb_PizzaPrice join Pizzeria.tb_Orders on Pizzeria.tb_PizzaPrice.ID=Pizzeria.tb_Orders.PizzaPriceID



   insert into Pizzeria.tb_Orders values(1,12,1,1,'Delivery','20120618 10:34:09 AM','Mumbai',1)



   insert into Pizzeria.tb_PizzaSize values('Regular')
  insert into Pizzeria.tb_PizzaSize values('Medium')
  insert into Pizzeria.tb_PizzaSize values('Large')




  insert into Pizzeria.tb_PizzaPrice values(1,1,200.0000)
  insert into Pizzeria.tb_PizzaPrice values(2,3,500.0000)
  insert into Pizzeria.tb_PizzaPrice values(3,2,300.0000)




  select * from Pizzeria.tb_Roles
  select * from Pizzeria.tb_Users
  select * from Pizzeria.tb_PizzaCategory
  select * from Pizzeria.tb_Pizzas
  select * from Pizzeria.tb_PizzaPrice
  select * from Pizzeria.tb_PizzaSize
  select * from Pizzeria.tb_Orders

  drop table Pizzeria.tb_Orders


  drop table Pizzeria.tb_PizzaPrice

  drop table Pizzeria.tb_PizzaSize



 


 




  








  