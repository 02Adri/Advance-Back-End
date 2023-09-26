USE [master]
GO
/****** Object:  Database [Advance_Go]    Script Date: 25-septiembre-2023 23:01:29 ******/
CREATE DATABASE [Advance_Go]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Advance_Go', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Advance_Go.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Advance_Go_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Advance_Go_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Advance_Go] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Advance_Go].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Advance_Go] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Advance_Go] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Advance_Go] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Advance_Go] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Advance_Go] SET ARITHABORT OFF 
GO
ALTER DATABASE [Advance_Go] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Advance_Go] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Advance_Go] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Advance_Go] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Advance_Go] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Advance_Go] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Advance_Go] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Advance_Go] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Advance_Go] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Advance_Go] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Advance_Go] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Advance_Go] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Advance_Go] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Advance_Go] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Advance_Go] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Advance_Go] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Advance_Go] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Advance_Go] SET RECOVERY FULL 
GO
ALTER DATABASE [Advance_Go] SET  MULTI_USER 
GO
ALTER DATABASE [Advance_Go] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Advance_Go] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Advance_Go] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Advance_Go] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Advance_Go] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Advance_Go] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Advance_Go', N'ON'
GO
ALTER DATABASE [Advance_Go] SET QUERY_STORE = ON
GO
ALTER DATABASE [Advance_Go] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Advance_Go]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 25-septiembre-2023 23:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Identificacion] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Emprendimiento]    Script Date: 25-septiembre-2023 23:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Emprendimiento](
	[id_emprendimiento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Emprendimiento] [varchar](50) NULL,
	[Categoria] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[N_Ruc] [varchar](50) NULL,
	[id_emprendedor] [int] NULL,
 CONSTRAINT [PK_Detalles_Emprendimiento] PRIMARY KEY CLUSTERED 
(
	[id_emprendimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emprendedor]    Script Date: 25-septiembre-2023 23:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emprendedor](
	[id_emprendedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Fecha_Nacimiento] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Identificacion] [varchar](50) NULL,
 CONSTRAINT [PK_Emprendedor] PRIMARY KEY CLUSTERED 
(
	[id_emprendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 25-septiembre-2023 23:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[imagen] [image] NULL,
 CONSTRAINT [PK_Imagenes] PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion_Curricular]    Script Date: 25-septiembre-2023 23:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion_Curricular](
	[id_curricular] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Telefono] [varchar](50) NULL,
	[Identificacion] [varchar](50) NULL,
 CONSTRAINT [PK_Informacion_Curricular] PRIMARY KEY CLUSTERED 
(
	[id_curricular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesional]    Script Date: 25-septiembre-2023 23:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesional](
	[id_profesional] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Fecha_nacimiento] [date] NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Identificacion] [varchar](50) NULL,
 CONSTRAINT [PK_Profesional] PRIMARY KEY CLUSTERED 
