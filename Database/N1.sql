USE master
GO
CREATE DATABASE N1
GO
USE N1
GO
CREATE TABLE Accounts (
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	fullname nvarchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	activated bit NOT NULL,
	admin bit NOT NULL,
	img varchar(50) NULL,
	token varchar(50) NULL,
	CONSTRAINT PK_Accounts PRIMARY KEY CLUSTERED (username)
)
GO
CREATE TABLE Categories (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(50) NOT NULL,
	CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (id)
)
GO
CREATE TABLE OrderDetails (
	id int IDENTITY(1,1) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	orderid int NOT NULL,
	productid int NOT NULL,
	CONSTRAINT PK_OrderDetails PRIMARY KEY CLUSTERED (id)
)
GO
CREATE TABLE Orders (
	id int IDENTITY(1,1) NOT NULL,
	address nvarchar(50) NOT NULL,
	phone varchar(11) NOT NULL,
	createdate date NOT NULL,
	username varchar(50) NOT NULL,
	CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (id)
)
GO
CREATE TABLE Products (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(50) NOT NULL,
	price float NOT NULL,
	createdate date NOT NULL,
	available bit NOT NULL,
	img varchar(50) NULL,
	description nvarchar(255) NULL,
	categoryid int NOT NULL,
	CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (id)
)
GO
-- Thêm người dùng
INSERT Accounts (username, password, fullname, email, activated, admin, img, token) VALUES ('admin', '123', N'Hoang Van Dieu', 'hoangdieu22022002@gmail.com', 1, 1, 'cherry.png', '')

-- Thêm chuyên mục
SET IDENTITY_INSERT Categories ON
INSERT INTO Categories (id, name) VALUES (1, N'Clothing')
INSERT INTO Categories (id, name) VALUES (2, N'Activewear')
INSERT INTO Categories (id, name) VALUES (3, N'Sleepwear')
INSERT INTO Categories (id, name) VALUES (4, N'Lingerie')
INSERT INTO Categories (id, name) VALUES (5, N'Swimwear')
INSERT INTO Categories (id, name) VALUES (6, N'Shoes')
INSERT INTO Categories (id, name) VALUES (7, N'Accessories')
SET IDENTITY_INSERT Categories OFF
-- Thêm chi tiết hoá đơn
SET IDENTITY_INSERT OrderDetails ON
INSERT INTO OrderDetails (id, price, quantity, orderid, productid) VALUES (1, 34.29, 3, 1, 4)
INSERT INTO OrderDetails (id, price, quantity, orderid, productid) VALUES (2, 23.59, 1, 1, 2)
INSERT INTO OrderDetails (id, price, quantity, orderid, productid) VALUES (4, 54.79, 5, 2, 10)
INSERT INTO OrderDetails (id, price, quantity, orderid, productid) VALUES (5, 120.19, 1, 2, 15)
INSERT INTO OrderDetails (id, price, quantity, orderid, productid) VALUES (6, 64.39, 2, 3, 20)
INSERT INTO OrderDetails (id, price, quantity, orderid, productid) VALUES (7, 82.99, 3, 3, 22)
SET IDENTITY_INSERT OrderDetails OFF
-- Thêm hoá đơn
SET IDENTITY_INSERT Orders ON
INSERT INTO Orders (id, phone, address, createdate, username) VALUES (1, '0387367162', N'Thái Bình', CAST('2022-11-22' AS Date), 'admin')
INSERT INTO Orders (id, phone, address, createdate, username) VALUES (2, '0987654321', N'Thái Bình', CAST('2022-11-12' AS Date), 'trong')
INSERT INTO Orders (id, phone, address, createdate, username) VALUES (3, '0987612345', N'Ninh Bình', CAST('2022-11-15' AS Date), 'huong')
INSERT INTO Orders (id, phone, address, createdate, username) VALUES (4, '0912345678', N'Nam Định', CAST('2022-11-15' AS Date), 'toan')
SET IDENTITY_INSERT Orders OFF
-- Thêm sản phẩm
SET IDENTITY_INSERT Products ON
INSERT Products (id, name, price, createdate, available, img, description, categoryid) VALUES (1, N'Organic Crew T-Shirt', 19.39, CAST('2022-10-30' AS Date), 1, '1.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et magna aliqua.', 1)
INSERT Products (id, name, price, createdate, available, img, description, categoryid) VALUES (2, N'Organic Crew T-Shirt', 35.13, CAST('2022-10-30' AS Date), 1, '2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et magna aliqua.', 4)
INSERT Products (id, name, price, createdate, available, img, description, categoryid) VALUES (3, N'Relaxed Tapered Jean', 11.55, CAST('2021-10-25' AS Date), 1, '3.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et magna aliqua.', 3)
INSERT Products (id, name, price, createdate, available, img, description, categoryid) VALUES (4, N'Mayfair Long Sleeve Shirt', 36.78, CAST('2019-10-19' AS Date), 1, '4.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et magna aliqua.', 7)
INSERT Products (id, name, price, createdate, available, img, description, categoryid) VALUES (5, N'Ribbed Beanie Personalised', 32.51, CAST('2020-10-19' AS Date), 1, '5.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et magna aliqua.', 6)
INSERT Products (id, name, price, createdate, available, img, description, categoryid) VALUES (6, N'Mens Seamless Trunks', 73.32, CAST('2022-10-30' AS Date), 1, '6.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et magna aliqua.', 5)

GO
ALTER TABLE OrderDetails  WITH CHECK ADD CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(productid)
REFERENCES Products (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE OrderDetails  WITH CHECK ADD CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY(orderid)
REFERENCES Orders (id) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE OrderDetails CHECK CONSTRAINT FK_OrderDetails_Orders
GO
ALTER TABLE Orders  WITH CHECK ADD CONSTRAINT FK_Orders_Accounts FOREIGN KEY(username)
REFERENCES Accounts (username) ON UPDATE CASCADE ON DELETE CASCADE
GO
ALTER TABLE Orders CHECK CONSTRAINT FK_Orders_Accounts
GO
ALTER TABLE Products  WITH CHECK ADD CONSTRAINT FK_Products_Categories FOREIGN KEY(categoryid)
REFERENCES Categories (id) ON UPDATE CASCADE ON DELETE CASCADE
GO