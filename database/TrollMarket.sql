create table [Role](
	RoleID int not null identity(1,1) primary key,
	RoleName varchar(20) not null
)

create table [User](
	UserID int not null identity(1,1) primary key,
	[Username] varchar(50) not null,
	[Password] varchar(20) not null,
	RoleID int not null foreign key references [Role](RoleID)
)

create table [Profile](
	UserID int primary key not null foreign key references [User](UserID),
	FirstName varchar(50) not null,
	LastName varchar(50) null,
	[Address] varchar(500) not null,
	Balance money not null default 0
)

create table Category(
	CategoryID int not null identity(1,1) primary key,
	CategoryName varchar(50) not null
)

create table Product(
	ProductID int not null identity(1,1) primary key,
	ProductName varchar(100) not null,
	SellerID int not null foreign key references [User](UserID),
	CategoryID int not null foreign key references Category(CategoryID),
	Price money not null,
	[Description] varchar(max) null,
	Discontinue bit not null default 0
)

create table Shipment(
	ShipmentID int not null identity(1,1) primary key,
	ShipmentName varchar(50) not null,
	Price money not null,
	IsActive bit not null default 1
)

create table [Cart](
	CartID int not null identity(1,1) primary key,
	BuyerID int not null foreign key references [User](UserID)
)

create table [CartDetail](
	CartDetailID int not null identity(1,1) primary key,
	CardID int not null foreign key references Cart(CartID),
	ProductID int not null foreign key references Product(ProductID),
	ShipmentID int not null foreign key references Shipment(ShipmentID),
	Quantity int not null default 1,
)

create table [Transaction](
	TransactionID int not null identity(1,1) primary key,
	TransactionDate datetime not null,
	BuyerID int not null foreign key references [User](UserID),
	SellerName varchar(50) not null,
	ProductName varchar(100) not null,
	ShipmentName varchar(50) not null,
	Quantity int not null,
	TotalPrice money not null
)
