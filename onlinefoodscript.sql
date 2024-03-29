USE [master]
GO
/****** Object:  Database [OnlineFoodDB]    Script Date: 5/23/2019 10:00:14 AM ******/
CREATE DATABASE [OnlineFoodDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineFoodDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineFoodDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineFoodDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineFoodDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineFoodDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineFoodDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineFoodDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineFoodDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineFoodDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineFoodDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineFoodDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineFoodDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineFoodDB] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineFoodDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineFoodDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineFoodDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineFoodDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineFoodDB]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NULL,
	[ThemeColor] [nvarchar](10) NULL,
	[IsFullDay] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](50) NULL,
	[ItemId] [int] NULL,
	[Count] [int] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_tblRecord] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblItem]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItem](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuId] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[Description] [nvarchar](500) NULL,
	[SmallImage] [nvarchar](50) NULL,
	[LargeImage] [nvarchar](50) NULL,
	[IsAvailable] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblItem] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](50) NULL,
	[Total] [decimal](18, 0) NULL,
	[OrderDate] [date] NULL,
	[DeliveredStatus] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubMenu]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubMenu](
	[SubMenuId] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSubMenu] PRIMARY KEY CLUSTERED 
(
	[SubMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/23/2019 10:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRolesId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRolesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventID], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (3, N'Biskek Jatra', NULL, CAST(0x0000AA2900000000 AS DateTime), NULL, N'red', 1)
INSERT [dbo].[Events] ([EventID], [Subject], [Description], [Start], [End], [ThemeColor], [IsFullDay]) VALUES (5, N'Labour Day', N'sadf', CAST(0x0000AA3E00000000 AS DateTime), NULL, N'red', 1)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[tblCart] ON 

INSERT [dbo].[tblCart] ([RecordId], [CartId], [ItemId], [Count], [DateCreated]) VALUES (57, N'ramesh@gmail.com', 32, 1, CAST(0xA23F0B00 AS Date))
INSERT [dbo].[tblCart] ([RecordId], [CartId], [ItemId], [Count], [DateCreated]) VALUES (58, N'ramesh@gmail.com', 29, 1, CAST(0xA33F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tblCart] OFF
SET IDENTITY_INSERT [dbo].[tblItem] ON 

INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (26, 3, N'Butter Paratha', CAST(100 AS Decimal(18, 0)), N'GOod For Health', N'Butter_Paratha.jpg', N'Butter_Paratha.jpg', N'Special')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (27, 3, N'Paneer Achar', CAST(200 AS Decimal(18, 0)), N'Tasty food', N'paneerachar.jpg', N'paneerachar.jpg', N'Special')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (28, 3, N'Paneer Masal', CAST(250 AS Decimal(18, 0)), N'Very Testy', N'PaneerMasala.jpg', N'PaneerMasala.jpg', N'Special')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (29, 3, N'Naan Rooti', CAST(120 AS Decimal(18, 0)), N'Health Food', N'naanrooti.jpg', N'naanrooti.jpg', N'Special')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (30, 3, N'Aaloo Kabab', CAST(120 AS Decimal(18, 0)), N'Good For Health', N'aalokabab.jpg', N'aalokabab.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (31, 39, N'Yomari', CAST(120 AS Decimal(18, 0)), N'Newari Cultural Food', N'yomari.jpg', N'yomari.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (32, 39, N'Choila', CAST(120 AS Decimal(18, 0)), N'Newari food', N'choila.jpg', N'choila.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (33, 3, N'Chicken Pizza', CAST(200 AS Decimal(18, 0)), N'Pizza lovers', N'pizza.jpg', N'pizza.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (34, 3, N'American Chopsy', CAST(200 AS Decimal(18, 0)), N'Chopsy Lovers', N'Americanchopsy.jpg', N'Americanchopsy.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (35, 3, N'Buff Chilly', CAST(200 AS Decimal(18, 0)), N'Chilly Lovers', N'BuffChilly.jpg', N'BuffChilly.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (36, 38, N'Daal Bhat', CAST(500 AS Decimal(18, 0)), N'Nepali Food Lovers', N'DaalBhat.jpg', N'DaalBhat.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (37, 41, N'Momo', CAST(120 AS Decimal(18, 0)), N'Momo Lovers', N'momo.jpg', N'momo.jpg', N'Available')
INSERT [dbo].[tblItem] ([ItemId], [SubMenuId], [Title], [Price], [Description], [SmallImage], [LargeImage], [IsAvailable]) VALUES (38, 41, N'Veg Fry Rice', CAST(120 AS Decimal(18, 0)), N'Fry Rice', N'vegfryrice.jpg', N'vegfryrice.jpg', N'Available')
SET IDENTITY_INSERT [dbo].[tblItem] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([OrderId], [Username], [Firstname], [Lastname], [Address], [Phone], [Total], [OrderDate], [DeliveredStatus], [Latitude], [Longitude]) VALUES (5, N'', N'ujjwal', N'lamichane', N'kathmandu, teku', N'43453245', CAST(100 AS Decimal(18, 0)), CAST(0xA23F0B00 AS Date), N'Confirmed', NULL, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [Username], [Firstname], [Lastname], [Address], [Phone], [Total], [OrderDate], [DeliveredStatus], [Latitude], [Longitude]) VALUES (6, N'mohan@gmail.com', N'mohan', N'mohan', N'ktm', N'32453245', CAST(90 AS Decimal(18, 0)), CAST(0xA23F0B00 AS Date), N'Pending', NULL, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [Username], [Firstname], [Lastname], [Address], [Phone], [Total], [OrderDate], [DeliveredStatus], [Latitude], [Longitude]) VALUES (7, N'suraj@gmail.com', N'suraj', N'suraj', N'kathmanu', N'32453245', CAST(300 AS Decimal(18, 0)), CAST(0xA23F0B00 AS Date), N'Pending', NULL, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [Username], [Firstname], [Lastname], [Address], [Phone], [Total], [OrderDate], [DeliveredStatus], [Latitude], [Longitude]) VALUES (8, N'ramesh@gmail.com', N'Suraj', N'Thapa', N'Baneshwor, Kathmandu, Nepal', N'9841345345', CAST(220 AS Decimal(18, 0)), CAST(0xA23F0B00 AS Date), N'Confirmed', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ItemId], [Quantity], [UnitPrice]) VALUES (11, 8, 26, 1, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ItemId], [Quantity], [UnitPrice]) VALUES (12, 8, 32, 1, CAST(120 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[tblSubMenu] ON 

INSERT [dbo].[tblSubMenu] ([SubMenuId], [SubMenuName]) VALUES (3, N'Non Veg Item')
INSERT [dbo].[tblSubMenu] ([SubMenuId], [SubMenuName]) VALUES (38, N'Nepali Food')
INSERT [dbo].[tblSubMenu] ([SubMenuId], [SubMenuName]) VALUES (39, N'Newari Item')
INSERT [dbo].[tblSubMenu] ([SubMenuId], [SubMenuName]) VALUES (41, N'Veg Items')
SET IDENTITY_INSERT [dbo].[tblSubMenu] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [Username], [Password], [Photo]) VALUES (1, N'suneel@gmail.com', N'suneel', N'1.png')
INSERT [dbo].[tblUser] ([UserId], [Username], [Password], [Photo]) VALUES (5, N'ramesh@gmail.com', N'ramesh', N'arr.png')
INSERT [dbo].[tblUser] ([UserId], [Username], [Password], [Photo]) VALUES (11, N'aa@gmail.com', N'aa', NULL)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRolesId], [RoleId], [UserId]) VALUES (1, 1, 1)
INSERT [dbo].[UserRoles] ([UserRolesId], [RoleId], [UserId]) VALUES (5, 2, 5)
INSERT [dbo].[UserRoles] ([UserRolesId], [RoleId], [UserId]) VALUES (11, 2, 11)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD  CONSTRAINT [FK_tblCart_tblItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[tblItem] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCart] CHECK CONSTRAINT [FK_tblCart_tblItem]
GO
ALTER TABLE [dbo].[tblItem]  WITH CHECK ADD  CONSTRAINT [FK_tblItem_tblSubMenu] FOREIGN KEY([SubMenuId])
REFERENCES [dbo].[tblSubMenu] ([SubMenuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblItem] CHECK CONSTRAINT [FK_tblItem_tblSubMenu]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[tblItem] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblItem]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_tblUser]
GO
USE [master]
GO
ALTER DATABASE [OnlineFoodDB] SET  READ_WRITE 
GO
