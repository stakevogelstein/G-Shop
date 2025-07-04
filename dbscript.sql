-- Create the G-Shop database
USE [master];
GO
CREATE DATABASE [GShop];
GO


-- Use the newly created database
USE [GShop];
GO

-- Create the category table
CREATE TABLE [dbo].[category] (
    [id] INT IDENTITY(1,1) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED ([id] ASC)
);

-- Create the product table with category
CREATE TABLE [dbo].[product] (
    [id] INT IDENTITY(1,1) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [price] FLOAT NOT NULL,
    [quantity] INT NOT NULL,
    [description] TEXT NULL,
    [image_url] VARCHAR(MAX) NULL,
    [brand_id] INT NULL,
    [release_date] DATE NULL,
    [category_id] INT NOT NULL,
    CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_product_category] FOREIGN KEY ([category_id]) REFERENCES [dbo].[category]([id])
);

-- Create the brand table
CREATE TABLE [dbo].[brand] (
    [id] INT IDENTITY(1,1) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED ([id] ASC)
);

-- Create the user table
CREATE TABLE [dbo].[user] (
    [id] INT IDENTITY(1,1) NOT NULL,
    [username] VARCHAR(100) NOT NULL,
    [password] VARCHAR(255) NOT NULL,
    [email] VARCHAR(255) NULL,
    [role_id] INT NOT NULL,
    CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED ([id] ASC)
);

-- Create the role table
CREATE TABLE [dbo].[role] (
    [id] INT IDENTITY(1,1) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED ([id] ASC)
);

-- Create the order table
CREATE TABLE [dbo].[order] (
    [id] INT IDENTITY(1,1) NOT NULL,
    [user_id] INT NOT NULL,
    [order_date] DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_order_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user]([id])
);

-- Create the order detail table
CREATE TABLE [dbo].[order_detail] (
    [order_id] INT NOT NULL,
    [product_id] INT NOT NULL,
    [quantity] INT NOT NULL,
    [price] FLOAT NOT NULL,
    CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED ([order_id], [product_id]),
    CONSTRAINT [FK_order_detail_order] FOREIGN KEY ([order_id]) REFERENCES [dbo].[order]([id]),
    CONSTRAINT [FK_order_detail_product] FOREIGN KEY ([product_id]) REFERENCES [dbo].[product]([id])
);

-- Insert default roles
INSERT INTO [dbo].[role] ([name]) VALUES ('Admin'), ('Customer');

-- Insert sample categories
INSERT INTO [dbo].[category] ([name]) VALUES ('Pre-built Figurines'), ('Model Kit Figurines'), ('Tools');

-- Insert sample brands
INSERT INTO [dbo].[brand] ([name]) VALUES ('Bandai'), ('Kotobukiya'), ('Good Smile Company');

-- Insert sample products with images
INSERT INTO [dbo].[product] ([name], [price], [quantity], [description], [image_url], [brand_id], [release_date], [category_id]) VALUES
('Gundam RX-78-2', 45.99, 20, 'A highly detailed model kit of the iconic RX-78-2 Gundam.', 'https://product.hstatic.net/1000231532/product/gundamstorevn_mo_hinh_rg_rx-78-2_gundam_chinh_hang_gia_re_nhat_1ac7829ba7c04602b18d380eff617ef0_master.jpg', 1, '2023-05-10', 2),
('Nendoroid Naruto Uzumaki', 55.00, 15, 'A cute chibi-style Naruto Uzumaki figurine.', 'https://product.hstatic.net/1000231532/product/mua_ban_nendoroid_naruto_uzumaki_naruto_shippuden_gia_re_32f4b006c225437b8a6edeee2c1ccf00_master.jpg', 3, '2023-06-15', 1),
('Modeling Tool Set', 19.99, 50, 'A complete tool set for assembling model kits.', 'https://ae01.alicdn.com/kf/S43a7d219342f4b8d84f4a1bb7d25e606m.jpg_640x640q90.jpg', NULL, '2023-04-20', 3);
-- Insert admin
INSERT INTO [dbo].[user] ([username], [password], [email], [role_id]) VALUES ('stake', '456', 'admin@gshop.com', 1);
