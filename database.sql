USE [QLNhaSachFattyAndThinny]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [ntext] NULL,
	[release_year] [int] NULL,
	[image] [text] NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[publisher] [nvarchar](100) NULL,
	[author] [nvarchar](100) NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Tag]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookID] [int] NULL,
	[tagID] [int] NULL,
 CONSTRAINT [PK_Book_Tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[name] [nvarchar](50) NULL,
	[avatar] [nchar](100) NULL,
	[email] [nchar](100) NULL,
	[phone_number] [char](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discount_code] [nchar](20) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineOrder]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineOrder](
	[id] [int] NOT NULL,
	[is_ordered] [bit] NULL,
	[customerID] [int] NULL,
	[receiptID] [int] NULL,
 CONSTRAINT [PK_OnlineOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[staffID] [int] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[receiptID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[discountID] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_ReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [text] NOT NULL,
	[role] [nchar](20) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[phone_number] [nchar](10) NULL,
	[join_date] [date] NULL,
	[salary] [float] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 3/17/2023 3:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (1, N'Bách Khoa Khủng Long Toàn Tập', NULL, 2018, N'bachkhoakhunglongtoantap1', 23, 223000, N'Dân Trí', N'Dougal Dixon', 2)
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (2, N'Hoàng Tử Bé (Tái Bản)', NULL, 2020, N'hoangtube1', 67, 566666, N'Hội Nhà Văn', N'Antoine De Saint-Exupéry', 3)
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (3, N'Cây Cam Ngọt Của Tôi', NULL, 2020, N'caycamngotcuatoi1', 24, 75600, N'Hội Nhà Văn', N'José Mauro de Vasconcelos', 4)
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (4, N'Bước Đầu Hướng Dẫn Luyện Khí Công', NULL, 2019, N'buocdauhuongdansudungkhicong1', 35, 80000, N'Thanh hóa', N'Đỗ Đức Ngọc', 5)
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (5, N'Lỗ Tấn - Phê Phán Quốc Dân Tính
', NULL, 2019, N'lotan1', 65, 60000, N'Đà Nẵng', N'Châu Tính', 6)
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (6, N'Conan Tập 10', NULL, 2012, N'conan10', 1, 20000, N'Kim Đồng', N'	Aoyama Gosho', 7)
INSERT [dbo].[Book] ([id], [title], [description], [release_year], [image], [quantity], [price], [publisher], [author], [categoryID]) VALUES (7, N'Một Cuốn Sách Trầm Cảm', NULL, 2022, N'motcuonsachtramcam', 12, 75000, N'Thanh Niên', N'macmart', 8)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [category]) VALUES (1, N'Chưa phân loại')
INSERT [dbo].[Category] ([id], [category]) VALUES (2, N'Khoa Học')
INSERT [dbo].[Category] ([id], [category]) VALUES (3, N'Thiếu Nhi')
INSERT [dbo].[Category] ([id], [category]) VALUES (4, N'Tiểu Thuyết')
INSERT [dbo].[Category] ([id], [category]) VALUES (5, N'Hướng Dẫn')
INSERT [dbo].[Category] ([id], [category]) VALUES (6, N'Lịch Sử')
INSERT [dbo].[Category] ([id], [category]) VALUES (7, N'Truyện Tranh')
INSERT [dbo].[Category] ([id], [category]) VALUES (8, N'Truyện Ngắn')
INSERT [dbo].[Category] ([id], [category]) VALUES (9, N'Khoa Học Viễn Tưởng')
INSERT [dbo].[Category] ([id], [category]) VALUES (10, N'Manga')
INSERT [dbo].[Category] ([id], [category]) VALUES (11, N'Light Novel')
INSERT [dbo].[Category] ([id], [category]) VALUES (12, N'Sách Luyện Thi')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([id], [tag]) VALUES (1, N'hot')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (2, N'mới ra')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (3, N'bán chạy')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (4, N'hành động')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (5, N'phiêu lưu')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (6, N'giật gân')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (7, N'tình cảm')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (8, N'tiểu thuyết')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (9, N'giáo khoa')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (10, N'giáo trình')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (11, N'truyện')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (12, N'kiến thức ')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (13, N'văn học')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (14, N'thiếu nhi')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (15, N'tạp chí')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (16, N'pháp luật')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (17, N'lịch sử')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (18, N'gần hết')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (19, N'best seller')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (20, N'new')
INSERT [dbo].[Tag] ([id], [tag]) VALUES (21, N'kiếm hiệp')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [df_Category]  DEFAULT ((1)) FOR [categoryID]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Book_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Book_Tag_Tag] FOREIGN KEY([tagID])
REFERENCES [dbo].[Tag] ([id])
GO
ALTER TABLE [dbo].[Book_Tag] CHECK CONSTRAINT [FK_Book_Tag_Tag]
GO
ALTER TABLE [dbo].[Book_Tag]  WITH CHECK ADD  CONSTRAINT [fk_name1] FOREIGN KEY([tagID])
REFERENCES [dbo].[Tag] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book_Tag] CHECK CONSTRAINT [fk_name1]
GO
ALTER TABLE [dbo].[OnlineOrder]  WITH CHECK ADD  CONSTRAINT [FK_OnlineOrder_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[OnlineOrder] CHECK CONSTRAINT [FK_OnlineOrder_Customer]
GO
ALTER TABLE [dbo].[OnlineOrder]  WITH CHECK ADD  CONSTRAINT [FK_OnlineOrder_Receipt] FOREIGN KEY([receiptID])
REFERENCES [dbo].[Receipt] ([id])
GO
ALTER TABLE [dbo].[OnlineOrder] CHECK CONSTRAINT [FK_OnlineOrder_Receipt]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Staff]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [fk_staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [fk_staff]
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetail_Discount] FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([id])
GO
ALTER TABLE [dbo].[ReceiptDetail] CHECK CONSTRAINT [FK_ReceiptDetail_Discount]
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetail_Receipt] FOREIGN KEY([receiptID])
REFERENCES [dbo].[Receipt] ([id])
GO
ALTER TABLE [dbo].[ReceiptDetail] CHECK CONSTRAINT [FK_ReceiptDetail_Receipt]
GO
