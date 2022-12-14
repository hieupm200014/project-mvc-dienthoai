USE [master]
GO
/****** Object:  Database [ECartDB3]    Script Date: 6/25/2022 3:56:46 PM ******/
CREATE DATABASE [ECartDB3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECartDB3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIEUPM\MSSQL\DATA\ECartDB3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECartDB3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIEUPM\MSSQL\DATA\ECartDB3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ECartDB3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECartDB3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECartDB3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECartDB3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECartDB3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECartDB3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECartDB3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECartDB3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECartDB3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECartDB3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECartDB3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECartDB3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECartDB3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECartDB3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECartDB3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECartDB3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECartDB3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECartDB3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECartDB3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECartDB3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECartDB3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECartDB3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECartDB3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECartDB3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECartDB3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECartDB3] SET  MULTI_USER 
GO
ALTER DATABASE [ECartDB3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECartDB3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECartDB3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECartDB3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECartDB3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECartDB3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ECartDB3] SET QUERY_STORE = OFF
GO
USE [ECartDB3]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 6/25/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Categoryid] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NOT NULL,
	[MetaTitle] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 6/25/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Categoryid] [int] NOT NULL,
	[ProdName] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[ImagePath] [nvarchar](550) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/25/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[Userid] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone] [char](11) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__tblUser__1797D024ADDB5891] PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([Categoryid], [CategoryName], [MetaTitle]) VALUES (1, N'Tranh thêu chân dung', N'tranh-theu-chan-dung')