(
	[id_profesional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (1, N'Julio', N'Cesar', N'Madriz', NULL, NULL, N'1236780-088', N'321-121290-0003K')
INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (2, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (3, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (4, N'Maycol ', N'Aroca', N'Somoto', CAST(N'2023-09-15' AS Date), N'Del BDF 1/2 C al oeste', N'84552327', N'321-0803489-0003K')
INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (5, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (6, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Cliente] ([id_cliente], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (7, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalles_Emprendimiento] ON 

INSERT [dbo].[Detalles_Emprendimiento] ([id_emprendimiento], [Nombre_Emprendimiento], [Categoria], [Ciudad], [Direccion], [Telefono], [N_Ruc], [id_emprendedor]) VALUES (1, N'BairesDev', N'Tecnologia', N'Somoto', N'DEL BDF 1/2 C al oeste', N'84552327', N'14356000234B', NULL)
INSERT [dbo].[Detalles_Emprendimiento] ([id_emprendimiento], [Nombre_Emprendimiento], [Categoria], [Ciudad], [Direccion], [Telefono], [N_Ruc], [id_emprendedor]) VALUES (2, N'', N'', N'', N'', N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[Detalles_Emprendimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Emprendedor] ON 

INSERT [dbo].[Emprendedor] ([id_emprendedor], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (1, N'Adrian Alejandro', N'Palma Benavides', N'Somoto', N'2008-02-23', N'Del BDF 1/C al oeste', N'84552327', N'321-080203-1004N')
INSERT [dbo].[Emprendedor] ([id_emprendedor], [Nombre], [Apellido], [Region], [Fecha_Nacimiento], [Direccion], [Telefono], [Identificacion]) VALUES (2, N'', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Emprendedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Imagenes] ON 

INSERT [dbo].[Imagenes] ([id_imagen], [imagen]) VALUES (1, 0x6361727269746F2E706E67)
SET IDENTITY_INSERT [dbo].[Imagenes] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesional] ON 

INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (1, N'Indiana', N'Villalobos', N'Madriz', CAST(N'2023-08-08' AS Date), N'78901234', N'De la erterbfh', N'321-090823-10004N')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (2, N'Alejandro', N'Gonzalez', N'Madriz', CAST(N'2004-12-08' AS Date), N'8900-1234', N'Del BDF 1/2 al oeste', N'321-091204-1004N')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (3, N'Marcial', N'Perez', N'Madriz', CAST(N'2002-03-08' AS Date), N'78901234', N'De la erterbfh', N'321-080202-10004N')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (4, N'Marcial', N'Perez', N'Madriz', CAST(N'2002-03-08' AS Date), N'78901234', N'De la erterbfh', N'321-080202-10004N')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (5, N'bccgcbb', N'hjhj', N'nvh', CAST(N'2023-09-21' AS Date), N'dgdrt', N'cgfg', N'ggu')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (6, N'Adrian Alejandro ', N'Palma Benavides', N'Somoto', CAST(N'2023-09-22' AS Date), N'84552327', N'Del, BDF 1/2 C al oste', N'321-080203-1004N')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (7, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (8, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (9, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (10, N'fsdff', N'czcz', N'xcvxvcxcv', CAST(N'2023-09-21' AS Date), N'7878', N'zczxczx', N'12121')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (11, N'Lucila Belen', N'Motano', N'Somoto', CAST(N'2023-09-15' AS Date), N'8455', N'SFVSVFS', N'18206565')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (12, N'zczczczad', N'sfsdf', N'fxvsf', CAST(N'2023-09-20' AS Date), N'7878', N'dsdsd', N'bbcbcb')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (13, N'Celeste', N'Pineda Hernandez', N'Somoto', CAST(N'2023-09-28' AS Date), N'78612524', N'Sector 17', N'321-191294-0003K')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (14, N'xvxvxv', N'fsfsf', N'czczx', CAST(N'2023-09-28' AS Date), N'xvxv', N'cxcxcxc', N'vxvxvxv')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (15, N'Alejandro ', N'Castillo', N'Somoto', CAST(N'2023-09-14' AS Date), N'78987989', N'dhfghdhfghfg', N'321hfhrhf')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (16, N'marcelo', N'alvarez', N'hjh', CAST(N'2023-09-06' AS Date), N'77687676', N'jhjdhjhod', N'hohhohod')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (17, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (18, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (19, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (20, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (21, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (22, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (23, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (24, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (25, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (26, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
INSERT [dbo].[Profesional] ([id_profesional], [Nombre], [Apellidos], [Region], [Fecha_nacimiento], [Telefono], [Direccion], [Identificacion]) VALUES (27, N'', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Profesional] OFF
GO
ALTER TABLE [dbo].[Detalles_Emprendimiento]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Emprendimiento_Emprendedor] FOREIGN KEY([id_emprendedor])
REFERENCES [dbo].[Emprendedor] ([id_emprendedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalles_Emprendimiento] CHECK CONSTRAINT [FK_Detalles_Emprendimiento_Emprendedor]
GO
USE [master]
GO
ALTER DATABASE [Advance_Go] SET  READ_WRITE 
GO
