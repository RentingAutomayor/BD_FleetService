USE [master]
GO
/****** Object:  Database [DB_FleetService]    Script Date: 17/02/2021 12:53:41 p. m. ******/
CREATE DATABASE [DB_FleetService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_FleetService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_FleetService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_FleetService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_FleetService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_FleetService] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_FleetService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_FleetService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_FleetService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_FleetService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_FleetService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_FleetService] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_FleetService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_FleetService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_FleetService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_FleetService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_FleetService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_FleetService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_FleetService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_FleetService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_FleetService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_FleetService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_FleetService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_FleetService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_FleetService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_FleetService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_FleetService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_FleetService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_FleetService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_FleetService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_FleetService] SET  MULTI_USER 
GO
ALTER DATABASE [DB_FleetService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_FleetService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_FleetService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_FleetService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_FleetService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_FleetService] SET QUERY_STORE = OFF
GO
USE [DB_FleetService]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[act_id] [int] IDENTITY(1,1) NOT NULL,
	[act_name] [varchar](50) NOT NULL,
	[act_description] [varchar](150) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[act_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areas](
	[area_id] [int] IDENTITY(1,1) NOT NULL,
	[area_description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[bra_id] [int] IDENTITY(1,1) NOT NULL,
	[bra_name] [varchar](150) NULL,
	[bra_adress] [varchar](150) NULL,
	[bra_phone] [varchar](15) NULL,
	[bra_cellphone] [varchar](15) NULL,
	[cty_id] [int] NULL,
	[bra_isMain] [bit] NULL,
	[bra_state] [bit] NULL,
	[cli_id] [int] NULL,
	[deal_id] [int] NULL,
	[bra_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[bra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[cty_id] [int] NOT NULL,
	[cty_name] [varchar](100) NULL,
	[cty_state] [bit] NULL,
	[dpt_id] [int] NULL,
	[cty_dane_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[cty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_document] [varchar](10) NOT NULL,
	[cli_name] [varchar](255) NOT NULL,
	[cli_phone] [varchar](16) NULL,
	[cli_cellphone] [varchar](16) NULL,
	[cli_adress] [varchar](255) NULL,
	[cli_website] [varchar](255) NULL,
	[cty_id] [int] NULL,
	[cli_state] [bit] NULL,
	[cli_registrationDate] [datetime] NULL,
	[cli_updateDate] [datetime] NULL,
	[cli_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[cpn_id] [int] NOT NULL,
	[cpn_razonSocial] [varchar](50) NULL,
	[cpn_nit] [varchar](50) NULL,
	[cpn_state] [bit] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[cpn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[cnt_id] [int] IDENTITY(1,1) NOT NULL,
	[cnt_name] [varchar](150) NULL,
	[cnt_lastName] [varchar](150) NULL,
	[cnt_phone] [varchar](15) NULL,
	[cnt_cellPhone] [varchar](15) NULL,
	[cnt_email] [varchar](150) NULL,
	[cnt_adress] [varchar](150) NULL,
	[jtcl_id] [int] NULL,
	[cty_id] [int] NULL,
	[bra_id] [int] NULL,
	[cnt_state] [bit] NULL,
	[cli_id] [int] NULL,
	[deal_id] [int] NULL,
	[cnt_registrationDate] [datetime] NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[cnt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[cntr_id] [int] IDENTITY(1,1) NOT NULL,
	[cntr_consecutive] [int] NULL,
	[cntr_code] [varchar](50) NULL,
	[cntr_name] [varchar](100) NULL,
	[cntr_observation] [varchar](500) NULL,
	[deal_id] [int] NULL,
	[cli_id] [int] NULL,
	[cntrst_id] [int] NULL,
	[cntr_state] [bit] NULL,
	[dst_id] [int] NULL,
	[cntr_discountValue] [int] NULL,
	[cntr_amountOfMaintenances] [int] NOT NULL,
	[cntr_startingDate] [datetime] NULL,
	[cntr_endingDate] [datetime] NULL,
	[cntr_duration] [int] NULL,
	[cntr_registrationDate] [datetime] NULL,
	[cntr_updateDate] [datetime] NULL,
	[cntr_deleteDate] [datetime] NULL,
	[cntr_amountVehicles] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cntr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractState]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractState](
	[cntrst_id] [int] IDENTITY(1,1) NOT NULL,
	[cntrst_name] [varchar](100) NULL,
	[cntrst_description] [varchar](255) NULL,
	[cntrst_state] [bit] NULL,
	[cntrst_registrationDate] [datetime] NULL,
	[cntrst_updateDate] [datetime] NULL,
	[cntrst_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cntrst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ctry_id] [int] IDENTITY(1,1) NOT NULL,
	[ctry_name] [varchar](100) NULL,
	[ctry_state] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ctry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealer]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealer](
	[deal_id] [int] IDENTITY(1,1) NOT NULL,
	[deal_document] [varchar](30) NOT NULL,
	[deal_name] [varchar](255) NOT NULL,
	[deal_state] [bit] NULL,
	[deal_registrationDate] [datetime] NULL,
	[deal_updateDate] [datetime] NULL,
	[deal_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[deal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerByDealerNerwork]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerByDealerNerwork](
	[dbdn_id] [int] IDENTITY(1,1) NOT NULL,
	[dn_id] [int] NULL,
	[deal_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dbdn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerNetwork]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerNetwork](
	[dn_id] [int] IDENTITY(1,1) NOT NULL,
	[dn_name] [varchar](150) NOT NULL,
	[dn_state] [bit] NULL,
	[dn_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[dn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[dpt_id] [int] NOT NULL,
	[dpt_name] [varchar](100) NULL,
	[dpt_state] [bit] NULL,
	[ctry_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dpt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountType]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountType](
	[dst_id] [int] IDENTITY(1,1) NOT NULL,
	[dst_name] [varchar](150) NULL,
	[dst_state] [bit] NULL,
	[dst_registrationDate] [datetime] NULL,
	[dst_updateDate] [datetime] NULL,
	[dst_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[dst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frequency]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frequency](
	[fq_id] [int] IDENTITY(1,1) NOT NULL,
	[fq_name] [varchar](150) NOT NULL,
	[fq_state] [bit] NULL,
	[fq_registrationDate] [datetime] NULL,
	[fq_updateDate] [datetime] NULL,
	[fq_deleteDate] [datetime] NULL,
	[fq_shortName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[fq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupModule]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupModule](
	[grpmdl_id] [int] IDENTITY(1,1) NOT NULL,
	[grpmdl_create] [bit] NULL,
	[grpmdl_read] [bit] NULL,
	[grpmdl_update] [bit] NULL,
	[grpmdl_delete] [bit] NULL,
	[grp_id] [int] NOT NULL,
	[mdl_id] [int] NOT NULL,
 CONSTRAINT [PK_GroupModule] PRIMARY KEY CLUSTERED 
(
	[grpmdl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupModuleAction]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupModuleAction](
	[grpmdlact_id] [int] IDENTITY(1,1) NOT NULL,
	[grp_id] [int] NOT NULL,
	[mdl_id] [int] NOT NULL,
	[act_id] [int] NOT NULL,
 CONSTRAINT [PK_GroupModuleAction] PRIMARY KEY CLUSTERED 
(
	[grpmdlact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[grp_id] [int] IDENTITY(1,1) NOT NULL,
	[grp_name] [varchar](50) NOT NULL,
	[grp_description] [varchar](150) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsByRoutines]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsByRoutines](
	[ibr_id] [int] IDENTITY(1,1) NOT NULL,
	[mi_id] [int] NULL,
	[mr_id] [int] NULL,
	[mi_amount] [real] NULL,
	[ibr_registrationDate] [datetime] NULL,
	[ibr_updateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ibr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobTitle]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobTitle](
	[jt_id] [int] IDENTITY(1,1) NOT NULL,
	[jt_description] [varchar](50) NULL,
	[area_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[jt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitlesClient]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitlesClient](
	[jtcl_id] [int] IDENTITY(1,1) NOT NULL,
	[jtcl_description] [varchar](150) NULL,
	[jtcl_state] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[jtcl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItem]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceItem](
	[mi_id] [int] IDENTITY(1,1) NOT NULL,
	[mi_code] [varchar](50) NOT NULL,
	[mi_name] [varchar](255) NULL,
	[mi_description] [varchar](255) NULL,
	[tmi_id] [int] NOT NULL,
	[pu_id] [int] NOT NULL,
	[mi_referencePrice] [real] NULL,
	[mi_state] [bit] NULL,
	[mi_registrationDate] [datetime] NULL,
	[mi_updateDate] [datetime] NULL,
	[mi_deleteDate] [datetime] NULL,
	[mict_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemCategory]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceItemCategory](
	[mict_id] [int] IDENTITY(1,1) NOT NULL,
	[mict_name] [varchar](100) NULL,
	[mict_state] [bit] NULL,
	[mict_registrationDate] [datetime] NULL,
	[mict_updateDate] [datetime] NULL,
	[mict_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mict_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleModels]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceItemsByVehicleModels](
	[mivm_id] [int] IDENTITY(1,1) NOT NULL,
	[mi_id] [int] NULL,
	[vm_id] [int] NULL,
	[mivm_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mivm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleTypes]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceItemsByVehicleTypes](
	[mivt_id] [int] IDENTITY(1,1) NOT NULL,
	[mi_id] [int] NULL,
	[vt_id] [int] NULL,
	[mivt_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mivt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maintenanceRoutine]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maintenanceRoutine](
	[mr_id] [int] IDENTITY(1,1) NOT NULL,
	[mr_name] [varchar](150) NULL,
	[mr_description] [varchar](255) NULL,
	[vm_id] [int] NULL,
	[fq_id] [int] NULL,
	[mr_state] [bit] NULL,
	[mr_registrationDate] [datetime] NULL,
	[mr_updateDate] [datetime] NULL,
	[mr_deleteDate] [datetime] NULL,
	[mr_referencePrice] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[mr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[mdl_id] [int] IDENTITY(1,1) NOT NULL,
	[mdl_name] [varchar](50) NOT NULL,
	[mdl_path] [varchar](50) NOT NULL,
	[mdl_description] [varchar](150) NULL,
	[mdl_father] [int] NOT NULL,
	[mdl_state] [bit] NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[mdl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PresentationUnit]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresentationUnit](
	[pu_id] [int] IDENTITY(1,1) NOT NULL,
	[pu_shortName] [varchar](50) NOT NULL,
	[pu_longName] [varchar](150) NULL,
	[pu_state] [bit] NULL,
	[pu_registrationDate] [datetime] NULL,
	[pu_updateDate] [datetime] NULL,
	[pu_DeleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfMaintenanceItem]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfMaintenanceItem](
	[tmi_id] [int] IDENTITY(1,1) NOT NULL,
	[tmi_name] [varchar](50) NULL,
	[tmi_state] [bit] NULL,
	[tmi_registrationDate] [datetime] NULL,
	[tmi_updateDate] [datetime] NULL,
	[tmi_DeleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[tmi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[usr_id] [int] IDENTITY(1,1) NOT NULL,
	[usr_firstName] [varchar](50) NOT NULL,
	[usr_lastName] [varchar](50) NOT NULL,
	[usr_name] [varchar](50) NOT NULL,
	[usr_password] [varchar](25) NOT NULL,
	[grp_id] [int] NOT NULL,
	[cli_id] [int] NULL,
	[deal_id] [int] NULL,
	[cpn_id] [int] NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[veh_id] [int] IDENTITY(1,1) NOT NULL,
	[veh_licensePlate] [varchar](10) NULL,
	[veh_chasisCode] [varchar](20) NULL,
	[vm_id] [int] NULL,
	[veh_year] [varchar](4) NULL,
	[veh_mileage] [int] NULL,
	[cli_id] [int] NULL,
	[veh_state] [bit] NULL,
	[veh_registrationDate] [datetime] NULL,
	[veh_updateDate] [datetime] NULL,
	[veh_deleteDate] [datetime] NULL,
	[vs_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[veh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleBrand]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleBrand](
	[vb_id] [int] IDENTITY(1,1) NOT NULL,
	[vb_name] [varchar](100) NULL,
	[vb_state] [bit] NULL,
	[vb_registrationDate] [datetime] NULL,
	[vb_updateDate] [datetime] NULL,
	[vb_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[vb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleModel](
	[vm_id] [int] IDENTITY(1,1) NOT NULL,
	[vm_shortName] [varchar](100) NULL,
	[vm_longName] [varchar](255) NULL,
	[vm_state] [bit] NULL,
	[vm_registrationDate] [datetime] NULL,
	[vm_updateDate] [datetime] NULL,
	[vm_deleteDate] [datetime] NULL,
	[vb_id] [int] NULL,
	[vt_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[vm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleModelsByContract]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleModelsByContract](
	[vmcnt_id] [int] IDENTITY(1,1) NOT NULL,
	[vm_id] [int] NULL,
	[cntr_id] [int] NULL,
	[vmcnt_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[vmcnt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiclesByContract]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiclesByContract](
	[vehcntr_id] [int] IDENTITY(1,1) NOT NULL,
	[veh_id] [int] NULL,
	[cntr_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[vehcntr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicleState]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicleState](
	[vs_id] [int] IDENTITY(1,1) NOT NULL,
	[vs_name] [varchar](50) NULL,
	[vs_state] [bit] NULL,
	[vs_registrationDate] [datetime] NULL,
	[vs_updateDate] [datetime] NULL,
	[vs_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[vs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 17/02/2021 12:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[vt_id] [int] IDENTITY(1,1) NOT NULL,
	[vt_name] [varchar](100) NULL,
	[vt_description] [varchar](255) NULL,
	[vt_state] [bit] NULL,
	[vt_registrationDate] [datetime] NULL,
	[vt_updateDate] [datetime] NULL,
	[vt_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[vt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[branch] ADD  DEFAULT ((0)) FOR [bra_isMain]
GO
ALTER TABLE [dbo].[branch] ADD  DEFAULT ((1)) FOR [bra_state]
GO
ALTER TABLE [dbo].[branch] ADD  DEFAULT (getdate()) FOR [bra_registrationDate]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT ((1)) FOR [cty_state]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT ((1)) FOR [cli_state]
GO
ALTER TABLE [dbo].[Contact] ADD  DEFAULT ((1)) FOR [cnt_state]
GO
ALTER TABLE [dbo].[Contact] ADD  DEFAULT (getdate()) FOR [cnt_registrationDate]
GO
ALTER TABLE [dbo].[Contract] ADD  DEFAULT ((1)) FOR [cntr_state]
GO
ALTER TABLE [dbo].[Contract] ADD  DEFAULT ((0)) FOR [cntr_discountValue]
GO
ALTER TABLE [dbo].[Contract] ADD  DEFAULT (getdate()) FOR [cntr_registrationDate]
GO
ALTER TABLE [dbo].[ContractState] ADD  DEFAULT ((1)) FOR [cntrst_state]
GO
ALTER TABLE [dbo].[ContractState] ADD  DEFAULT (getdate()) FOR [cntrst_registrationDate]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT ((1)) FOR [deal_state]
GO
ALTER TABLE [dbo].[DealerNetwork] ADD  DEFAULT ((1)) FOR [dn_state]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((1)) FOR [dpt_state]
GO
ALTER TABLE [dbo].[DiscountType] ADD  DEFAULT ((1)) FOR [dst_state]
GO
ALTER TABLE [dbo].[DiscountType] ADD  DEFAULT (getdate()) FOR [dst_registrationDate]
GO
ALTER TABLE [dbo].[frequency] ADD  DEFAULT ((1)) FOR [fq_state]
GO
ALTER TABLE [dbo].[frequency] ADD  DEFAULT (getdate()) FOR [fq_registrationDate]
GO
ALTER TABLE [dbo].[ItemsByRoutines] ADD  DEFAULT (getdate()) FOR [ibr_registrationDate]
GO
ALTER TABLE [dbo].[JobTitlesClient] ADD  DEFAULT ((1)) FOR [jtcl_state]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT ((1)) FOR [mi_state]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT (getdate()) FOR [mi_registrationDate]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT (getdate()) FOR [mi_updateDate]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT (getdate()) FOR [mi_deleteDate]
GO
ALTER TABLE [dbo].[MaintenanceItemCategory] ADD  DEFAULT ((1)) FOR [mict_state]
GO
ALTER TABLE [dbo].[MaintenanceItemCategory] ADD  DEFAULT (getdate()) FOR [mict_registrationDate]
GO
ALTER TABLE [dbo].[MaintenanceItemsByVehicleModels] ADD  DEFAULT (getdate()) FOR [mivm_registrationDate]
GO
ALTER TABLE [dbo].[MaintenanceItemsByVehicleTypes] ADD  DEFAULT (getdate()) FOR [mivt_registrationDate]
GO
ALTER TABLE [dbo].[maintenanceRoutine] ADD  DEFAULT ((1)) FOR [mr_state]
GO
ALTER TABLE [dbo].[maintenanceRoutine] ADD  DEFAULT (getdate()) FOR [mr_registrationDate]
GO
ALTER TABLE [dbo].[PresentationUnit] ADD  DEFAULT ((1)) FOR [pu_state]
GO
ALTER TABLE [dbo].[PresentationUnit] ADD  DEFAULT (getdate()) FOR [pu_registrationDate]
GO
ALTER TABLE [dbo].[TypeOfMaintenanceItem] ADD  DEFAULT ((1)) FOR [tmi_state]
GO
ALTER TABLE [dbo].[TypeOfMaintenanceItem] ADD  DEFAULT (getdate()) FOR [tmi_registrationDate]
GO
ALTER TABLE [dbo].[Vehicle] ADD  DEFAULT ((1)) FOR [veh_state]
GO
ALTER TABLE [dbo].[Vehicle] ADD  DEFAULT (getdate()) FOR [veh_registrationDate]
GO
ALTER TABLE [dbo].[VehicleBrand] ADD  DEFAULT ((1)) FOR [vb_state]
GO
ALTER TABLE [dbo].[VehicleBrand] ADD  DEFAULT (getdate()) FOR [vb_registrationDate]
GO
ALTER TABLE [dbo].[VehicleModel] ADD  DEFAULT ((1)) FOR [vm_state]
GO
ALTER TABLE [dbo].[VehicleModel] ADD  DEFAULT (getdate()) FOR [vm_registrationDate]
GO
ALTER TABLE [dbo].[VehicleModelsByContract] ADD  DEFAULT (getdate()) FOR [vmcnt_registrationDate]
GO
ALTER TABLE [dbo].[vehicleState] ADD  DEFAULT ((1)) FOR [vs_state]
GO
ALTER TABLE [dbo].[vehicleState] ADD  DEFAULT (getdate()) FOR [vs_registrationDate]
GO
ALTER TABLE [dbo].[VehicleType] ADD  DEFAULT ((1)) FOR [vt_state]
GO
ALTER TABLE [dbo].[VehicleType] ADD  DEFAULT (getdate()) FOR [vt_registrationDate]
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD FOREIGN KEY([cty_id])
REFERENCES [dbo].[Cities] ([cty_id])
GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD FOREIGN KEY([dpt_id])
REFERENCES [dbo].[Departments] ([dpt_id])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([cty_id])
REFERENCES [dbo].[Cities] ([cty_id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([bra_id])
REFERENCES [dbo].[branch] ([bra_id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([cty_id])
REFERENCES [dbo].[Cities] ([cty_id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([jtcl_id])
REFERENCES [dbo].[JobTitlesClient] ([jtcl_id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([cntrst_id])
REFERENCES [dbo].[ContractState] ([cntrst_id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([dst_id])
REFERENCES [dbo].[DiscountType] ([dst_id])
GO
ALTER TABLE [dbo].[DealerByDealerNerwork]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[DealerByDealerNerwork]  WITH CHECK ADD FOREIGN KEY([dn_id])
REFERENCES [dbo].[DealerNetwork] ([dn_id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([ctry_id])
REFERENCES [dbo].[Countries] ([ctry_id])
GO
ALTER TABLE [dbo].[GroupModule]  WITH CHECK ADD FOREIGN KEY([grp_id])
REFERENCES [dbo].[Groups] ([grp_id])
GO
ALTER TABLE [dbo].[GroupModule]  WITH CHECK ADD FOREIGN KEY([mdl_id])
REFERENCES [dbo].[Modules] ([mdl_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([act_id])
REFERENCES [dbo].[Actions] ([act_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([grp_id])
REFERENCES [dbo].[Groups] ([grp_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([mdl_id])
REFERENCES [dbo].[Modules] ([mdl_id])
GO
ALTER TABLE [dbo].[ItemsByRoutines]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[ItemsByRoutines]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[ItemsByRoutines]  WITH CHECK ADD FOREIGN KEY([mr_id])
REFERENCES [dbo].[maintenanceRoutine] ([mr_id])
GO
ALTER TABLE [dbo].[ItemsByRoutines]  WITH CHECK ADD FOREIGN KEY([mr_id])
REFERENCES [dbo].[maintenanceRoutine] ([mr_id])
GO
ALTER TABLE [dbo].[jobTitle]  WITH CHECK ADD  CONSTRAINT [FK_jobTitle_areas] FOREIGN KEY([area_id])
REFERENCES [dbo].[areas] ([area_id])
GO
ALTER TABLE [dbo].[jobTitle] CHECK CONSTRAINT [FK_jobTitle_areas]
GO
ALTER TABLE [dbo].[MaintenanceItem]  WITH CHECK ADD FOREIGN KEY([pu_id])
REFERENCES [dbo].[PresentationUnit] ([pu_id])
GO
ALTER TABLE [dbo].[MaintenanceItem]  WITH CHECK ADD FOREIGN KEY([tmi_id])
REFERENCES [dbo].[TypeOfMaintenanceItem] ([tmi_id])
GO
ALTER TABLE [dbo].[MaintenanceItem]  WITH CHECK ADD  CONSTRAINT [FK_maintenanceItem_maintenanceItemCategory] FOREIGN KEY([mict_id])
REFERENCES [dbo].[MaintenanceItemCategory] ([mict_id])
GO
ALTER TABLE [dbo].[MaintenanceItem] CHECK CONSTRAINT [FK_maintenanceItem_maintenanceItemCategory]
GO
ALTER TABLE [dbo].[MaintenanceItemsByVehicleModels]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[MaintenanceItemsByVehicleModels]  WITH CHECK ADD FOREIGN KEY([vm_id])
REFERENCES [dbo].[VehicleModel] ([vm_id])
GO
ALTER TABLE [dbo].[MaintenanceItemsByVehicleTypes]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[MaintenanceItemsByVehicleTypes]  WITH CHECK ADD FOREIGN KEY([vt_id])
REFERENCES [dbo].[VehicleType] ([vt_id])
GO
ALTER TABLE [dbo].[maintenanceRoutine]  WITH CHECK ADD  CONSTRAINT [FK_maintenanceRoutine_frequency] FOREIGN KEY([fq_id])
REFERENCES [dbo].[frequency] ([fq_id])
GO
ALTER TABLE [dbo].[maintenanceRoutine] CHECK CONSTRAINT [FK_maintenanceRoutine_frequency]
GO
ALTER TABLE [dbo].[maintenanceRoutine]  WITH CHECK ADD  CONSTRAINT [FK_maintenanceRoutine_vehicleModel] FOREIGN KEY([vm_id])
REFERENCES [dbo].[VehicleModel] ([vm_id])
GO
ALTER TABLE [dbo].[maintenanceRoutine] CHECK CONSTRAINT [FK_maintenanceRoutine_vehicleModel]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([cpn_id])
REFERENCES [dbo].[Company] ([cpn_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([grp_id])
REFERENCES [dbo].[Groups] ([grp_id])
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD FOREIGN KEY([vm_id])
REFERENCES [dbo].[VehicleModel] ([vm_id])
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_vehicle_vehicleState] FOREIGN KEY([vs_id])
REFERENCES [dbo].[vehicleState] ([vs_id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_vehicle_vehicleState]
GO
ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_vehiclemodel_vehicleBrand] FOREIGN KEY([vb_id])
REFERENCES [dbo].[VehicleBrand] ([vb_id])
GO
ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_vehiclemodel_vehicleBrand]
GO
ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_vehicleModel_vehicleType] FOREIGN KEY([vt_id])
REFERENCES [dbo].[VehicleType] ([vt_id])
GO
ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_vehicleModel_vehicleType]
GO
ALTER TABLE [dbo].[VehicleModelsByContract]  WITH CHECK ADD FOREIGN KEY([cntr_id])
REFERENCES [dbo].[Contract] ([cntr_id])
GO
ALTER TABLE [dbo].[VehicleModelsByContract]  WITH CHECK ADD FOREIGN KEY([vm_id])
REFERENCES [dbo].[VehicleModel] ([vm_id])
GO
ALTER TABLE [dbo].[VehiclesByContract]  WITH CHECK ADD FOREIGN KEY([cntr_id])
REFERENCES [dbo].[Contract] ([cntr_id])
GO
ALTER TABLE [dbo].[VehiclesByContract]  WITH CHECK ADD FOREIGN KEY([veh_id])
REFERENCES [dbo].[Vehicle] ([veh_id])
GO
USE [master]
GO
ALTER DATABASE [DB_FleetService] SET  READ_WRITE 
GO
