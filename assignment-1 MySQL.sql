create database assignment;
use assignment;
create table SalesPeople(Snum int Primary key, Sname varchar(20) Unique, City varchar(20), Comm float);
create table Customers(Cnum int primary key, Cname varchar(20),City varchar(20) Not Null,Snum int, foreign key (Snum) references SalesPeople (Snum));
insert into SalesPeople
(Snum, Sname, City, Comm)
values
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);

insert into Customers
(Cnum, Cname, City, Snum)
values
(2001,'Hoffman', 'London', 1001),
(2002,'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);

create table Orders(Onum int Primary key, Amt float, Odate date, Cnum int, foreign key (Cnum) references Customers (Cnum), Snum int, foreign key (Snum) references SalesPeople (Snum));
insert into Orders
(Onum, Amt, Odate, Cnum, Snum)
values
(3001, 18.69, '1990-10-03', 2008, 1007),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4273.00, '1990-10-05', 2006, 1001),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);

# 1  Count the number of Salesperson whose name begin with ‘a’/’A’.
select count(*) from SalesPeople where Sname like 'a%' or Sname like 'A%';

# 2  Display all the Salesperson whose all orders worth is more than Rs. 2000.
select Sname from SalesPeople inner join Orders on SalesPeople.Snum = Orders.Snum where Amt > 2000;

# 3 Count the number of Salesperson belonging to Newyork.
select count(*) from SalesPeople where City = 'Newyork';

# 4  Display the number of Salespeople belonging to London and belonging to Paris.
select * from SalesPeople where City = (select Sname from SalesPeople where City = 'London' and 'Paris');

# 5 Display the number of orders taken by each Salesperson and their date of orders.
select SalesPeople.Sname, Orders.Odate from SalesPeople Inner join Orders on SalesPeople.Snum = Orders.Snum;

