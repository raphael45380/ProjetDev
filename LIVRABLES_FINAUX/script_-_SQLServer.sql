USE [master]
GO
/****** Object:  Database [ProjetDev]    Script Date: 04/12/2018 11:22:48 ******/
CREATE DATABASE [ProjetDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjetDev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjetDev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjetDev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjetDev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProjetDev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjetDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjetDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjetDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjetDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjetDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjetDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjetDev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjetDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjetDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjetDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjetDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjetDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjetDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjetDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjetDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjetDev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjetDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjetDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjetDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjetDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjetDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjetDev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjetDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjetDev] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjetDev] SET  MULTI_USER 
GO
ALTER DATABASE [ProjetDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjetDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjetDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjetDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjetDev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjetDev] SET QUERY_STORE = OFF
GO
USE [ProjetDev]
GO
/****** Object:  Table [dbo].[Aliments]    Script Date: 04/12/2018 11:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aliments](
	[ID_aliments] [int] NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Stockage] [nvarchar](50) NOT NULL,
	[Peremption] [date] NOT NULL,
 CONSTRAINT [PK_Aliments] PRIMARY KEY CLUSTERED 
(
	[ID_aliments] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chambre_froide]    Script Date: 04/12/2018 11:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chambre_froide](
	[ID_aliments] [int] NOT NULL,
	[Entree_cf] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Composition]    Script Date: 04/12/2018 11:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Composition](
	[ID_aliments] [int] NOT NULL,
	[ID_recette] [int] NOT NULL,
	[Quantite_aliments] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Congelateur]    Script Date: 04/12/2018 11:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Congelateur](
	[ID_aliments] [int] NOT NULL,
	[Entree_c] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recette]    Script Date: 04/12/2018 11:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recette](
	[ID_recette] [int] NOT NULL,
	[Titre] [nvarchar](50) NOT NULL,
	[Categorie] [nvarchar](50) NOT NULL,
	[Tp_preparation] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Recette] PRIMARY KEY CLUSTERED 
(
	[ID_recette] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserve]    Script Date: 04/12/2018 11:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserve](
	[ID_aliments] [int] NOT NULL,
	[Entree_r] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chambre_froide]  WITH CHECK ADD  CONSTRAINT [FK_Chambre_froide_Aliments] FOREIGN KEY([ID_aliments])
REFERENCES [dbo].[Aliments] ([ID_aliments])
GO
ALTER TABLE [dbo].[Chambre_froide] CHECK CONSTRAINT [FK_Chambre_froide_Aliments]
GO
ALTER TABLE [dbo].[Composition]  WITH CHECK ADD  CONSTRAINT [FK_Composition_Aliments] FOREIGN KEY([ID_aliments])
REFERENCES [dbo].[Aliments] ([ID_aliments])
GO
ALTER TABLE [dbo].[Composition] CHECK CONSTRAINT [FK_Composition_Aliments]
GO
ALTER TABLE [dbo].[Composition]  WITH CHECK ADD  CONSTRAINT [FK_Composition_Recette] FOREIGN KEY([ID_recette])
REFERENCES [dbo].[Recette] ([ID_recette])
GO
ALTER TABLE [dbo].[Composition] CHECK CONSTRAINT [FK_Composition_Recette]
GO
ALTER TABLE [dbo].[Congelateur]  WITH CHECK ADD  CONSTRAINT [FK_Congelateur_Aliments] FOREIGN KEY([ID_aliments])
REFERENCES [dbo].[Aliments] ([ID_aliments])
GO
ALTER TABLE [dbo].[Congelateur] CHECK CONSTRAINT [FK_Congelateur_Aliments]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Aliments] FOREIGN KEY([ID_aliments])
REFERENCES [dbo].[Aliments] ([ID_aliments])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Aliments]
GO
USE [master]
GO
ALTER DATABASE [ProjetDev] SET  READ_WRITE 
GO