INSERT [dbo].[tblCategory] ([Categoryid], [CategoryName], [MetaTitle]) VALUES (2, N'Tranh thêu phong cảnh', N'tranh-theu-phong-canh')
INSERT [dbo].[tblCategory] ([Categoryid], [CategoryName], [MetaTitle]) VALUES (3, N'Tranh thêu động vật', N'tranh-theu-dong-vat')
INSERT [dbo].[tblCategory] ([Categoryid], [CategoryName], [MetaTitle]) VALUES (4, N'Tranh thêu hoa', N'tranh-theu-hoa')
INSERT [dbo].[tblCategory] ([Categoryid], [CategoryName], [MetaTitle]) VALUES (5, N'Tranh thêu Hà Nội', N'tranh-theu-ha-noi')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (1, 5, N'Tranh thêu Hồ Gươm', N'tranh-theu-ho-guom', N'Tranh thêu tay về Hồ gươm được rất nhiều các họa sĩ phác họa 1 cách sống động và tinh tế', N'ho-guom12.jpg', CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (3, 2, N'Tranh thêu bến đợi', N'tranh-theu-ben-doi', N'Tranh thêu Bến đợi là tác phẩm đề cao sự thủy chung của người phụ nữ Việt Nam, vẫn một lòng một dạ chờ đợi người đi xa.', N'bến-đợi.jpg', CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (6, 2, N'Tranh thêu cánh rừng', N'tranh-theu-canh-rung', N'Những bức tranh thêu rừng với sự phối hợp màu sắc hài hòa không chỉ mang tới giá trị nghệ thuật đặc sắc hơn hẳn tranh in.', N'canh-rung.jpg', CAST(999000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (7, 2, N'Tranh thêu chiều quê', N'tranh-theu-chieu-que', N'Bức tranh Chiều quê mang lại nhiều cảm xúc cho người xem. Một hình ảnh đơn sơ, quen thuộc, gợi nhớ những kỷ niệm tuổi ấu thơ. Bằng lối thêu truyền thống, chỉ cotton càng làm cho bức tranh thêm gần gũi, ...', N'chieu-que.jpg', CAST(1860000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (8, 2, N'Tranh thêu đồng quê', N'tranh-theu-dong-que', N'Bức tranh đồng quê mang lại nhiều cảm xúc cho người xem. Một hình ảnh đơn sơ, quen thuộc, gợi nhớ những kỷ niệm tuổi ấu thơ. Bằng lối thêu truyền thống, chỉ cotton càng làm cho bức tranh thêm gần gũi, ...', N'Dong-que.jpg', CAST(2199000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (9, 2, N'Tranh thêu gánh lúa', N'tranh-theu-ganh-lua', N'Cảnh người dân thôn quê vác lúa từ đồng về', N'ganh-lua.jpg', CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (10, 2, N'Tranh thêu Hạ Long', N'tranh-theu-ha-long', N'Khung cảnh buổi bình minh trên biển được nghệ nhân khéo léo phối trộn bằng những tông màu nâu vàng, trầm nhẹ, làm toát lên vẻ đẹp chân thực.', N'ha-long.jpg', CAST(1999000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (11, 1, N'Tranh thêu chúa gie-su', N'tranh-theu-chua-gie-su', N'Tranh thêu chúa gie-su', N'chua-giesu.jpg', CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (12, 1, N'Tranh thêu đức mẹ bồng con', N'tranh-theu-duc-me', N'Tranh thêu đức mẹ bồng con', N'duc_me-bong-con.jpg', CAST(1290000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (13, 1, N'Tranh thêu mẹ con', N'tranh-theu-me-con', N'Tranh thêu mẹ con', N'me-con.jpg', CAST(1499000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (14, 1, N'Tranh thêu Phúc-lộc-thọ', N'tranh-phuc-loc-tho', N'Tranh thêu Phúc-lộc-thọ', N'phuc-loc-tho.jpg', CAST(1899000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (15, 1, N'Tranh thêu thiếu nữ', N'tranh-thieu-nu', N'Tranh thêu thiếu nữ', N'thieu-nu.jpg', CAST(1799000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (19, 1, N'Tranh thêu thôn nữ', N'tranh-thon-nu', N'Tranh thêu thôn nữ', N'thon-nu.jpg', CAST(1199000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (22, 1, N'Tranh thêu trẻ thơ', N'tranh-tre-tho', N'Tranh thêu trẻ thơ', N'tre-tho.jpg', CAST(1900000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (23, 3, N'Tranh thêu bát mã truy phong', N'tranh-bat-ma', N'Tranh thêu bát mã truy phong', N'bat-ma-truy-phong.jpg', CAST(1999000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (24, 3, N'Tranh thêu bình yên', N'tranh-binh-yen', N'Tranh thêu bình yên', N'binh-yen.jpg', CAST(2599000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (25, 3, N'Tranh thêu chim uyên ương', N'tranh-uyen-uong', N'Tranh thêu chim uyên ương', N'chim-uyen-uong.jpg', CAST(1900000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (26, 3, N'Tranh thêu đảo hạc', N'tranh-dao-hac', N'Tranh thêu đảo hạc', N'dao-hac.jpg', CAST(1999000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (27, 3, N'Tranh thêu hồ thiên nga', N'tranh-ho-thien-nga', N'Tranh thêu hồ thiên nga', N'ho-thien-nga.jpg', CAST(1590000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (28, 3, N'Tranh thêu Mã đáo thành công', N'tranh-ma-dao', N'Tranh thêu Mã đáo thành công', N'ma-dao-thanh-cong.jpg', CAST(1199000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (29, 4, N'Tranh thêu đầm sen', N'tranh-dam-sen', N'Tranh thêu đầm sen', N'dam-sen.jpg', CAST(1230000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (30, 4, N'Tranh thêu giỏ hồng', N'tranh-gio-hong', N'Tranh thêu giỏ hồng', N'gio-hong.jpg', CAST(1199000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (31, 4, N'Tranh thêu hoa bách hợp', N'tranh-bach-hop', N'Tranh thêu hoa bách hợp', N'hoa-bach-hop.jpg', CAST(2500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (32, 4, N'Tranh thêu hoa cúc', N'tranh-hoa-cuc', N'Tranh thêu hoa cúc', N'hoa-cuc.jpg', CAST(1890000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (33, 4, N'Tranh thêu hoa đào', N'tranh-hoa-dao', N'Tranh thêu hoa đào', N'hoa-dao.jpg', CAST(1560000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (34, 4, N'Tranh thêu hoa lan vàng', N'tranh-hoa-lan', N'Tranh thêu hoa lan vàng tỏa hương thơm', N'hoa-lan-vang.jpg', CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (35, 5, N'Tranh thêu cầu Thê Húc', N'tranh-cau-the-huc', N'Tranh thêu cầu Thê Húc', N'cau-the-huc1.jpg', CAST(3000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (36, 5, N'Tranh thêu chùa một cột lớn', N'tranh-chua-mot-cot', N'Tranh thêu chùa một cột lớn', N'chua_mot_cot_co_lon.jpg', CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (37, 5, N'Tranh thêu phố cổ', N'tranh-pho-co', N'Tranh thêu phố cổ', N'pho_co_ha-noi.jpg', CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (38, 5, N'Tranh thêu phố cổ xích lô', N'tranh-pho-xich-lo', N'Tranh thêu phố cổ xích lô', N'pho-co-xich-lo.jpg', CAST(1499999.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (39, 5, N'Tranh thêu Hồ Gươm 3', N'tranh-ho-guom-3', N'Tranh thêu Hồ Gươm 3', N'ho_guom_13.jpg', CAST(1289000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblProduct] ([Pid], [Categoryid], [ProdName], [MetaTitle], [Description], [ImagePath], [Price]) VALUES (41, 2, N'Tranh sông nước', N'tranh-song-nuoc', N'Tranh sông nước ở nông thôn', N'song-que2.jpg', CAST(1200000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Userid], [Username], [Password], [Name], [Phone], [Address], [Email], [Status]) VALUES (1, N'hieupm', N'123', N'Hieu', N'039592857  ', N'Thai Binh', N'hieupm@gmail.com', 1)
INSERT [dbo].[tblUser] ([Userid], [Username], [Password], [Name], [Phone], [Address], [Email], [Status]) VALUES (2, N'anhnv', N'123', N'Anh', N'038618562  ', N'Ha noi', N'anh@gmail.com', 0)
INSERT [dbo].[tblUser] ([Userid], [Username], [Password], [Name], [Phone], [Address], [Email], [Status]) VALUES (3, N'hanv', N'123', N'Ha', N'023458158  ', N'Hai Phong', N'ha@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
USE [master]
GO
ALTER DATABASE [ECartDB3] SET  READ_WRITE 
GO
