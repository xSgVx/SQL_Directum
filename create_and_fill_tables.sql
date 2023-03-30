SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

drop table if exists Arrivals
GO

drop table if exists Sales
GO

drop table if exists Products
GO

drop table if exists Sellers
GO

CREATE TABLE Products(
	[ID] int primary key identity,
	[Name] varchar(100) not null,
	[Price] float not null,
)
GO

CREATE TABLE [dbo].Sellers(
	[ID] int identity primary key,
	[Surname] varchar(50) not null,
	[Name] varchar(50) not null,
)
GO

CREATE TABLE [dbo].[Arrivals](
	[ID] int identity primary key,
	[Date] DateTime,
	[Quantity] float not null,
	[IDProd] int not null references Products(ID)
)
GO

CREATE TABLE [dbo].[Sales](
	[ID] int identity primary key,
	[Date] DateTime,
	[Quantity] float not null,
	[IDProd] int not null references Products(ID),
	[IDSel] int not null references Sellers(ID)
)
GO

insert into dbo.Products
values ('Beer', 50), 
	('Vodka', 200), 
	('Dried Squid', 60), 
	('Whiskey', 600), 
	('Martini', 300), 
	('Snacks', 30),
	('Cheese', 100)

insert into dbo.Sellers
values	('Darkstalker', 'Alex'), 
		('Romanov', 'Misha' ),
		('Fritz', 'Nikita'),
		('Merkova', 'Malena'),
		('Fialkova', 'Mila'),
		('Benovich', 'Dasha')

insert into dbo.Arrivals
values	
		('01.09.2013 12:01', 10000, 1),
		('02.09.2013 12:05', 1000, 2),
		('03.09.2013 00:03', 1000, 3),
		('04.09.2013 00:06', 400, 4),
		('03.09.2013 19:27', 600, 5),
		('02.09.2013 19:27', 5000, 6),
		('08.09.2013 19:27', 200, 7),
		('01.10.2013 12:01', 10000, 1),
		('02.10.2013 12:05', 1000, 2),
		('03.10.2013 00:03', 1000, 3),
		('04.10.2013 00:06', 400, 4),
		('03.10.2013 19:27', 600, 5),
		('02.10.2013 19:27', 5000, 6),
		('08.10.2013 19:27', 200, 7),
		('01.08.2013 12:01', 10000, 1),
		('02.08.2013 12:05', 1000, 2),
		('03.08.2013 00:03', 1000, 3),
		('04.08.2013 00:06', 400, 4),
		('03.08.2013 19:27', 600, 5),
		('02.08.2013 19:27', 5000, 6),
		('08.08.2013 19:27', 200, 7)

insert into dbo.Sales
values	
		('02.10.2013 12:01',	5,	2,	1),
		('02.10.2013 12:12',	10,	1,	2),
		('02.10.2013 13:15',	4,	4,	2),
		('02.10.2013 13:15',	4,	4,	2),
		('02.10.2013 15:17',	20,	3,	1),
		('02.10.2013 16:40',	6,	5,	2),
		('02.10.2013 17:00',	2,	6,	2),
		('02.10.2013 17:05',	2,	7,	1),

		('03.10.2013 12:01',	5,	2,	3),
		('03.10.2013 12:12',	10,	1,	3),
		('03.10.2013 13:15',	4,	4,	4),
		('03.10.2013 13:15',	4,	4,	3),
		('03.10.2013 15:17',	20,	3,	4),
		('03.10.2013 16:40',	6,	5,	4),
		('03.10.2013 17:00',	2,	6,	3),
		('03.10.2013 17:05',	2,	7,	4),

		('04.10.2013 12:01',	5,	2,	5),
		('04.10.2013 12:12',	10,	1,	5),
		('04.10.2013 13:15',	4,	4,	5),
		('04.10.2013 13:15',	4,	4,	5),
		('04.10.2013 15:17',	20,	3,	6),
		('04.10.2013 16:40',	6,	5,	6),
		('04.10.2013 17:00',	2,	6,	6),
		('04.10.2013 17:05',	2,	7,	6),

		('06.10.2013 12:01',	5,	2,	1),
		('06.10.2013 12:12',	10,	1,	1),
		('06.10.2013 13:15',	4,	4,	1),
		('06.10.2013 13:15',	4,	4,	1),
		('06.10.2013 15:17',	20,	3,	6),
		('06.10.2013 16:40',	6,	5,	6),
		('06.10.2013 17:00',	2,	6,	6),
		('06.10.2013 17:05',	2,	7,	6),

		('07.10.2013 12:01',	5,	2,	3),
		('07.10.2013 12:12',	10,	1,	3),
		('07.10.2013 13:15',	4,	4,	3),
		('07.10.2013 13:15',	4,	4,	3),
		('07.10.2013 15:17',	20,	3,	5),
		('07.10.2013 16:40',	6,	5,	5),
		('07.10.2013 17:00',	2,	6,	5),
		('07.10.2013 17:05',	2,	7,	5)