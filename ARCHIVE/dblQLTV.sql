USE [master]
GO

WHILE EXISTS(select NULL from sys.databases where name='QLTV')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'QLTV') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [QLTV]
END
GO

/* Collation = SQL_Latin1_General_CP1_CI_AS */
CREATE DATABASE [QLTV]
GO

USE [QLTV]
GO

/****** Object:  Table [dbo].[tblDocGia]    Script Date: 5/30/2018 10:53:56 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblDocGia](
	[MaDocGia] [nchar](8) NOT NULL,
	[Hoten] [nchar](30) NOT NULL,
	[Ngaysinh] [datetime2](7) NOT NULL,
	[Diachi] [nchar](30) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Ngaylapthe] [datetime2](7) NOT NULL,
	[Ngayhethan] [datetime2](7) NOT NULL,
	[MaLoaiDocGia] [int] NOT NULL,
	[Sosachdangmuon] [int]  NULL,
	[Tinhtrangthe] [nchar](20) NULL,
 CONSTRAINT [PK_tblDocGia] PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblDocGia]
           ([MaDocGia]
           ,[Hoten]
           ,[Ngaysinh]
           ,[Diachi]
           ,[Email]
           ,[Ngaylapthe]
           ,[Ngayhethan]
           ,[MaLoaiDocGia]
           ,[Sosachdangmuon]
           ,[Tinhtrangthe])
     VALUES
           (N'18000000'
           ,N'Nguyễn Phi Phú'
           ,convert(datetime,'07/29/1998 00:00:00',101)
           ,N'Qui Nhơn, Bình đinh'
           ,N'phiphuqn1@gmail.com'
           ,convert(datetime,'04/18/2015 00:00:00',101)
           ,convert(datetime,'10/18/2015 00:00:00',101)
           ,1
           ,0
           ,N'Thẻ còn hạn')
GO


INSERT INTO [dbo].[tblDocGia]
           ([MaDocGia]
           ,[Hoten]
           ,[Ngaysinh]
           ,[Diachi]
           ,[Email]
           ,[Ngaylapthe]
           ,[Ngayhethan]
           ,[MaLoaiDocGia]
           ,[Sosachdangmuon]
           ,[Tinhtrangthe])
     VALUES
           (N'18000001'
           ,N'Huỳnh Ngọc Liêm'
           ,convert(datetime,'07/29/1998 00:00:00',101)
           ,N'Tùy Phước, Bình đinh'
           ,N'liemqn1@gmail.com'
           ,convert(datetime,'04/20/2014 00:00:00',101)
           ,convert(datetime,'10/20/2014 00:00:00',101)
           ,1
           ,0
           ,N'Thẻ hết hạn')
GO








USE [QLTV]
GO

/****** Object:  Table [dbo].[tblLoaiDocGia]    Script Date: 5/30/2018 10:54:11 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblLoaiDocGia](
	[MaLoaiDocGia] [int] NOT NULL,
	[Tenloaidocgia] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblLoaiDocGia] PRIMARY KEY CLUSTERED 
(
	[MaLoaiDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblLoaiDocGia]
           ([MaLoaiDocGia]
           ,[Tenloaidocgia])
     VALUES
           (1
           ,'X')
GO

INSERT INTO [dbo].[tblLoaiDocGia]
           ([MaLoaiDocGia]
           ,[Tenloaidocgia])
     VALUES
           (2
           ,'Y')
GO


USE [QLTV]
GO

/****** Object:  Table [dbo].[tblSach]    Script Date: 5/30/2018 10:54:52 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblSach](
	[MaSach] [int] NOT NULL,
	[Tensach] [nchar](50) NOT NULL,
	[MaTheLoai] [int] NOT NULL,
	[Tacgia] [nchar](30) NOT NULL,
	[Nhaxuatban] [nchar](50) NOT NULL,
	[Namxuatban] [int] NOT NULL,
	[Ngaynhap] [datetime2](7) NOT NULL,
	[Trigia] [nchar](30) NOT NULL,
	[Khoangcachxuatban] [int] NOT NULL,
	[MaTinhTrang] [int] NOT NULL,
 CONSTRAINT [PK_tblSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblSach]
           ([MaSach]
           ,[Tensach]
           ,[MaTheLoai]
           ,[Tacgia]
           ,[Nhaxuatban]
           ,[Namxuatban]
           ,[Ngaynhap]
           ,[Trigia]
           ,[Khoangcachxuatban]
           ,[MaTinhTrang])
     VALUES
           (1
           ,N'Nhập môn lập trình'
           ,1
           ,N'Nhiều giáo viên nổi tiếng'
           ,N'Nhà xuất bản khoa học và kỹ thuật'
           ,2010
           ,convert(datetime,'04/18/2010 00:00:00',101)
           ,N'30.000d'
           ,8
           ,1)
GO


INSERT INTO [dbo].[tblSach]
           ([MaSach]
           ,[Tensach]
           ,[MaTheLoai]
           ,[Tacgia]
           ,[Nhaxuatban]
           ,[Namxuatban]
           ,[Ngaynhap]
           ,[Trigia]
           ,[Khoangcachxuatban]
           ,[MaTinhTrang])
     VALUES
           (2
           ,N'Những nguyên lý cơ bản của chủ nghĩa Mac-Lenin'
           ,2
           ,N'Bộ giáo dục và đào tạo'
           ,N'Nhà xuất bản chính trị quốc gia sự thật'
           ,2017
           ,convert(datetime,'04/18/2018 00:00:00',101)
		   ,N'25.000d'
           ,1
           ,2)
GO

INSERT INTO [dbo].[tblSach]
           ([MaSach]
           ,[Tensach]
           ,[MaTheLoai]
           ,[Tacgia]
           ,[Nhaxuatban]
           ,[Namxuatban]
           ,[Ngaynhap]
           ,[Trigia]
           ,[Khoangcachxuatban]
           ,[MaTinhTrang])
	VALUES
           (3
           ,N'Cấu trúc rời rạc'
           ,3
           ,N'Nhiều giáo viên nổi tiếng'
           ,N'Nhà xuất bản Đại học quốc gia TP.Hồ chí Minh'
           ,2015
           ,convert(datetime,'04/18/2015 00:00:00',101)
		   ,N'15.000d'
           ,3
           ,2)
GO
  



USE [QLTV]
GO

/****** Object:  Table [dbo].[tblTheLoai]    Script Date: 5/30/2018 10:55:07 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTheLoai](
	[MaTheLoai] [int] NOT NULL,
	[Tentheloai] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblTheLoai]
           ([MaTheLoai]
           ,[Tentheloai])
     VALUES
           (1
           ,'A')
GO

INSERT INTO [dbo].[tblTheLoai]
           ([MaTheLoai]
           ,[Tentheloai])
     VALUES
           (2
           ,'B')
GO

INSERT INTO [dbo].[tblTheLoai]
           ([MaTheLoai]
           ,[Tentheloai])
     VALUES
           (3
           ,'C')
GO


USE [QLTV]
GO

/****** Object:  Table [dbo].[tblTinhTrang]    Script Date: 5/30/2018 10:55:20 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTinhTrang](
	[MaTinhTrang] [int] NOT NULL,
	[Tentinhtrang] [nchar](20) NOT NULL,
 CONSTRAINT [PK_tblTinhTrang] PRIMARY KEY CLUSTERED 
(
	[MaTinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblTinhTrang]
           ([MaTinhTrang]
           ,[Tentinhtrang])
     VALUES
           (1
           ,N'Chưa được mượn')
GO

INSERT INTO [dbo].[tblTinhTrang]
           ([MaTinhTrang]
           ,[Tentinhtrang])
     VALUES
           (2
           ,N'Đang được mượn')
GO



USE [QLTV]
GO

/****** Object:  Table [dbo].[tblPhieuMuonTra]    Script Date: 5/30/2018 10:55:30 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPhieuMuonTra](
	[MaPhieuMuon] [int] NOT NULL,
	[MaDocGia] [nchar](8) NOT NULL,
	[MaSach] [int] NOT NULL,
	[Ngaymuonsach] [datetime2](7) NOT NULL,
	[Ngaytrasach] [datetime2](7) NOT NULL,
	[Tienphat] [nchar](30) NOT NULL,
 CONSTRAINT [PK_tblPhieuMuon] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblPhieuMuonTra]
           ([MaPhieuMuon]
           ,[MaDocGia]
           ,[MaSach]
           ,[Ngaymuonsach]
           ,[Ngaytrasach]
           ,[Tienphat])
     VALUES
           (1
           ,N'18000000'
           ,1
           ,convert(datetime,'7/29/2015 00:00:00',101)
           ,convert(datetime,'7/30/2015 00:00:00',101)
           ,0)
GO

INSERT INTO [dbo].[tblPhieuMuonTra]
           ([MaPhieuMuon]
           ,[MaDocGia]
           ,[MaSach]
           ,[Ngaymuonsach]
           ,[Ngaytrasach]
           ,[Tienphat])
     VALUES
           (2
           ,N'18000001'
           ,2
           ,convert(datetime,'10/15/2017 00:00:00',101)
           ,convert(datetime,'10/30/2017 00:00:00',101)
           ,10000)
GO





USE [QLTV]
GO

/****** Object:  Table [dbo].[tblBaoCaoThongKeMuonSach]    Script Date: 6/4/2018 2:18:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBaoCaoThongKeMuonSach](
	[MaBaoCaoMuonSach] [int] NOT NULL,
	[ThangBaoCao] [int] NOT NULL,
	[MaChiTietBaoCaoMuonSach] [int] NOT NULL
) ON [PRIMARY]

GO


USE [QLTV]
GO

/****** Object:  Table [dbo].[tblBaoCaoThongKeTraSach]    Script Date: 6/4/2018 2:18:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBaoCaoThongKeTraSach](
	[MaBaoCaoTraSach] [int] NOT NULL,
	[NgayBaoCao] [int] NOT NULL,
	[MaChiTietBaoCaoTraSach] [int] NOT NULL
) ON [PRIMARY]

GO


USE [QLTV]
GO

/****** Object:  Table [dbo].[tblChiTietBaoCaoMuonSach]    Script Date: 6/4/2018 2:19:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblChiTietBaoCaoMuonSach](
	[MaChiTietBaoCaoMuonSach] [int] NOT NULL,
	[MaTheLoai] [int] NOT NULL,
	[Soluotmuon] [int] NOT NULL,
	[Tilemuon] [int] NOT NULL,
	[Tongsoluongmuon] [int] NOT NULL
) ON [PRIMARY]

GO


USE [QLTV]
GO

/****** Object:  Table [dbo].[tblChiTietBaoCaoTraSach]    Script Date: 6/4/2018 2:19:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblChiTietBaoCaoTraSach](
	[MaChiTietBaoCaoTraSach] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[Ngaymuon] [int] NOT NULL,
	[Songaytratre] [int] NOT NULL
) ON [PRIMARY]

GO


USE [QLTV]
GO

/****** Object:  Table [dbo].[tblQuiDinh]    Script Date: 6/29/2018 11:52:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblQuiDinh](
	[Tuoitoithieu] [int] NULL,
	[Tuoitoida] [int] NULL,
	[thoihanthe] [int] NULL,
	[Soluongtheloaitoida] [int] NULL,
	[Khoangcachnam] [int] NULL,
	[Soluongmuontoida] [int] NULL,
	[Ngaymuontoida] [int] NULL
) ON [PRIMARY]
GO


USE [QLTV]
GO

INSERT INTO [dbo].[tblQuiDinh]
           ([Tuoitoithieu]
           ,[Tuoitoida]
           ,[thoihanthe]
           ,[Soluongtheloaitoida]
           ,[Khoangcachnam]
           ,[Soluongmuontoida]
           ,[Ngaymuontoida])
     VALUES
           (18
           ,55
           ,6
           ,3
           ,8
           ,5
           ,4)
GO

USE [QLTV]
GO

/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 7/2/2018 11:35:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [nchar](50) NOT NULL,
	[Matkhau] [nchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO [dbo].[TaiKhoan]
           ([TenTaiKhoan]
           ,[Matkhau])
     VALUES
           (N'huynhngocliem'
           ,N'123456789')
GO

INSERT INTO [dbo].[TaiKhoan]
           ([TenTaiKhoan]
           ,[Matkhau])
     VALUES
           (N'quan;ythuvien'
           ,N'123')
GO
