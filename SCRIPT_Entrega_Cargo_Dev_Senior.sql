USE [master]
GO
/****** Object:  Database [DB_FleetService]    Script Date: 2021/07/04 10:02:40 a. m. ******/
CREATE DATABASE [DB_FleetService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_FleetService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DB_FleetService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_FleetService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DB_FleetService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Actions]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
	[cntr_amountOfMaintenances] [int] NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractState]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealer]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerByDealerNerwork]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerNetwork]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountType]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldsToOperate]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldsToOperate](
	[fto_id] [int] IDENTITY(1,1) NOT NULL,
	[fto_nameDb] [varchar](150) NULL,
	[fto_nameToShow] [varchar](150) NULL,
	[fto_state] [bit] NULL,
	[fto_registrationDate] [datetime] NULL,
	[fto_updateDate] [datetime] NULL,
	[fto_deleteDate] [datetime] NULL,
	[fto_tableName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[fto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialInformationByClient]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialInformationByClient](
	[ficl_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_id] [int] NULL,
	[ficl_approvedQuota] [float] NULL,
	[ficl_consumedQuota] [float] NULL,
	[ficl_currentQuota] [float] NULL,
	[ficl_inTransitQuota] [float] NULL,
	[ficl_state] [bit] NULL,
	[ficl_registrationDate] [datetime] NULL,
	[ficl_updateDate] [datetime] NULL,
	[ficl_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ficl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frequency]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupModuleAction]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsByRoutines]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobTitle]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitlesClient]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOG_TRX]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG_TRX](
	[ltrx_id] [int] IDENTITY(1,1) NOT NULL,
	[trx_id] [int] NULL,
	[ltrx_initApprovedQuota] [float] NULL,
	[ltrx_initConsumedQuota] [float] NULL,
	[ltrx_initCurrentQuota] [float] NULL,
	[ltrx_initInTransitQuota] [float] NULL,
	[ltrx_endApprovedQuota] [float] NULL,
	[ltrx_endConsumedQuota] [float] NULL,
	[ltrx_endCurrentQuota] [float] NULL,
	[ltrx_endInTransitQuota] [float] NULL,
	[ltrx_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ltrx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItem]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
	[mi_handleTax] [bit] NOT NULL,
	[deal_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemCategory]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleModels]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleTypes]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maintenanceRoutine]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movement]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movement](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[m_name] [varchar](155) NULL,
	[m_description] [varchar](255) NULL,
	[mtp_id] [int] NULL,
	[m_state] [bit] NULL,
	[m_registrationDate] [datetime] NULL,
	[m_updateDate] [datetime] NULL,
	[m_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovementType]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovementType](
	[mtp_id] [int] IDENTITY(1,1) NOT NULL,
	[mtp_name] [varchar](155) NOT NULL,
	[mtp_description] [varchar](255) NULL,
	[mtp_registrationDate] [datetime] NULL,
	[mtp_updateDate] [datetime] NULL,
	[mtp_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mtp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[observationsByTransaction]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[observationsByTransaction](
	[obstrx_id] [int] IDENTITY(1,1) NOT NULL,
	[trx_id] [int] NULL,
	[obstrx_description] [varchar](500) NULL,
	[obstrx_state] [bit] NULL,
	[obstrx_registrationDate] [datetime] NULL,
	[obtrx_updateDate] [datetime] NULL,
	[obtrx_deleteDate] [datetime] NULL,
	[usr_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[obstrx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[op_id] [int] IDENTITY(1,1) NOT NULL,
	[op_symbol] [varchar](3) NULL,
	[op_name] [varchar](150) NULL,
	[op_state] [bit] NULL,
	[op_registrationDate] [datetime] NULL,
	[op_updateDate] [datetime] NULL,
	[op_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[op_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PresentationUnit]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricesByContract]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricesByContract](
	[pbc_id] [int] IDENTITY(1,1) NOT NULL,
	[cntr_id] [int] NULL,
	[mi_id] [int] NULL,
	[mi_referencePrice] [real] NULL,
	[pbc_registrationDate] [datetime] NULL,
	[pbc_updateDate] [datetime] NULL,
	[pbc_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pbc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricesByDealer]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricesByDealer](
	[pbd_id] [int] IDENTITY(1,1) NOT NULL,
	[deal_id] [int] NULL,
	[mi_id] [int] NULL,
	[mi_referencePrice] [real] NULL,
	[pbd_registrationDate] [datetime] NULL,
	[pbd_updateDate] [datetime] NULL,
	[pbd_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pbd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RulesByMovement]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RulesByMovement](
	[rlm_id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NULL,
	[rlm_order] [int] NULL,
	[rlm_field_1] [int] NULL,
	[rlm_op_1] [int] NULL,
	[rlm_field_2] [int] NULL,
	[rlm_op_2] [int] NULL,
	[rlm_field_3] [int] NULL,
	[rlm_registrationDate] [datetime] NULL,
	[rlm_updateDate] [datetime] NULL,
	[rlm_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[rlm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taxes]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxes](
	[tax_id] [int] IDENTITY(1,1) NOT NULL,
	[tax_name] [varchar](50) NOT NULL,
	[tax_desccription] [varchar](255) NULL,
	[tax_percentValue] [int] NOT NULL,
	[tax_state] [bit] NULL,
	[tax_registrationDate] [datetime] NULL,
	[tax_updateDate] [datetime] NULL,
	[tax_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[tax_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxesByMaintenanceItem]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxesByMaintenanceItem](
	[txmi_id] [int] IDENTITY(1,1) NOT NULL,
	[tax_id] [int] NOT NULL,
	[mi_id] [int] NOT NULL,
	[txmi_registrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[txmi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionDetail]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionDetail](
	[trxdt_id] [int] IDENTITY(1,1) NOT NULL,
	[trx_id] [int] NULL,
	[veh_id] [int] NULL,
	[deal_id] [int] NULL,
	[bra_id] [int] NULL,
	[mr_id] [int] NULL,
	[cntr_id] [int] NULL,
	[usu_approbation] [int] NULL,
	[usu_reject] [int] NULL,
	[usu_anulation] [int] NULL,
	[trx_rejectDate] [datetime] NULL,
	[trx_approbationDate] [datetime] NULL,
	[trx_anulationDate] [datetime] NULL,
	[trx_relation_id] [int] NULL,
	[usu_ending] [int] NULL,
	[trx_endingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[trxdt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionItems]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionItems](
	[trxit_id] [int] IDENTITY(1,1) NOT NULL,
	[trx_id] [int] NULL,
	[mi_id] [int] NULL,
	[mi_amount] [real] NULL,
	[mi_referencePrice] [real] NULL,
	[mi_totalPrice] [real] NULL,
	[mi_taxesValue] [float] NULL,
	[mi_valueWithoutDiscount] [float] NULL,
	[mi_discountValue] [float] NULL,
	[mi_valueWithDiscountWithoutTaxes] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[trxit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[trx_id] [int] IDENTITY(1,1) NOT NULL,
	[trx_consecutive] [int] NULL,
	[m_id] [int] NULL,
	[trxst_id] [int] NULL,
	[trx_value] [float] NULL,
	[usu_id] [int] NULL,
	[trx_state] [bit] NULL,
	[trx_registrationDate] [datetime] NULL,
	[cli_id] [int] NULL,
	[trx_updateDate] [datetime] NULL,
	[trx_deleteDate] [datetime] NULL,
	[trx_taxesValue] [float] NULL,
	[trx_code] [varchar](30) NULL,
	[trx_valueWithoutDiscount] [float] NULL,
	[trx_discountValue] [float] NULL,
	[trx_valueWithDiscountWithoutTaxes] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[trx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionState]    Script Date: 2021/07/04 10:02:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionState](
	[trxst_id] [int] IDENTITY(1,1) NOT NULL,
	[trxst_name] [varchar](155) NULL,
	[trxst_description] [varchar](255) NULL,
	[trxst_state] [bit] NULL,
	[trxst_registrationDate] [datetime] NULL,
	[trxst_updateDate] [datetime] NULL,
	[trxst_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[trxst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfMaintenanceItem]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleBrand]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleModelsByContract]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiclesByContract]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicleState]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 2021/07/04 10:02:40 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (1, N'Create', N'Accion para crear nuevos recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (2, N'Read', N'Accion para solo lñleer los recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (3, N'Update', N'Accion para modificar o actualizar recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (4, N'Delete', N'Accion para eliminar recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (5, N'Adicionar Cupo', N'Es  una caccion para agregar nuevos cupos ')
SET IDENTITY_INSERT [dbo].[Actions] OFF
SET IDENTITY_INSERT [dbo].[branch] ON 

INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (1, N'prueba', N'prueba', N'2554689', N'3124557899', 9, NULL, 1, 1, NULL, CAST(N'2021-04-15T18:55:30.287' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (3, N'Calle 80', N'Calle 80 # 15 -16', NULL, N'3114556789', 107, NULL, 1, NULL, 2, CAST(N'2021-01-17T20:51:22.963' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (4, N'Calí', N'Calle falsa 123', N'7329434', NULL, 150, NULL, 1, NULL, 2, CAST(N'2021-01-17T20:51:47.377' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (7, N'Autoniza Calle 170', N'Diag. 170 No. 69-80', N'', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:32:29.373' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (8, N'Autoniza calle 34', N'carrea 7 # 34-07', N'6289999', N'', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:33:14.030' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (9, N'Autoniza Av Suba 116', N'transversal 60 no. 116-56', N'6289999', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:33:58.590' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (10, N'Autoniza calle 222', N'autopista norte no. 221-91', N'6289999', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:34:44.120' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (11, N'Autoniza calle 80', N'au medellín km 2.5 vía siberia - bogotá', N'6289999', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:35:25.177' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (12, N'Autoniza colisión buses y camiones', N'Calle 23 A No. 27- 41', N'6289999', N'', NULL, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:36:27.800' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (13, N'Autoniza Toberín', N'Calle 164 #19 b -20', N'6289999', N'', NULL, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:37:08.040' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (14, N'Autoniza Américas', N'Calle 23 # 31-17', N'6289999', N'', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:38:58.510' AS DateTime))
SET IDENTITY_INSERT [dbo].[branch] OFF
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1, N'Abriaquí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (2, N'Acacías', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (3, N'Acandí', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (4, N'Acevedo', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (5, N'Achí', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (6, N'Agrado', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (7, N'Agua de Dios', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (8, N'Aguachica', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (9, N'Aguada', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (10, N'Aguadas', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (11, N'Aguazul', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (12, N'Agustín Codazzi', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (13, N'Aipe', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (14, N'Albania', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (15, N'Albania', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (16, N'Albania', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (17, N'Albán', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (18, N'Albán (San José)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (19, N'Alcalá', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (20, N'Alejandria', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (21, N'Algarrobo', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (22, N'Algeciras', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (23, N'Almaguer', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (24, N'Almeida', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (25, N'Alpujarra', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (26, N'Altamira', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (27, N'Alto Baudó (Pie de Pato)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (28, N'Altos del Rosario', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (29, N'Alvarado', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (30, N'Amagá', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (31, N'Amalfi', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (32, N'Ambalema', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (33, N'Anapoima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (34, N'Ancuya', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (35, N'Andalucía', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (36, N'Andes', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (37, N'Angelópolis', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (38, N'Angostura', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (39, N'Anolaima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (40, N'Anorí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (41, N'Anserma', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (42, N'Ansermanuevo', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (43, N'Anzoátegui', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (44, N'Anzá', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (45, N'Apartadó', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (46, N'Apulo', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (47, N'Apía', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (48, N'Aquitania', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (49, N'Aracataca', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (50, N'Aranzazu', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (51, N'Aratoca', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (52, N'Arauca', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (53, N'Arauquita', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (54, N'Arbeláez', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (55, N'Arboleda (Berruecos)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (56, N'Arboledas', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (57, N'Arboletes', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (58, N'Arcabuco', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (59, N'Arenal', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (60, N'Argelia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (61, N'Argelia', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (62, N'Argelia', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (63, N'Ariguaní (El Difícil)', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (64, N'Arjona', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (65, N'Armenia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (66, N'Armenia', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (67, N'Armero (Guayabal)', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (68, N'Arroyohondo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (69, N'Astrea', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (70, N'Ataco', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (71, N'Atrato (Yuto)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (72, N'Ayapel', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (73, N'Bagadó', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (74, N'Bahía Solano (Mútis)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (75, N'Bajo Baudó (Pizarro)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (76, N'Balboa', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (77, N'Balboa', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (78, N'Baranoa', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (79, N'Baraya', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (80, N'Barbacoas', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (81, N'Barbosa', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (82, N'Barbosa', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (83, N'Barichara', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (84, N'Barranca de Upía', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (85, N'Barrancabermeja', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (86, N'Barrancas', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (87, N'Barranco de Loba', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (88, N'Barranquilla', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (89, N'Becerríl', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (90, N'Belalcázar', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (91, N'Bello', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (92, N'Belmira', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (93, N'Beltrán', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (94, N'Belén', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (95, N'Belén', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (96, N'Belén de Bajirá', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (97, N'Belén de Umbría', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (98, N'Belén de los Andaquíes', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (99, N'Berbeo', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (100, N'Betania', 1, 5, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (101, N'Beteitiva', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (102, N'Betulia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (103, N'Betulia', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (104, N'Bituima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (105, N'Boavita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (106, N'Bochalema', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (107, N'Bogotá', 1, 11, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (108, N'Bojacá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (109, N'Bojayá (Bellavista)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (110, N'Bolívar', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (111, N'Bolívar', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (112, N'Bolívar', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (113, N'Bolívar', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (114, N'Bosconia', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (115, N'Boyacá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (116, N'Briceño', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (117, N'Briceño', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (118, N'Bucaramanga', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (119, N'Bucarasica', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (120, N'Buenaventura', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (121, N'Buenavista', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (122, N'Buenavista', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (123, N'Buenavista', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (124, N'Buenavista', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (125, N'Buenos Aires', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (126, N'Buesaco', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (127, N'Buga', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (128, N'Bugalagrande', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (129, N'Burítica', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (130, N'Busbanza', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (131, N'Cabrera', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (132, N'Cabrera', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (133, N'Cabuyaro', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (134, N'Cachipay', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (135, N'Caicedo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (136, N'Caicedonia', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (137, N'Caimito', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (138, N'Cajamarca', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (139, N'Cajibío', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (140, N'Cajicá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (141, N'Calamar', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (142, N'Calamar', 1, 95, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (143, N'Calarcá', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (144, N'Caldas', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (145, N'Caldas', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (146, N'Caldono', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (147, N'California', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (148, N'Calima (Darién)', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (149, N'Caloto', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (150, N'Calí', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (151, N'Campamento', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (152, N'Campo de la Cruz', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (153, N'Campoalegre', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (154, N'Campohermoso', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (155, N'Canalete', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (156, N'Candelaria', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (157, N'Candelaria', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (158, N'Cantagallo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (159, N'Cantón de San Pablo', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (160, N'Caparrapí', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (161, N'Capitanejo', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (162, N'Caracolí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (163, N'Caramanta', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (164, N'Carcasí', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (165, N'Carepa', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (166, N'Carmen de Apicalá', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (167, N'Carmen de Carupa', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (168, N'Carmen de Viboral', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (169, N'Carmen del Darién (CURBARADÓ)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (170, N'Carolina', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (171, N'Cartagena', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (172, N'Cartagena del Chairá', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (173, N'Cartago', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (174, N'Carurú', 1, 97, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (175, N'Casabianca', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (176, N'Castilla la Nueva', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (177, N'Caucasia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (178, N'Cañasgordas', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (179, N'Cepita', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (180, N'Cereté', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (181, N'Cerinza', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (182, N'Cerrito', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (183, N'Cerro San Antonio', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (184, N'Chachaguí', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (185, N'Chaguaní', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (186, N'Chalán', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (187, N'Chaparral', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (188, N'Charalá', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (189, N'Charta', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (190, N'Chigorodó', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (191, N'Chima', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (192, N'Chimichagua', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (193, N'Chimá', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (194, N'Chinavita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (195, N'Chinchiná', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (196, N'Chinácota', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (197, N'Chinú', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (198, N'Chipaque', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (199, N'Chipatá', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (200, N'Chiquinquirá', 1, 15, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (201, N'Chiriguaná', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (202, N'Chiscas', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (203, N'Chita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (204, N'Chitagá', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (205, N'Chitaraque', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (206, N'Chivatá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (207, N'Chivolo', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (208, N'Choachí', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (209, N'Chocontá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (210, N'Chámeza', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (211, N'Chía', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (212, N'Chíquiza', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (213, N'Chívor', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (214, N'Cicuco', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (215, N'Cimitarra', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (216, N'Circasia', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (217, N'Cisneros', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (218, N'Ciénaga', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (219, N'Ciénaga', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (220, N'Ciénaga de Oro', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (221, N'Clemencia', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (222, N'Cocorná', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (223, N'Coello', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (224, N'Cogua', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (225, N'Colombia', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (226, N'Colosó (Ricaurte)', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (227, N'Colón', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (228, N'Colón (Génova)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (229, N'Concepción', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (230, N'Concepción', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (231, N'Concordia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (232, N'Concordia', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (233, N'Condoto', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (234, N'Confines', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (235, N'Consaca', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (236, N'Contadero', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (237, N'Contratación', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (238, N'Convención', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (239, N'Copacabana', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (240, N'Coper', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (241, N'Cordobá', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (242, N'Corinto', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (243, N'Coromoro', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (244, N'Corozal', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (245, N'Corrales', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (246, N'Cota', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (247, N'Cotorra', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (248, N'Covarachía', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (249, N'Coveñas', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (250, N'Coyaima', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (251, N'Cravo Norte', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (252, N'Cuaspud (Carlosama)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (253, N'Cubarral', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (254, N'Cubará', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (255, N'Cucaita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (256, N'Cucunubá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (257, N'Cucutilla', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (258, N'Cuitiva', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (259, N'Cumaral', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (260, N'Cumaribo', 1, 99, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (261, N'Cumbal', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (262, N'Cumbitara', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (263, N'Cunday', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (264, N'Curillo', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (265, N'Curití', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (266, N'Curumaní', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (267, N'Cáceres', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (268, N'Cáchira', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (269, N'Cácota', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (270, N'Cáqueza', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (271, N'Cértegui', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (272, N'Cómbita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (273, N'Córdoba', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (274, N'Córdoba', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (275, N'Cúcuta', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (276, N'Dabeiba', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (277, N'Dagua', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (278, N'Dibulla', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (279, N'Distracción', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (280, N'Dolores', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (281, N'Don Matías', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (282, N'Dos Quebradas', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (283, N'Duitama', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (284, N'Durania', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (285, N'Ebéjico', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (286, N'El Bagre', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (287, N'El Banco', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (288, N'El Cairo', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (289, N'El Calvario', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (290, N'El Carmen', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (291, N'El Carmen', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (292, N'El Carmen de Atrato', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (293, N'El Carmen de Bolívar', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (294, N'El Castillo', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (295, N'El Cerrito', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (296, N'El Charco', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (297, N'El Cocuy', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (298, N'El Colegio', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (299, N'El Copey', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (300, N'El Doncello', 1, 18, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (301, N'El Dorado', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (302, N'El Dovio', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (303, N'El Espino', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (304, N'El Guacamayo', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (305, N'El Guamo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (306, N'El Molino', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (307, N'El Paso', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (308, N'El Paujil', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (309, N'El Peñol', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (310, N'El Peñon', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (311, N'El Peñon', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (312, N'El Peñón', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (313, N'El Piñon', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (314, N'El Playón', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (315, N'El Retorno', 1, 95, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (316, N'El Retén', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (317, N'El Roble', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (318, N'El Rosal', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (319, N'El Rosario', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (320, N'El Tablón de Gómez', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (321, N'El Tambo', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (322, N'El Tambo', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (323, N'El Tarra', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (324, N'El Zulia', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (325, N'El Águila', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (326, N'Elías', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (327, N'Encino', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (328, N'Enciso', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (329, N'Entrerríos', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (330, N'Envigado', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (331, N'Espinal', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (332, N'Facatativá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (333, N'Falan', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (334, N'Filadelfia', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (335, N'Filandia', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (336, N'Firavitoba', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (337, N'Flandes', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (338, N'Florencia', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (339, N'Florencia', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (340, N'Floresta', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (341, N'Florida', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (342, N'Floridablanca', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (343, N'Florián', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (344, N'Fonseca', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (345, N'Fortúl', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (346, N'Fosca', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (347, N'Francisco Pizarro', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (348, N'Fredonia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (349, N'Fresno', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (350, N'Frontino', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (351, N'Fuente de Oro', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (352, N'Fundación', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (353, N'Funes', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (354, N'Funza', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (355, N'Fusagasugá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (356, N'Fómeque', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (357, N'Fúquene', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (358, N'Gachalá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (359, N'Gachancipá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (360, N'Gachantivá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (361, N'Gachetá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (362, N'Galapa', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (363, N'Galeras (Nueva Granada)', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (364, N'Galán', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (365, N'Gama', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (366, N'Gamarra', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (367, N'Garagoa', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (368, N'Garzón', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (369, N'Gigante', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (370, N'Ginebra', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (371, N'Giraldo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (372, N'Girardot', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (373, N'Girardota', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (374, N'Girón', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (375, N'Gonzalez', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (376, N'Gramalote', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (377, N'Granada', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (378, N'Granada', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (379, N'Granada', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (380, N'Guaca', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (381, N'Guacamayas', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (382, N'Guacarí', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (383, N'Guachavés', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (384, N'Guachené', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (385, N'Guachetá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (386, N'Guachucal', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (387, N'Guadalupe', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (388, N'Guadalupe', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (389, N'Guadalupe', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (390, N'Guaduas', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (391, N'Guaitarilla', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (392, N'Gualmatán', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (393, N'Guamal', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (394, N'Guamal', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (395, N'Guamo', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (396, N'Guapota', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (397, N'Guapí', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (398, N'Guaranda', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (399, N'Guarne', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (400, N'Guasca', 1, 25, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (401, N'Guatapé', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (402, N'Guataquí', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (403, N'Guatavita', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (404, N'Guateque', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (405, N'Guavatá', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (406, N'Guayabal de Siquima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (407, N'Guayabetal', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (408, N'Guayatá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (409, N'Guepsa', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (410, N'Guicán', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (411, N'Gutiérrez', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (412, N'Guática', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (413, N'Gámbita', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (414, N'Gámeza', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (415, N'Génova', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (416, N'Gómez Plata', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (417, N'Hacarí', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (418, N'Hatillo de Loba', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (419, N'Hato', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (420, N'Hato Corozal', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (421, N'Hatonuevo', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (422, N'Heliconia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (423, N'Herrán', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (424, N'Herveo', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (425, N'Hispania', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (426, N'Hobo', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (427, N'Honda', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (428, N'Ibagué', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (429, N'Icononzo', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (430, N'Iles', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (431, N'Imúes', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (432, N'Inzá', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (433, N'Inírida', 1, 94, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (434, N'Ipiales', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (435, N'Isnos', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (436, N'Istmina', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (437, N'Itagüí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (438, N'Ituango', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (439, N'Izá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (440, N'Jambaló', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (441, N'Jamundí', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (442, N'Jardín', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (443, N'Jenesano', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (444, N'Jericó', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (445, N'Jericó', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (446, N'Jerusalén', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (447, N'Jesús María', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (448, N'Jordán', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (449, N'Juan de Acosta', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (450, N'Junín', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (451, N'Juradó', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (452, N'La Apartada y La Frontera', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (453, N'La Argentina', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (454, N'La Belleza', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (455, N'La Calera', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (456, N'La Capilla', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (457, N'La Ceja', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (458, N'La Celia', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (459, N'La Cruz', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (460, N'La Cumbre', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (461, N'La Dorada', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (462, N'La Esperanza', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (463, N'La Estrella', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (464, N'La Florida', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (465, N'La Gloria', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (466, N'La Jagua de Ibirico', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (467, N'La Jagua del Pilar', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (468, N'La Llanada', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (469, N'La Macarena', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (470, N'La Merced', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (471, N'La Mesa', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (472, N'La Montañita', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (473, N'La Palma', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (474, N'La Paz', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (475, N'La Paz (Robles)', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (476, N'La Peña', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (477, N'La Pintada', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (478, N'La Plata', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (479, N'La Playa', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (480, N'La Primavera', 1, 99, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (481, N'La Salina', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (482, N'La Sierra', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (483, N'La Tebaida', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (484, N'La Tola', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (485, N'La Unión', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (486, N'La Unión', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (487, N'La Unión', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (488, N'La Unión', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (489, N'La Uvita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (490, N'La Vega', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (491, N'La Vega', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (492, N'La Victoria', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (493, N'La Victoria', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (494, N'La Victoria', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (495, N'La Virginia', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (496, N'Labateca', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (497, N'Labranzagrande', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (498, N'Landázuri', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (499, N'Lebrija', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (500, N'Leiva', 1, 52, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (501, N'Lejanías', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (502, N'Lenguazaque', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (503, N'Leticia', 1, 91, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (504, N'Liborina', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (505, N'Linares', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (506, N'Lloró', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (507, N'Lorica', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (508, N'Los Córdobas', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (509, N'Los Palmitos', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (510, N'Los Patios', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (511, N'Los Santos', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (512, N'Lourdes', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (513, N'Luruaco', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (514, N'Lérida', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (515, N'Líbano', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (516, N'López (Micay)', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (517, N'Macanal', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (518, N'Macaravita', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (519, N'Maceo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (520, N'Machetá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (521, N'Madrid', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (522, N'Magangué', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (523, N'Magüi (Payán)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (524, N'Mahates', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (525, N'Maicao', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (526, N'Majagual', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (527, N'Malambo', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (528, N'Mallama (Piedrancha)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (529, N'Manatí', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (530, N'Manaure', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (531, N'Manaure Balcón del Cesar', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (532, N'Manizales', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (533, N'Manta', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (534, N'Manzanares', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (535, N'Maní', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (536, N'Mapiripan', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (537, N'Margarita', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (538, N'Marinilla', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (539, N'Maripí', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (540, N'Mariquita', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (541, N'Marmato', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (542, N'Marquetalia', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (543, N'Marsella', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (544, N'Marulanda', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (545, N'María la Baja', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (546, N'Matanza', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (547, N'Medellín', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (548, N'Medina', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (549, N'Medio Atrato', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (550, N'Medio Baudó', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (551, N'Medio San Juan (ANDAGOYA)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (552, N'Melgar', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (553, N'Mercaderes', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (554, N'Mesetas', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (555, N'Milán', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (556, N'Miraflores', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (557, N'Miraflores', 1, 95, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (558, N'Miranda', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (559, N'Mistrató', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (560, N'Mitú', 1, 97, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (561, N'Mocoa', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (562, N'Mogotes', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (563, N'Molagavita', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (564, N'Momil', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (565, N'Mompós', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (566, N'Mongua', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (567, N'Monguí', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (568, N'Moniquirá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (569, N'Montebello', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (570, N'Montecristo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (571, N'Montelíbano', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (572, N'Montenegro', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (573, N'Monteria', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (574, N'Monterrey', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (575, N'Morales', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (576, N'Morales', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (577, N'Morelia', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (578, N'Morroa', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (579, N'Mosquera', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (580, N'Mosquera', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (581, N'Motavita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (582, N'Moñitos', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (583, N'Murillo', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (584, N'Murindó', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (585, N'Mutatá', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (586, N'Mutiscua', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (587, N'Muzo', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (588, N'Málaga', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (589, N'Nariño', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (590, N'Nariño', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (591, N'Nariño', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (592, N'Natagaima', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (593, N'Nechí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (594, N'Necoclí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (595, N'Neira', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (596, N'Neiva', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (597, N'Nemocón', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (598, N'Nilo', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (599, N'Nimaima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (600, N'Nobsa', 1, 15, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (601, N'Nocaima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (602, N'Norcasia', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (603, N'Norosí', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (604, N'Novita', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (605, N'Nueva Granada', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (606, N'Nuevo Colón', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (607, N'Nunchía', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (608, N'Nuquí', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (609, N'Nátaga', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (610, N'Obando', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (611, N'Ocamonte', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (612, N'Ocaña', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (613, N'Oiba', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (614, N'Oicatá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (615, N'Olaya', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (616, N'Olaya Herrera', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (617, N'Onzaga', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (618, N'Oporapa', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (619, N'Orito', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (620, N'Orocué', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (621, N'Ortega', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (622, N'Ospina', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (623, N'Otanche', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (624, N'Ovejas', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (625, N'Pachavita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (626, N'Pacho', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (627, N'Padilla', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (628, N'Paicol', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (629, N'Pailitas', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (630, N'Paime', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (631, N'Paipa', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (632, N'Pajarito', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (633, N'Palermo', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (634, N'Palestina', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (635, N'Palestina', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (636, N'Palmar', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (637, N'Palmar de Varela', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (638, N'Palmas del Socorro', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (639, N'Palmira', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (640, N'Palmito', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (641, N'Palocabildo', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (642, N'Pamplona', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (643, N'Pamplonita', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (644, N'Pandi', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (645, N'Panqueba', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (646, N'Paratebueno', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (647, N'Pasca', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (648, N'Patía (El Bordo)', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (649, N'Pauna', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (650, N'Paya', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (651, N'Paz de Ariporo', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (652, N'Paz de Río', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (653, N'Pedraza', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (654, N'Pelaya', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (655, N'Pensilvania', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (656, N'Peque', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (657, N'Pereira', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (658, N'Pesca', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (659, N'Peñol', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (660, N'Piamonte', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (661, N'Pie de Cuesta', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (662, N'Piedras', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (663, N'Piendamó', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (664, N'Pijao', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (665, N'Pijiño', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (666, N'Pinchote', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (667, N'Pinillos', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (668, N'Piojo', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (669, N'Pisva', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (670, N'Pital', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (671, N'Pitalito', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (672, N'Pivijay', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (673, N'Planadas', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (674, N'Planeta Rica', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (675, N'Plato', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (676, N'Policarpa', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (677, N'Polonuevo', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (678, N'Ponedera', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (679, N'Popayán', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (680, N'Pore', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (681, N'Potosí', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (682, N'Pradera', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (683, N'Prado', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (684, N'Providencia', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (685, N'Providencia', 1, 88, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (686, N'Pueblo Bello', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (687, N'Pueblo Nuevo', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (688, N'Pueblo Rico', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (689, N'Pueblorrico', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (690, N'Puebloviejo', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (691, N'Puente Nacional', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (692, N'Puerres', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (693, N'Puerto Asís', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (694, N'Puerto Berrío', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (695, N'Puerto Boyacá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (696, N'Puerto Caicedo', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (697, N'Puerto Carreño', 1, 99, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (698, N'Puerto Colombia', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (699, N'Puerto Concordia', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (700, N'Puerto Escondido', 1, 23, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (701, N'Puerto Gaitán', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (702, N'Puerto Guzmán', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (703, N'Puerto Leguízamo', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (704, N'Puerto Libertador', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (705, N'Puerto Lleras', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (706, N'Puerto López', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (707, N'Puerto Nare', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (708, N'Puerto Nariño', 1, 91, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (709, N'Puerto Parra', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (710, N'Puerto Rico', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (711, N'Puerto Rico', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (712, N'Puerto Rondón', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (713, N'Puerto Salgar', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (714, N'Puerto Santander', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (715, N'Puerto Tejada', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (716, N'Puerto Triunfo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (717, N'Puerto Wilches', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (718, N'Pulí', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (719, N'Pupiales', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (720, N'Puracé (Coconuco)', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (721, N'Purificación', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (722, N'Purísima', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (723, N'Pácora', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (724, N'Páez', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (725, N'Páez (Belalcazar)', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (726, N'Páramo', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (727, N'Quebradanegra', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (728, N'Quetame', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (729, N'Quibdó', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (730, N'Quimbaya', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (731, N'Quinchía', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (732, N'Quipama', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (733, N'Quipile', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (734, N'Ragonvalia', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (735, N'Ramiriquí', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (736, N'Recetor', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (737, N'Regidor', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (738, N'Remedios', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (739, N'Remolino', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (740, N'Repelón', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (741, N'Restrepo', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (742, N'Restrepo', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (743, N'Retiro', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (744, N'Ricaurte', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (745, N'Ricaurte', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (746, N'Rio Negro', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (747, N'Rioblanco', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (748, N'Riofrío', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (749, N'Riohacha', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (750, N'Risaralda', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (751, N'Rivera', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (752, N'Roberto Payán (San José)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (753, N'Roldanillo', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (754, N'Roncesvalles', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (755, N'Rondón', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (756, N'Rosas', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (757, N'Rovira', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (758, N'Ráquira', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (759, N'Río Iró', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (760, N'Río Quito', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (761, N'Río Sucio', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (762, N'Río Viejo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (763, N'Río de oro', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (764, N'Ríonegro', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (765, N'Ríosucio', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (766, N'Sabana de Torres', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (767, N'Sabanagrande', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (768, N'Sabanalarga', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (769, N'Sabanalarga', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (770, N'Sabanalarga', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (771, N'Sabanas de San Angel (SAN ANGEL)', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (772, N'Sabaneta', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (773, N'Saboyá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (774, N'Sahagún', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (775, N'Saladoblanco', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (776, N'Salamina', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (777, N'Salamina', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (778, N'Salazar', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (779, N'Saldaña', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (780, N'Salento', 1, 63, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (781, N'Salgar', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (782, N'Samacá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (783, N'Samaniego', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (784, N'Samaná', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (785, N'Sampués', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (786, N'San Agustín', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (787, N'San Alberto', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (788, N'San Andrés', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (789, N'San Andrés Sotavento', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (790, N'San Andrés de Cuerquía', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (791, N'San Antero', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (792, N'San Antonio', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (793, N'San Antonio de Tequendama', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (794, N'San Benito', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (795, N'San Benito Abad', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (796, N'San Bernardo', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (797, N'San Bernardo', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (798, N'San Bernardo del Viento', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (799, N'San Calixto', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (800, N'San Carlos', 1, 5, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (801, N'San Carlos', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (802, N'San Carlos de Guaroa', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (803, N'San Cayetano', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (804, N'San Cayetano', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (805, N'San Cristobal', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (806, N'San Diego', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (807, N'San Eduardo', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (808, N'San Estanislao', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (809, N'San Fernando', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (810, N'San Francisco', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (811, N'San Francisco', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (812, N'San Francisco', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (813, N'San Gíl', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (814, N'San Jacinto', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (815, N'San Jacinto del Cauca', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (816, N'San Jerónimo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (817, N'San Joaquín', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (818, N'San José', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (819, N'San José de Miranda', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (820, N'San José de Montaña', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (821, N'San José de Pare', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (822, N'San José de Uré', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (823, N'San José del Fragua', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (824, N'San José del Guaviare', 1, 95, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (825, N'San José del Palmar', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (826, N'San Juan de Arama', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (827, N'San Juan de Betulia', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (828, N'San Juan de Nepomuceno', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (829, N'Pasto', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (830, N'San Juan de Río Seco', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (831, N'San Juan de Urabá', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (832, N'San Juan del Cesar', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (833, N'San Juanito', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (834, N'San Lorenzo', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (835, N'San Luis', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (836, N'San Luís', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (837, N'San Luís de Gaceno', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (838, N'San Luís de Palenque', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (839, N'San Marcos', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (840, N'San Martín', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (841, N'San Martín', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (842, N'San Martín de Loba', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (843, N'San Mateo', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (844, N'San Miguel', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (845, N'San Miguel', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (846, N'San Miguel de Sema', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (847, N'San Onofre', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (848, N'San Pablo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (849, N'San Pablo', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (850, N'San Pablo de Borbur', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (851, N'San Pedro', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (852, N'San Pedro', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (853, N'San Pedro', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (854, N'San Pedro de Cartago', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (855, N'San Pedro de Urabá', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (856, N'San Pelayo', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (857, N'San Rafael', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (858, N'San Roque', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (859, N'San Sebastián', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (860, N'San Sebastián de Buenavista', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (861, N'San Vicente', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (862, N'San Vicente del Caguán', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (863, N'San Vicente del Chucurí', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (864, N'San Zenón', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (865, N'Sandoná', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (866, N'Santa Ana', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (867, N'Santa Bárbara', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (868, N'Santa Bárbara', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (869, N'Santa Bárbara (Iscuandé)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (870, N'Santa Bárbara de Pinto', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (871, N'Santa Catalina', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (872, N'Santa Fé de Antioquia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (873, N'Santa Genoveva de Docorodó', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (874, N'Santa Helena del Opón', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (875, N'Santa Isabel', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (876, N'Santa Lucía', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (877, N'Santa Marta', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (878, N'Santa María', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (879, N'Santa María', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (880, N'Santa Rosa', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (881, N'Santa Rosa', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (882, N'Santa Rosa de Cabal', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (883, N'Santa Rosa de Osos', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (884, N'Santa Rosa de Viterbo', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (885, N'Santa Rosa del Sur', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (886, N'Santa Rosalía', 1, 99, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (887, N'Santa Sofía', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (888, N'Santana', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (889, N'Santander de Quilichao', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (890, N'Santiago', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (891, N'Santiago', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (892, N'Santo Domingo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (893, N'Santo Tomás', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (894, N'Santuario', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (895, N'Santuario', 1, 66, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (896, N'Sapuyes', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (897, N'Saravena', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (898, N'Sardinata', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (899, N'Sasaima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (900, N'Sativanorte', 1, 15, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (901, N'Sativasur', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (902, N'Segovia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (903, N'Sesquilé', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (904, N'Sevilla', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (905, N'Siachoque', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (906, N'Sibaté', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (907, N'Sibundoy', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (908, N'Silos', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (909, N'Silvania', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (910, N'Silvia', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (911, N'Simacota', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (912, N'Simijaca', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (913, N'Simití', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (914, N'Sincelejo', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (915, N'Sincé', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (916, N'Sipí', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (917, N'Sitionuevo', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (918, N'Soacha', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (919, N'Soatá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (920, N'Socha', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (921, N'Socorro', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (922, N'Socotá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (923, N'Sogamoso', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (924, N'Solano', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (925, N'Soledad', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (926, N'Solita', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (927, N'Somondoco', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (928, N'Sonsón', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (929, N'Sopetrán', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (930, N'Soplaviento', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (931, N'Sopó', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (932, N'Sora', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (933, N'Soracá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (934, N'Sotaquirá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (935, N'Sotara (Paispamba)', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (936, N'Sotomayor (Los Andes)', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (937, N'Suaita', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (938, N'Suan', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (939, N'Suaza', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (940, N'Subachoque', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (941, N'Sucre', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (942, N'Sucre', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (943, N'Sucre', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (944, N'Suesca', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (945, N'Supatá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (946, N'Supía', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (947, N'Suratá', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (948, N'Susa', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (949, N'Susacón', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (950, N'Sutamarchán', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (951, N'Sutatausa', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (952, N'Sutatenza', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (953, N'Suárez', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (954, N'Suárez', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (955, N'Sácama', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (956, N'Sáchica', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (957, N'Tabio', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (958, N'Tadó', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (959, N'Talaigua Nuevo', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (960, N'Tamalameque', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (961, N'Tame', 1, 81, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (962, N'Taminango', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (963, N'Tangua', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (964, N'Taraira', 1, 97, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (965, N'Tarazá', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (966, N'Tarqui', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (967, N'Tarso', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (968, N'Tasco', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (969, N'Tauramena', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (970, N'Tausa', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (971, N'Tello', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (972, N'Tena', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (973, N'Tenerife', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (974, N'Tenjo', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (975, N'Tenza', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (976, N'Teorama', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (977, N'Teruel', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (978, N'Tesalia', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (979, N'Tibacuy', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (980, N'Tibaná', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (981, N'Tibasosa', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (982, N'Tibirita', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (983, N'Tibú', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (984, N'Tierralta', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (985, N'Timaná', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (986, N'Timbiquí', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (987, N'Timbío', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (988, N'Tinjacá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (989, N'Tipacoque', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (990, N'Tiquisio (Puerto Rico)', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (991, N'Titiribí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (992, N'Toca', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (993, N'Tocaima', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (994, N'Tocancipá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (995, N'Toguí', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (996, N'Toledo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (997, N'Toledo', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (998, N'Tolú', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (999, N'Tolú Viejo', 1, 70, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1000, N'Tona', 1, 68, NULL)
GO
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1001, N'Topagá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1002, N'Topaipí', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1003, N'Toribío', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1004, N'Toro', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1005, N'Tota', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1006, N'Totoró', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1007, N'Trinidad', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1008, N'Trujillo', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1009, N'Tubará', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1010, N'Tuchín', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1011, N'Tulúa', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1012, N'Tumaco', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1013, N'Tunja', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1014, N'Tunungua', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1015, N'Turbaco', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1016, N'Turbaná', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1017, N'Turbo', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1018, N'Turmequé', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1019, N'Tuta', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1020, N'Tutasá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1021, N'Támara', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1022, N'Támesis', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1023, N'Túquerres', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1024, N'Ubalá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1025, N'Ubaque', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1026, N'Ubaté', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1027, N'Ulloa', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1028, N'Une', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1029, N'Unguía', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1030, N'Unión Panamericana (ÁNIMAS)', 1, 27, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1031, N'Uramita', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1032, N'Uribe', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1033, N'Uribia', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1034, N'Urrao', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1035, N'Urumita', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1036, N'Usiacuri', 1, 8, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1037, N'Valdivia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1038, N'Valencia', 1, 23, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1039, N'Valle de San José', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1040, N'Valle de San Juan', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1041, N'Valle del Guamuez', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1042, N'Valledupar', 1, 20, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1043, N'Valparaiso', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1044, N'Valparaiso', 1, 18, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1045, N'Vegachí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1046, N'Venadillo', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1047, N'Venecia', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1048, N'Venecia (Ospina Pérez)', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1049, N'Ventaquemada', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1050, N'Vergara', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1051, N'Versalles', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1052, N'Vetas', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1053, N'Viani', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1054, N'Vigía del Fuerte', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1055, N'Vijes', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1056, N'Villa Caro', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1057, N'Villa Rica', 1, 19, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1058, N'Villa de Leiva', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1059, N'Villa del Rosario', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1060, N'Villagarzón', 1, 86, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1061, N'Villagómez', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1062, N'Villahermosa', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1063, N'Villamaría', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1064, N'Villanueva', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1065, N'Villanueva', 1, 44, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1066, N'Villanueva', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1067, N'Villanueva', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1068, N'Villapinzón', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1069, N'Villarrica', 1, 73, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1070, N'Villavicencio', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1071, N'Villavieja', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1072, N'Villeta', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1073, N'Viotá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1074, N'Viracachá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1075, N'Vista Hermosa', 1, 50, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1076, N'Viterbo', 1, 17, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1077, N'Vélez', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1078, N'Yacopí', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1079, N'Yacuanquer', 1, 52, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1080, N'Yaguará', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1081, N'Yalí', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1082, N'Yarumal', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1083, N'Yolombó', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1084, N'Yondó (Casabe)', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1085, N'Yopal', 1, 85, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1086, N'Yotoco', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1087, N'Yumbo', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1088, N'Zambrano', 1, 13, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1089, N'Zapatoca', 1, 68, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1090, N'Zapayán (PUNTA DE PIEDRAS)', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1091, N'Zaragoza', 1, 5, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1092, N'Zarzal', 1, 76, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1093, N'Zetaquirá', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1094, N'Zipacón', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1095, N'Zipaquirá', 1, 25, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1096, N'Zona Bananera (PRADO - SEVILLA)', 1, 47, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1097, N'Ábrego', 1, 54, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1098, N'Íquira', 1, 41, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1099, N'Úmbita', 1, 15, NULL)
INSERT [dbo].[Cities] ([cty_id], [cty_name], [cty_state], [dpt_id], [cty_dane_code]) VALUES (1100, N'Útica', 1, 25, NULL)
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([cli_id], [cli_document], [cli_name], [cli_phone], [cli_cellphone], [cli_adress], [cli_website], [cty_id], [cli_state], [cli_registrationDate], [cli_updateDate], [cli_deleteDate]) VALUES (1, N'123456789', N'NOKIA', NULL, N'3012554689', N'CALLE FALSA 123', N'WWW.NOKIA.COM', 107, 1, CAST(N'2021-03-15T10:20:22.177' AS DateTime), CAST(N'2021-04-15T18:50:51.877' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
INSERT [dbo].[Company] ([cpn_id], [cpn_razonSocial], [cpn_nit], [cpn_state]) VALUES (1, N'RENTING AUTOMAYOR', N'9009397984', 1)
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (1, N'william', N'forero', N'3115552211', N'3115552211', NULL, NULL, 1015, NULL, NULL, 1, 1, NULL, CAST(N'2021-04-15T18:39:04.660' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (4, N'Andres', N'Forero', NULL, N'', N'El_mail@valido.com', N'Calle falsa 123', 2015, NULL, NULL, 1, NULL, 3, CAST(N'2021-01-17T10:23:59.510' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (7, N'Andrés', N'Borrero', N'2141122', N'3147896655', N'', N'calle 30 # 70 - 45', 1012, NULL, NULL, 1, NULL, 3, CAST(N'2020-11-03T12:39:50.823' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (8, N'Felipe', N'Castañeda', N'', N'3158745566', N'', N'calle 80 # 79 -63', 1013, NULL, NULL, 1, NULL, 3, CAST(N'2020-11-03T12:45:47.243' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (9, N'Leidy', N'Fonseca', N'', N'', N'l.fonseca@autogrande.com', N'', 1014, NULL, NULL, 1, NULL, 2, CAST(N'2020-11-03T12:46:34.743' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (10, N'Paula', N'Torres', N'654454 ext 2569', N'253618756', N'p.torres@gmail.com', N'calle 45 # 34 e 56', 1015, NULL, NULL, 1, NULL, 3, CAST(N'2020-12-21T12:11:28.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (1, 1, N'CNT_FEC_1', N'NK_01', N'prueba', 1, 1, 1, 1, 1, 30, NULL, CAST(N'2021-03-03T05:00:00.000' AS DateTime), CAST(N'2022-03-03T05:00:00.000' AS DateTime), 12, CAST(N'2021-03-15T10:22:33.683' AS DateTime), CAST(N'2021-03-23T08:13:00.250' AS DateTime), NULL, 3)
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[ContractState] ON 

INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (1, N'ACTIVO', N'Es cuándo el contrato ya se encuentra firmado y en ejecución', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (2, N'EN NEGOCIACIÓN', N'Es cuándo al contrato le faltan últimar detalles como: ¿Qué placas están vinculadas? ó la negociación del descuento de las partes', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (3, N'CANCELADO', N'Es cuándo el contrato fue finalizado unilateralmente', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (4, N'FINALIZADO', N'Es cuándo el contrato finaliza su periodo de ejecución', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ContractState] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ctry_id], [ctry_name], [ctry_state]) VALUES (1, N'Colombia', 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Dealer] ON 

INSERT [dbo].[Dealer] ([deal_id], [deal_document], [deal_name], [deal_state], [deal_registrationDate], [deal_updateDate], [deal_deleteDate]) VALUES (1, N'123456789', N'Autoniza', 1, CAST(N'2020-11-03T12:28:03.523' AS DateTime), NULL, NULL)
INSERT [dbo].[Dealer] ([deal_id], [deal_document], [deal_name], [deal_state], [deal_registrationDate], [deal_updateDate], [deal_deleteDate]) VALUES (2, N'45698713', N'Autogrande', 1, CAST(N'2020-11-03T12:34:44.163' AS DateTime), NULL, NULL)
INSERT [dbo].[Dealer] ([deal_id], [deal_document], [deal_name], [deal_state], [deal_registrationDate], [deal_updateDate], [deal_deleteDate]) VALUES (3, N'123654789', N'San Jorge', 1, CAST(N'2020-11-03T12:39:14.703' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Dealer] OFF
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (5, N'ANTIOQUIA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (8, N'ATLÁNTICO', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (11, N'BOGOTÁ, D.C.', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (13, N'BOLÍVAR', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (15, N'BOYACÁ', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (17, N'CALDAS', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (18, N'CAQUETÁ', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (19, N'CAUCA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (20, N'CESAR', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (23, N'CÓRDOBA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (25, N'CUNDINAMARCA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (27, N'CHOCÓ', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (41, N'HUILA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (44, N'LA GUAJIRA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (47, N'MAGDALENA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (50, N'META', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (52, N'NARIÑO', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (54, N'NORTE DE SANTANDER', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (63, N'QUINDIO', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (66, N'RISARALDA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (68, N'SANTANDER', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (70, N'SUCRE', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (73, N'TOLIMA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (76, N'VALLE DEL CAUCA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (81, N'ARAUCA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (85, N'CASANARE', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (86, N'PUTUMAYO', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (88, N'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (91, N'AMAZONAS', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (94, N'GUAINÍA', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (95, N'GUAVIARE', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (97, N'VAUPÉS', 1, 1)
INSERT [dbo].[Departments] ([dpt_id], [dpt_name], [dpt_state], [ctry_id]) VALUES (99, N'VICHADA', 1, 1)
SET IDENTITY_INSERT [dbo].[DiscountType] ON 

INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (1, N'PORCENTAJE POR EL TOTAL DEL MANTENIMIENTO', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (2, N'VALOR FIJO POR EL TOTAL DEL MANTENIMIENTO', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (3, N'PORCENTAJE POR REPUESTOS', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (4, N'VALOR FIJO POR REPUESTOS', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[DiscountType] OFF
SET IDENTITY_INSERT [dbo].[FieldsToOperate] ON 

INSERT [dbo].[FieldsToOperate] ([fto_id], [fto_nameDb], [fto_nameToShow], [fto_state], [fto_registrationDate], [fto_updateDate], [fto_deleteDate], [fto_tableName]) VALUES (1, N'ficl_approvedQuota', N'CUPO APROBADO', 1, CAST(N'2020-12-06T19:14:42.303' AS DateTime), NULL, NULL, N'FinancialInformationByClient')
INSERT [dbo].[FieldsToOperate] ([fto_id], [fto_nameDb], [fto_nameToShow], [fto_state], [fto_registrationDate], [fto_updateDate], [fto_deleteDate], [fto_tableName]) VALUES (2, N'ficl_consumedQuota', N'CUPO CONSUMIDO', 1, CAST(N'2020-12-06T19:14:42.303' AS DateTime), NULL, NULL, N'FinancialInformationByClient')
INSERT [dbo].[FieldsToOperate] ([fto_id], [fto_nameDb], [fto_nameToShow], [fto_state], [fto_registrationDate], [fto_updateDate], [fto_deleteDate], [fto_tableName]) VALUES (3, N'ficl_currentQuota', N'CUPO DISPONIBLE', 1, CAST(N'2020-12-06T19:14:42.303' AS DateTime), NULL, NULL, N'FinancialInformationByClient')
INSERT [dbo].[FieldsToOperate] ([fto_id], [fto_nameDb], [fto_nameToShow], [fto_state], [fto_registrationDate], [fto_updateDate], [fto_deleteDate], [fto_tableName]) VALUES (4, N'ficl_inTransitQuota', N'CUPO EN TRÁNSITO', 1, CAST(N'2020-12-06T19:14:42.303' AS DateTime), NULL, NULL, N'FinancialInformationByClient')
INSERT [dbo].[FieldsToOperate] ([fto_id], [fto_nameDb], [fto_nameToShow], [fto_state], [fto_registrationDate], [fto_updateDate], [fto_deleteDate], [fto_tableName]) VALUES (5, N'trx_value', N'VALOR TRANSACCIÓN', 1, CAST(N'2020-12-06T19:22:42.843' AS DateTime), NULL, NULL, N'Transactions')
SET IDENTITY_INSERT [dbo].[FieldsToOperate] OFF
SET IDENTITY_INSERT [dbo].[frequency] ON 

INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (1, N'5,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'5')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (2, N'10,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'10')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (3, N'15,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'15')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (4, N'20,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'20')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (5, N'25,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'25')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (6, N'30,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'30')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (7, N'35,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'35')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (8, N'40,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'40')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (9, N'45,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'45')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (10, N'50,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'50')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (11, N'55,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'55')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (12, N'60,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'60')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (13, N'65,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'65')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (14, N'70,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'70')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (15, N'75,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'75')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (16, N'80,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'80')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (17, N'85,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'85')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (18, N'90,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'90')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (19, N'95,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'95')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (20, N'100,000 KM', 1, CAST(N'2020-11-14T10:50:55.603' AS DateTime), NULL, NULL, N'100')
INSERT [dbo].[frequency] ([fq_id], [fq_name], [fq_state], [fq_registrationDate], [fq_updateDate], [fq_deleteDate], [fq_shortName]) VALUES (21, N'MANTENIMIENTO CORRECTIVO', 1, CAST(N'2021-03-03T16:12:07.270' AS DateTime), NULL, NULL, N'0')
SET IDENTITY_INSERT [dbo].[frequency] OFF
SET IDENTITY_INSERT [dbo].[GroupModuleAction] ON 

INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (4, 1, 1, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (5, 1, 1, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (6, 1, 2, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (7, 1, 2, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (8, 1, 2, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (9, 1, 2, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (10, 1, 2, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (11, 1, 3, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (12, 1, 3, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (13, 1, 3, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (14, 1, 3, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (15, 1, 3, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (16, 1, 5, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (17, 1, 5, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (18, 1, 5, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (19, 1, 5, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (20, 1, 5, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (21, 1, 6, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (22, 1, 6, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (23, 1, 6, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (24, 1, 6, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (25, 1, 6, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (26, 1, 7, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (27, 1, 7, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (28, 1, 7, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (29, 1, 7, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (30, 1, 7, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (31, 1, 8, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (32, 1, 8, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (33, 1, 8, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (34, 1, 8, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (35, 1, 8, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (36, 1, 9, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (37, 1, 9, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (38, 1, 9, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (39, 1, 9, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (40, 1, 9, 5)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (41, 2, 9, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (42, 3, 1, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (43, 3, 3, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (44, 3, 5, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (45, 3, 8, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (46, 4, 1, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (47, 4, 2, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (48, 4, 3, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (49, 4, 5, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (50, 4, 7, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (51, 2, 5, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (52, 2, 8, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (1051, 4, 8, 1)
SET IDENTITY_INSERT [dbo].[GroupModuleAction] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([grp_id], [grp_name], [grp_description]) VALUES (1, N'TEC-SOP', N'grupo de soporte del area de tecnologia')
INSERT [dbo].[Groups] ([grp_id], [grp_name], [grp_description]) VALUES (2, N'USU-CLIENT', N'grupo de seguridad de usuarios para el cliente final')
INSERT [dbo].[Groups] ([grp_id], [grp_name], [grp_description]) VALUES (3, N'USU-DEALER', N'grupo de seguridad de usuarios para los concesionarios')
INSERT [dbo].[Groups] ([grp_id], [grp_name], [grp_description]) VALUES (4, N'USU-RENTING', N'grupo de seguridad de usuarios para renting automayor')
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[ItemsByRoutines] ON 

INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1, 1, 602, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (2, 5, 602, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (3, 15, 602, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (4, 20, 602, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (5, 19, 602, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (6, 26, 602, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (7, 22, 602, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (8, 38, 602, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (9, 42, 602, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (10, 1, 604, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (11, 9, 604, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (12, 5, 604, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (13, 15, 604, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (14, 20, 604, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (15, 19, 604, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (16, 22, 604, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (17, 26, 604, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (18, 39, 604, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (19, 38, 604, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (20, 42, 604, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (21, 1, 606, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (22, 5, 606, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (23, 11, 606, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (24, 15, 606, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (25, 19, 606, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (26, 20, 606, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (27, 22, 606, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (28, 26, 606, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (29, 38, 606, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (30, 41, 606, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (31, 42, 606, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (32, 1, 608, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (33, 5, 608, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (34, 15, 608, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (35, 9, 608, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (36, 19, 608, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (37, 20, 608, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (38, 22, 608, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (39, 26, 608, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (40, 38, 608, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (41, 39, 608, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (42, 42, 608, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (43, 1, 610, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (44, 5, 610, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (45, 19, 610, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (46, 15, 610, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (47, 20, 610, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (48, 22, 610, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (49, 26, 610, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (50, 38, 610, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (51, 42, 610, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (52, 1, 612, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (53, 5, 612, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (54, 11, 612, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (55, 9, 612, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (56, 19, 612, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (57, 15, 612, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (58, 20, 612, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (59, 26, 612, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (60, 22, 612, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (61, 38, 612, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (62, 39, 612, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (63, 41, 612, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (64, 42, 612, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (65, 4, 614, 0.8, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (66, 5, 614, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (67, 1, 614, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (68, 15, 614, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (69, 20, 614, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (70, 19, 614, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (71, 21, 614, 6, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (72, 22, 614, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (73, 26, 614, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (74, 38, 614, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (75, 42, 614, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (76, 1, 616, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (77, 9, 616, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (78, 5, 616, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (79, 15, 616, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (80, 20, 616, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (81, 19, 616, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (82, 22, 616, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (83, 26, 616, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (84, 38, 616, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (85, 39, 616, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (86, 42, 616, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (87, 1, 618, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (88, 8, 618, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (89, 5, 618, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (90, 15, 618, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (91, 11, 618, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (92, 19, 618, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (93, 22, 618, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (94, 20, 618, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (95, 26, 618, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (96, 40, 618, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (97, 41, 618, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (98, 38, 618, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (99, 42, 618, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (100, 1, 620, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (101, 5, 620, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (102, 9, 620, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (103, 15, 620, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (104, 19, 620, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (105, 20, 620, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (106, 26, 620, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (107, 22, 620, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (108, 38, 620, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (109, 39, 620, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (110, 42, 620, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (120, 1, 624, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (121, 5, 624, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (122, 9, 624, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (123, 19, 624, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (124, 15, 624, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (125, 20, 624, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (126, 22, 624, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (127, 26, 624, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (128, 38, 624, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (129, 39, 624, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (130, 42, 624, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (131, 1, 626, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (132, 5, 626, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (133, 11, 626, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (134, 15, 626, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (135, 19, 626, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (136, 20, 626, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (137, 26, 626, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (138, 22, 626, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (139, 38, 626, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (140, 41, 626, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (141, 42, 626, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (142, 1, 628, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (143, 5, 628, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (144, 9, 628, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (145, 19, 628, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (146, 15, 628, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (147, 20, 628, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (148, 22, 628, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (149, 26, 628, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (150, 38, 628, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (151, 39, 628, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (152, 42, 628, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (153, 1, 630, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (154, 5, 630, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (155, 15, 630, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (156, 19, 630, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (157, 20, 630, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (158, 22, 630, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (159, 38, 630, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (160, 26, 630, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (161, 42, 630, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (162, 1, 632, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (163, 5, 632, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (164, 9, 632, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (165, 15, 632, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (166, 11, 632, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (167, 20, 632, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (168, 19, 632, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (169, 22, 632, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (170, 26, 632, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (171, 38, 632, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (172, 41, 632, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (173, 39, 632, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (174, 42, 632, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (175, 4, 634, 0.8, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (176, 1, 634, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (177, 5, 634, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (178, 15, 634, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (179, 19, 634, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (180, 20, 634, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (181, 21, 634, 6, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (182, 22, 634, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (183, 26, 634, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (184, 38, 634, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (185, 42, 634, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (186, 1, 636, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (187, 5, 636, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (188, 9, 636, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (189, 15, 636, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (190, 19, 636, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (191, 22, 636, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (192, 20, 636, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (193, 26, 636, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (194, 38, 636, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (195, 39, 636, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (196, 42, 636, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (210, 1, 640, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (211, 5, 640, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (212, 9, 640, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (213, 15, 640, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (214, 19, 640, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (215, 22, 640, 5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (216, 20, 640, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (217, 26, 640, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (218, 38, 640, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (219, 39, 640, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (220, 42, 640, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (221, 5, 641, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (222, 22, 641, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (223, 30, 641, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (224, 1, 642, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (225, 5, 642, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (226, 16, 642, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (227, 18, 642, 0.25, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (228, 19, 642, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (229, 22, 642, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (230, 20, 642, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (231, 25, 642, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (232, 26, 642, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (233, 30, 642, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (234, 35, 642, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (235, 1, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (236, 10, 644, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (237, 5, 644, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (238, 11, 644, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (239, 9, 644, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (240, 13, 644, 0.9, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (241, 16, 644, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (242, 19, 644, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (243, 22, 644, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (244, 20, 644, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (245, 24, 644, 7, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (246, 26, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (247, 31, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (248, 30, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (249, 32, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (250, 35, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (251, 33, 644, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (252, 1, 646, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (253, 5, 646, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (254, 12, 646, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (255, 16, 646, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (256, 18, 646, 0.25, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (257, 20, 646, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (258, 19, 646, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (259, 22, 646, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (260, 25, 646, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (261, 26, 646, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (262, 30, 646, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (263, 35, 646, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (264, 44, 646, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (265, 1, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (266, 5, 648, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (267, 11, 648, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (268, 9, 648, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (269, 10, 648, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (270, 16, 648, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (271, 19, 648, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (272, 20, 648, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (273, 22, 648, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (274, 30, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (275, 26, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (276, 31, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (277, 32, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (278, 33, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (279, 35, 648, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (280, 1, 650, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (281, 5, 650, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (282, 16, 650, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (283, 18, 650, 0.25, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (284, 19, 650, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (285, 20, 650, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (286, 22, 650, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (287, 26, 650, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (288, 25, 650, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (289, 30, 650, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (290, 35, 650, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (291, 1, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (292, 4, 652, 0.25, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (293, 6, 652, 0.8, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (294, 8, 652, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (295, 5, 652, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (296, 9, 652, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (297, 12, 652, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (298, 10, 652, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (299, 16, 652, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (300, 11, 652, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (301, 13, 652, 0.9, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (302, 19, 652, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (303, 22, 652, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (304, 20, 652, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (305, 24, 652, 7, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (306, 26, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (307, 23, 652, 7.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (308, 28, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (309, 29, 652, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (310, 30, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (311, 27, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (312, 32, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (313, 33, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (314, 31, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (315, 34, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (316, 44, 652, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (317, 35, 652, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (318, 1, 654, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (319, 5, 654, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (320, 18, 654, 0.25, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (321, 16, 654, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (322, 19, 654, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (323, 20, 654, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (324, 22, 654, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (325, 25, 654, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (326, 26, 654, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (327, 30, 654, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (328, 35, 654, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (329, 1, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (330, 5, 656, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (331, 9, 656, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (332, 10, 656, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (333, 11, 656, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (334, 16, 656, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (335, 19, 656, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (336, 20, 656, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (337, 22, 656, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (338, 26, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (339, 30, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (340, 33, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (341, 31, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (342, 32, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (343, 35, 656, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (344, 1, 658, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (345, 5, 658, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (346, 12, 658, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (347, 16, 658, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (348, 18, 658, 0.25, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (349, 19, 658, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (350, 20, 658, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (351, 22, 658, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (352, 25, 658, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (353, 26, 658, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (354, 30, 658, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (355, 35, 658, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (356, 44, 658, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (357, 1, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (358, 5, 660, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (359, 9, 660, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (360, 10, 660, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (361, 16, 660, 0.4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (362, 11, 660, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (363, 13, 660, 0.9, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (364, 19, 660, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (365, 20, 660, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (366, 22, 660, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (367, 24, 660, 7, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (368, 26, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (369, 30, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (370, 31, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (371, 32, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (372, 35, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (373, 33, 660, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (374, 1, 662, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (375, 5, 662, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (376, 14, 662, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (377, 17, 662, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (378, 20, 662, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (379, 19, 662, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (380, 22, 662, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (381, 26, 662, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (382, 36, 662, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (383, 41, 662, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (384, 1, 664, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (385, 5, 664, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (386, 14, 664, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (387, 9, 664, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (388, 19, 664, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (389, 20, 664, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (390, 22, 664, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (391, 26, 664, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (392, 37, 664, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (393, 36, 664, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (394, 1, 666, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (395, 2, 666, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (396, 5, 666, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (397, 11, 666, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (398, 14, 666, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (399, 19, 666, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (400, 22, 666, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (401, 20, 666, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (402, 26, 666, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (403, 36, 666, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (404, 41, 666, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (405, 44, 666, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (406, 1, 668, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (407, 5, 668, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (408, 9, 668, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (409, 14, 668, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (410, 19, 668, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (411, 20, 668, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (412, 26, 668, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (413, 22, 668, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (414, 36, 668, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (415, 37, 668, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (416, 1, 670, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (417, 5, 670, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (418, 11, 670, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (419, 14, 670, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (420, 20, 670, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (421, 19, 670, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (422, 22, 670, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (423, 26, 670, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (424, 36, 670, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (425, 41, 670, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (426, 1, 672, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (427, 2, 672, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (428, 5, 672, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (429, 9, 672, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (430, 19, 672, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (431, 14, 672, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (432, 20, 672, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (433, 22, 672, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (434, 36, 672, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (435, 26, 672, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (436, 37, 672, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (437, 44, 672, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (438, 1, 674, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (439, 5, 674, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (440, 11, 674, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (441, 14, 674, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (442, 19, 674, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (443, 20, 674, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (444, 22, 674, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (445, 26, 674, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (446, 36, 674, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (447, 41, 674, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (448, 1, 676, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (449, 4, 676, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (450, 5, 676, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (451, 8, 676, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (452, 9, 676, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (453, 14, 676, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (454, 19, 676, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (455, 20, 676, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (456, 21, 676, 5.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (457, 22, 676, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (458, 26, 676, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (459, 40, 676, 3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (460, 36, 676, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (461, 37, 676, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (462, 1, 678, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (463, 2, 678, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (464, 5, 678, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (465, 11, 678, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (466, 14, 678, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (467, 19, 678, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (468, 20, 678, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (469, 22, 678, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (470, 26, 678, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (471, 36, 678, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (472, 41, 678, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (473, 44, 678, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (474, 1, 680, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (475, 5, 680, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (476, 9, 680, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (477, 14, 680, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (478, 19, 680, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (479, 20, 680, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (480, 26, 680, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (481, 22, 680, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (482, 36, 680, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (483, 37, 680, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (484, 1, 682, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (485, 5, 682, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (486, 17, 682, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (487, 19, 682, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (488, 14, 682, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (489, 20, 682, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (490, 22, 682, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (491, 36, 682, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (492, 26, 682, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (493, 41, 682, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (494, 1, 684, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (495, 9, 684, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (496, 5, 684, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (497, 14, 684, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (498, 19, 684, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (499, 20, 684, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (500, 22, 684, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (501, 26, 684, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (502, 36, 684, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (503, 37, 684, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (504, 2, 686, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (505, 1, 686, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (506, 5, 686, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (507, 11, 686, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (508, 14, 686, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (509, 19, 686, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (510, 20, 686, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (511, 22, 686, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (512, 36, 686, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (513, 26, 686, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (514, 44, 686, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (515, 41, 686, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (516, 1, 688, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (517, 9, 688, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (518, 5, 688, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (519, 14, 688, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (520, 20, 688, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (521, 19, 688, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (522, 22, 688, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (523, 26, 688, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (524, 36, 688, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (525, 37, 688, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (526, 1, 690, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (527, 5, 690, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (528, 11, 690, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (529, 14, 690, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (530, 20, 690, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (531, 19, 690, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (532, 22, 690, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (533, 26, 690, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (534, 36, 690, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (535, 41, 690, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (536, 1, 692, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (537, 2, 692, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (538, 5, 692, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (539, 14, 692, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (540, 9, 692, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (541, 19, 692, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (542, 20, 692, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (543, 26, 692, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (544, 22, 692, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (545, 37, 692, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (546, 36, 692, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (547, 44, 692, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (548, 1, 694, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (549, 5, 694, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (550, 11, 694, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (551, 19, 694, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (552, 14, 694, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (553, 20, 694, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (554, 26, 694, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (555, 22, 694, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (556, 36, 694, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (557, 41, 694, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (558, 1, 696, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (559, 5, 696, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (560, 8, 696, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (561, 9, 696, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (562, 14, 696, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (563, 20, 696, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (564, 19, 696, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (565, 22, 696, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (566, 36, 696, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (567, 26, 696, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (568, 37, 696, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (569, 40, 696, 3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (570, 1, 698, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (571, 5, 698, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (572, 2, 698, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (573, 11, 698, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (574, 14, 698, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (575, 20, 698, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (576, 19, 698, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (577, 26, 698, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (578, 22, 698, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (579, 36, 698, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (580, 41, 698, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (581, 44, 698, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (582, 1, 700, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (583, 5, 700, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (584, 9, 700, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (585, 14, 700, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (586, 19, 700, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (587, 20, 700, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (588, 22, 700, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (589, 36, 700, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (590, 26, 700, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (591, 37, 700, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (592, 1, 702, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (593, 5, 702, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (594, 14, 702, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (595, 17, 702, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (596, 19, 702, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (597, 22, 702, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (598, 20, 702, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (599, 26, 702, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (600, 36, 702, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (601, 41, 702, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (602, 1, 704, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (603, 5, 704, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (604, 9, 704, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (605, 14, 704, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (606, 19, 704, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (607, 20, 704, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (608, 22, 704, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (609, 26, 704, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (610, 36, 704, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (611, 37, 704, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (612, 1, 706, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (613, 2, 706, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (614, 5, 706, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (615, 11, 706, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (616, 14, 706, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (617, 19, 706, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (618, 20, 706, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (619, 22, 706, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (620, 26, 706, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (621, 36, 706, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (622, 41, 706, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (623, 44, 706, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (624, 1, 708, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (625, 5, 708, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (626, 9, 708, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (627, 14, 708, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (628, 19, 708, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (629, 20, 708, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (630, 26, 708, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (631, 22, 708, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (632, 36, 708, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (633, 37, 708, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (634, 1, 710, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (635, 5, 710, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (636, 11, 710, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (637, 14, 710, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (638, 19, 710, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (639, 20, 710, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (640, 22, 710, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (641, 26, 710, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (642, 36, 710, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (643, 41, 710, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (644, 1, 712, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (645, 2, 712, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (646, 5, 712, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (647, 14, 712, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (648, 9, 712, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (649, 19, 712, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (650, 20, 712, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (651, 22, 712, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (652, 26, 712, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (653, 37, 712, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (654, 36, 712, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (655, 44, 712, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (656, 1, 714, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (657, 5, 714, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (658, 11, 714, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (659, 14, 714, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (660, 20, 714, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (661, 19, 714, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (662, 22, 714, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (663, 26, 714, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (664, 36, 714, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (665, 41, 714, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (666, 1, 716, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (667, 4, 716, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (668, 5, 716, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (669, 8, 716, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (670, 9, 716, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (671, 14, 716, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (672, 19, 716, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (673, 20, 716, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (674, 21, 716, 5.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (675, 26, 716, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (676, 22, 716, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (677, 36, 716, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (678, 37, 716, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (679, 43, 716, 3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (680, 1, 718, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (681, 5, 718, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (682, 2, 718, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (683, 11, 718, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (684, 14, 718, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (685, 20, 718, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (686, 19, 718, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (687, 22, 718, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (688, 26, 718, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (689, 36, 718, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (690, 41, 718, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (691, 44, 718, 2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (692, 1, 720, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (693, 5, 720, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (694, 9, 720, 0.2, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (695, 19, 720, 0.5, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (696, 14, 720, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (697, 20, 720, 0.3, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (698, 22, 720, 4, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (699, 36, 720, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (700, 26, 720, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (701, 37, 720, 1, CAST(N'2020-11-26T21:55:28.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1732, 2, 841, 0.5, CAST(N'2021-01-22T23:40:57.717' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1743, 44, 3, 5, CAST(N'2021-01-22T23:47:40.907' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1752, 1, 1, 1, CAST(N'2021-01-27T19:44:12.087' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1753, 2, 1, 0.5, CAST(N'2021-01-27T19:44:12.097' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1754, 6, 1, 0.2, CAST(N'2021-01-27T19:44:12.097' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1755, 12, 1, 0.8, CAST(N'2021-01-27T19:44:12.100' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1756, 29, 1, 6, CAST(N'2021-01-27T19:44:12.100' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1757, 31, 1, 2, CAST(N'2021-01-27T19:44:12.103' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1758, 41, 1, 1, CAST(N'2021-01-27T19:44:12.107' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1759, 23, 1, 8, CAST(N'2021-01-27T19:44:12.110' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1760, 1, 2, 0.8, CAST(N'2021-01-27T19:44:59.933' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1761, 2, 2, 0.5, CAST(N'2021-01-27T19:44:59.940' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1762, 6, 2, 0.2, CAST(N'2021-01-27T19:44:59.943' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1763, 12, 2, 0.8, CAST(N'2021-01-27T19:44:59.947' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1764, 29, 2, 6, CAST(N'2021-01-27T19:44:59.950' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1765, 31, 2, 2, CAST(N'2021-01-27T19:44:59.950' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1766, 41, 2, 1, CAST(N'2021-01-27T19:44:59.953' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1767, 23, 2, 8, CAST(N'2021-01-27T19:44:59.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1768, 5, 2, 0.2, CAST(N'2021-01-27T19:44:59.957' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1769, 8, 2, 0.5, CAST(N'2021-01-27T19:44:59.960' AS DateTime), NULL)
GO
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1770, 22, 2, 4, CAST(N'2021-01-27T19:44:59.963' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1780, 1, 622, 1, CAST(N'2021-01-28T19:21:30.633' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1781, 5, 622, 0.4, CAST(N'2021-01-28T19:21:30.637' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1782, 15, 622, 0.3, CAST(N'2021-01-28T19:21:30.640' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1783, 19, 622, 0.5, CAST(N'2021-01-28T19:21:30.643' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1784, 20, 622, 0.4, CAST(N'2021-01-28T19:21:30.647' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1785, 26, 622, 1, CAST(N'2021-01-28T19:21:30.650' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1786, 22, 622, 5, CAST(N'2021-01-28T19:21:30.650' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1787, 38, 622, 1, CAST(N'2021-01-28T19:21:30.653' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1788, 42, 622, 1, CAST(N'2021-01-28T19:21:30.657' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1803, 1, 638, 1, CAST(N'2021-01-29T11:29:06.583' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1804, 5, 638, 0.4, CAST(N'2021-01-29T11:29:06.593' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1805, 15, 638, 0.3, CAST(N'2021-01-29T11:29:06.597' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1806, 19, 638, 0.5, CAST(N'2021-01-29T11:29:06.600' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1807, 20, 638, 0.4, CAST(N'2021-01-29T11:29:06.603' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1808, 26, 638, 1, CAST(N'2021-01-29T11:29:06.607' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1809, 22, 638, 5, CAST(N'2021-01-29T11:29:06.610' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1810, 38, 638, 1, CAST(N'2021-01-29T11:29:06.613' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1811, 42, 638, 1, CAST(N'2021-01-29T11:29:06.617' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1812, 9, 638, 0.2, CAST(N'2021-01-29T11:29:06.620' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1813, 39, 638, 1, CAST(N'2021-01-29T11:29:06.623' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1814, 8, 638, 0.5, CAST(N'2021-01-29T11:29:06.630' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1815, 11, 638, 0.2, CAST(N'2021-01-29T11:29:06.633' AS DateTime), NULL)
INSERT [dbo].[ItemsByRoutines] ([ibr_id], [mi_id], [mr_id], [mi_amount], [ibr_registrationDate], [ibr_updateDate]) VALUES (1816, 40, 638, 4, CAST(N'2021-01-29T11:29:06.637' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ItemsByRoutines] OFF
SET IDENTITY_INSERT [dbo].[JobTitlesClient] ON 

INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1, N'GERENTE', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (2, N'COORDINADOR', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (3, N'INDEPENDIENTE', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (4, N'MAESTRO DE CONSTRUCCIÓN', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (5, N'AUXILIAR DE CONSTRUCCIÓN', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (6, N'ESTUDIANTE', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (7, N'TÉCNICO', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (8, N'MAESTRO', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (9, N'MACANCAN', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (10, N'DESARROLLADOR', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (11, N'VENDEDORA', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1010, N'DESARROLLADOR DE SOFTWARE', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1011, N'ADMINISTRADOR', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1012, N'GERENTE GENERAL', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1013, N'ASESOR COMERCIAL', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1014, N'COMERCIAL', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (1015, N'ANALISTA', 1)
INSERT [dbo].[JobTitlesClient] ([jtcl_id], [jtcl_description], [jtcl_state]) VALUES (2015, N'PRUEBA', 1)
SET IDENTITY_INSERT [dbo].[JobTitlesClient] OFF
SET IDENTITY_INSERT [dbo].[MaintenanceItem] ON 

INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (1, N'MO001', N'ALINEAR Y BALANCEAR LLANTAS', N'AS', 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), CAST(N'2021-01-22T11:10:36.413' AS DateTime), NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (2, N'MO002', N'CAMBIAR  LÍQUIDO DE FRENOS', N'', 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), CAST(N'2021-01-21T20:40:12.043' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (3, N'MO003', N'CAMBIAR ACEITE DE TRANSFER', N'', 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), CAST(N'2021-01-21T20:34:03.897' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (4, N'MO004', N'CAMBIAR ACEITE DE TRANSMISIÓN AUTOMÁTICA', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (5, N'MO005', N'CAMBIAR ACEITE Y FILTRO DE MOTOR ', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (6, N'MO006', N'CAMBIAR BANDA DE ACCESORIOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (7, N'MO007', N'CAMBIAR BANDA DE DISTRIBUCIÓN, TENSOR Y BANDA DE BOMBA DE ACEITE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (8, N'MO008', N'CAMBIAR BUJÍAS DE ENCENDIDO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (9, N'MO009', N'CAMBIAR FILTRO DE AIRE', N'', 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), CAST(N'2021-01-21T12:52:41.927' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (10, N'MO010', N'CAMBIAR FILTRO DE COMBUSTIBLE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (11, N'MO011', N'CAMBIAR FILTRO DE VENTILACIÓN', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (12, N'MO012', N'CAMBIAR LÍQUIDO DE FRENOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (13, N'MO013', N'CAMBIAR REFRIGERANTE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (14, N'MO014', N'INSPECCIONAR: AMORTIGUADORES, MANGUERAS DE REFRIGERANTE, CAÑERÍAS DE LÍQUIDO DE FRENO, FUGAS DE ACEITE DE TRANSMISIÓN Y DE MOTOR, REVISAR NIVEL DE ACEITE DE TRANSMISIÓN', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (15, N'MO015', N'INSPECCIONAR: CARGA DE BATERÍA, AMORTIGUADORES, MANGUERAS DE REFRIGERANTE, CAÑERÍAS DE LÍQUIDO DE FRENO, FUGAS DE ACEITE DE TRANSMISIÓN Y DE MOTOR', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (16, N'MO016', N'INSPECCIONAR: CARGA DE BATERÍA, AMORTIGUADORES, MANGUERAS DE REFRIGERANTE, CAÑERÍAS DE LÍQUIDO DE FRENO, FUGAS DE ACEITE DE TRANSMISIÓN Y DE MOTOR, CERRADURAS Y BISAGRAS, BANDA DE ACCESORIOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (17, N'MO017', N'INSTALAR FILTRO DE VENTILACIÓN', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (18, N'MO018', N'LIMPIAR CUERPO ACELERACIÓN IAC / PCV (usar limpiador)', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (19, N'MO019', N'LIMPIAR,  REVISAR Y REGULAR FRENOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (20, N'MO020', N'ROTAR Y REVISAR LLANTAS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (21, N'52135404', N'ACEITE ACDELCO ATF DEXRON VI', NULL, 1, 2, 19250, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (22, N'95633177', N'ACEITE ACDELCO SAE 5W30 DEXOS I GEN 2', N'ACEITE ACDELCO SAE 5W30 DEXOS I GEN 2', 1, 2, 19213.29, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), CAST(N'2021-01-18T11:47:39.610' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (23, N'19391608', N'ACEITE SHELL 85W140', N'ASDF', 1, 2, 69937, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), CAST(N'2021-01-18T11:45:26.567' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (24, N'88863336', N'REFRIGERANTE DEXCOOL ACDELCO', NULL, 1, 2, 9500.25, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (25, N'93429134', N'LIMPIADOR CUERPO DE ACELERACIÓN AC DELCO', NULL, 1, 1, 19000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (26, N'88863938', N'LIMPIADOR PARTES DE FRENO AC DELCO', NULL, 1, 1, 16000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (27, N'23866811', N'BANDA DE ALTERNADOR', NULL, 1, 1, 19000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (28, N'23866812', N'BANDA DE COMPRESOR', NULL, 1, 1, 20000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (29, N'23753101', N'BUJÍAS DE ENCENDIDO', NULL, 1, 1, 18000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (30, N'24563823', N'FILTRO DE ACEITE DE MOTOR', NULL, 1, 1, 17000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (31, N'23909020', N'FILTRO DE AIRE', NULL, 1, 1, 49001, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (32, N'23962008', N'FILTRO DE COMBUSTIBLE', NULL, 1, 1, 23000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (33, N'23939588', N'FILTRO DE VENTILACIÓN', NULL, 1, 1, 53000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (34, N'23866022', N'TEMPLADOR DE BANDA DE ACCESORIOS', NULL, 1, 1, 98001, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (35, N'24552829', N'ANILLO TAPÓN DE CARTER', NULL, 1, 1, 6000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (36, N'55509268', N'FILTRO DE ACEITE DE MOTOR', NULL, 1, 1, 15000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (37, N'26241944', N'FILTRO DE AIRE', NULL, 1, 1, 29000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (38, N'12696048', N'FILTRO DE ACEITE DE MOTOR', NULL, 1, 1, 25000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (39, N'84390002', N'FILTRO DE AIRE', NULL, 1, 1, 84000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (40, N'12683541', N'BUJÍAS DE ENCENDIDO', NULL, 1, 1, 40000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (41, N'13508023', N'FILTRO DE VENTILACIÓN', NULL, 1, 1, 48999, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (42, N'12616850', N'ANILLO TAPÓN DE CARTER', NULL, 1, 1, 13500, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (43, N'55509240', N'BUJÍAS DE ENCENDIDO', NULL, 1, 1, 48000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (44, N'19315431', N'LÍQUIDO DE FRENOS ACDELCO DOT 4', NULL, 1, 2, 7222, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (45, N'MO021', N'CAMBIAR ACEITE TRANSFERENCIA', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (46, N'MO022', N'CAMBIAR ACEITE TRANSMISIÓN MANUAL', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (47, N'MO023', N'CAMBIAR BANDA  AIRE ACONDICIONADO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (48, N'MO024', N'CAMBIAR BANDA ALTERNADOR, BOMBA AGUA', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (49, N'MO025', N'CAMBIAR BANDA ALTERNADOR Y AIRE ACONDICIONADO', N'', 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), CAST(N'2021-01-21T22:19:31.910' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (50, N'MO026', N'CAMBIAR BANDA DIRECCIÓN HIDRÁULICA', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (51, N'MO027', N'CAMBIO ACEITE DIFERENCIAL', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (52, N'MO028', N'CAMBIO ACEITE DIFERENCIAL TRASERO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (53, N'MO029', N'CAMBIO ACEITE DIRECCIÓN HIDRÁULICA', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (54, N'MO030', N'CAMBIO DE PLUMILLAS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (55, N'MO031', N'ENGRASE CHAPAS, CORREDERAS, CANTONERA Y RECIBIDORES DE ASIENTOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (56, N'MO032', N'INSPECCION ACEITE DIFERENCIAL DELANTERO ', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (57, N'MO033', N'INSPECCIÓN LINEAS COMBUSTIBLE, EVAP, ESCANEO Y PCV', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (58, N'MO034', N'INSPECCIÓN PLUMILLAS, NIVEL Y BARRIDO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (59, N'MO035', N'INSPECCIÓN SISTEMA ELÉCTRICO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (60, N'MO036', N'LIMPIAR,  REVISAR Y REGULAR FRENOS DELANTEROS.', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (61, N'MO037', N'LIMPIAR,  REVISAR Y REGULAR FRENOS TRASEROS.', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (62, N'MO038', N'PRESIÓN DE LLANTAS Y SU ESTADO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (63, N'MO039', N'REAJUSTAR SUSPENSIÓN ', NULL, 2, 6, 71400, 1, CAST(N'2020-11-27T18:20:04.957' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (64, N'DMAX_001', N'CARTER DMAX', N'CARTER DMAX', 1, 1, 1000000, 1, CAST(N'2021-01-21T10:56:06.193' AS DateTime), CAST(N'2021-01-21T20:34:59.067' AS DateTime), NULL, 1, 1, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (65, N'PRBA_01', N'ARTICULO DE RENTING', N'PRUEBA', 1, 1, 150000, 1, CAST(N'2021-01-21T12:16:50.937' AS DateTime), CAST(N'2021-01-21T22:20:17.613' AS DateTime), NULL, 1, 0, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (66, N'TAHOE_001', N'CARTER TAHOE', N'', 1, 1, 5000, 1, CAST(N'2021-01-21T14:37:45.687' AS DateTime), NULL, NULL, 2, 1, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (67, N'DMAX_0205', N'PRUEBA', N'', 1, 1, 89000, 1, CAST(N'2021-01-21T19:48:08.810' AS DateTime), NULL, NULL, 1, 1, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (68, N'BEAT_001', N'EXOSTO DE LUJO', N'', 1, 1, 50000, 1, CAST(N'2021-01-21T20:38:38.503' AS DateTime), NULL, NULL, 1, 1, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (69, N'ABC', N'ACEITE 20 W 50', N'ACEITE PARA MOTOR', 1, 2, 78000, 1, CAST(N'2021-01-21T21:54:23.687' AS DateTime), CAST(N'2021-01-23T21:01:14.373' AS DateTime), NULL, 1, 1, NULL)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (70, N'ASD', N'ASD', N'ASD', 1, 1, 788888, 1, CAST(N'2021-01-21T21:56:24.017' AS DateTime), NULL, NULL, 2, 1, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (71, N'ASDFG', N'ASDFG', N'ASDFG', 1, 2, 80000, 1, CAST(N'2021-01-21T22:07:03.713' AS DateTime), CAST(N'2021-01-21T22:07:24.167' AS DateTime), NULL, 1, 1, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (72, N'ASDF', N'ADSFASDF', N'ASDFASDF', 1, 1, 2434234, 1, CAST(N'2021-01-21T22:25:39.130' AS DateTime), NULL, NULL, 1, 0, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (73, N'010407020508', N'COSITO DE LA DERECHA', N'COSITO DE LA DERECHA', 1, 1, 75000, 1, CAST(N'2021-01-24T11:37:43.083' AS DateTime), NULL, NULL, 1, 1, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id], [mi_handleTax], [deal_id]) VALUES (74, N'CRUZE_001', N'RADIADOR CRUZE', N'', 1, 1, 150000, 1, CAST(N'2021-01-25T11:25:31.813' AS DateTime), NULL, NULL, 2, 1, 2)
SET IDENTITY_INSERT [dbo].[MaintenanceItem] OFF
SET IDENTITY_INSERT [dbo].[MaintenanceItemCategory] ON 

INSERT [dbo].[MaintenanceItemCategory] ([mict_id], [mict_name], [mict_state], [mict_registrationDate], [mict_updateDate], [mict_deleteDate]) VALUES (1, N'MANDATORIO', 1, CAST(N'2020-11-13T15:16:36.667' AS DateTime), NULL, NULL)
INSERT [dbo].[MaintenanceItemCategory] ([mict_id], [mict_name], [mict_state], [mict_registrationDate], [mict_updateDate], [mict_deleteDate]) VALUES (2, N'CONSULTIVO', 1, CAST(N'2020-11-13T15:16:36.667' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MaintenanceItemCategory] OFF
SET IDENTITY_INSERT [dbo].[MaintenanceItemsByVehicleModels] ON 

INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1, 21, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (3, 26, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (4, 38, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (5, 39, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (6, 40, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (7, 41, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (8, 42, 31, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (9, 21, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (11, 26, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (12, 38, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (13, 39, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (14, 40, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (15, 41, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (16, 42, 32, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (19, 24, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (20, 25, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (21, 26, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (22, 27, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (23, 28, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (24, 29, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (25, 30, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (26, 31, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (27, 32, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (28, 33, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (29, 34, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (30, 35, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (31, 44, 33, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (32, 21, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (34, 26, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (35, 36, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (36, 37, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (37, 40, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (38, 41, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (39, 44, 34, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (41, 26, 35, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (42, 36, 35, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (43, 37, 35, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (44, 40, 35, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (45, 41, 35, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (46, 44, 35, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (47, 21, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (49, 26, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (50, 36, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (51, 37, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (52, 41, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (53, 43, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (54, 44, 36, CAST(N'2020-11-27T08:46:10.963' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1001, 23, 33, CAST(N'2021-01-18T11:45:27.017' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1002, 22, 31, CAST(N'2021-01-18T11:47:39.640' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1003, 22, 32, CAST(N'2021-01-18T11:47:39.640' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1004, 22, 33, CAST(N'2021-01-18T11:47:39.640' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1005, 22, 34, CAST(N'2021-01-18T11:47:39.647' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1006, 22, 35, CAST(N'2021-01-18T11:47:39.647' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1007, 22, 36, CAST(N'2021-01-18T11:47:39.647' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1080, 66, 14, CAST(N'2021-01-21T14:37:45.780' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1081, 67, 1, CAST(N'2021-01-21T19:48:09.357' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1082, 67, 2, CAST(N'2021-01-21T19:48:09.367' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1087, 64, 1, CAST(N'2021-01-21T20:34:59.080' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1088, 64, 2, CAST(N'2021-01-21T20:34:59.080' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1089, 68, 19, CAST(N'2021-01-21T20:38:38.523' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1094, 70, 3, CAST(N'2021-01-21T21:56:24.050' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1095, 70, 7, CAST(N'2021-01-21T21:56:24.057' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1096, 70, 8, CAST(N'2021-01-21T21:56:24.060' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1097, 70, 19, CAST(N'2021-01-21T21:56:24.063' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1098, 70, 23, CAST(N'2021-01-21T21:56:24.067' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1099, 70, 26, CAST(N'2021-01-21T21:56:24.070' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1100, 70, 27, CAST(N'2021-01-21T21:56:24.073' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1105, 71, 1, CAST(N'2021-01-21T22:07:24.193' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1106, 71, 2, CAST(N'2021-01-21T22:07:24.207' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1107, 71, 4, CAST(N'2021-01-21T22:07:24.213' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1108, 71, 5, CAST(N'2021-01-21T22:07:24.220' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1117, 69, 3, CAST(N'2021-01-23T21:01:14.483' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1118, 69, 26, CAST(N'2021-01-23T21:01:14.490' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1119, 69, 27, CAST(N'2021-01-23T21:01:14.490' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1120, 69, 19, CAST(N'2021-01-23T21:01:14.493' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1121, 73, 32, CAST(N'2021-01-24T11:37:43.187' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1122, 73, 31, CAST(N'2021-01-24T11:37:43.197' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleModels] ([mivm_id], [mi_id], [vm_id], [mivm_registrationDate]) VALUES (1123, 74, 3, CAST(N'2021-01-25T11:25:32.023' AS DateTime))
SET IDENTITY_INSERT [dbo].[MaintenanceItemsByVehicleModels] OFF
SET IDENTITY_INSERT [dbo].[MaintenanceItemsByVehicleTypes] ON 

INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (4, 4, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (5, 5, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (6, 6, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (7, 7, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (8, 8, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (10, 10, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (11, 11, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (12, 12, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (13, 13, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (14, 14, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (15, 15, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (16, 16, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (17, 17, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (18, 18, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (19, 19, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (20, 20, 1, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (24, 4, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (25, 5, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (26, 6, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (27, 7, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (28, 8, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (30, 10, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (31, 11, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (32, 12, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (33, 13, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (34, 14, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (35, 15, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (36, 16, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (37, 17, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (38, 18, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (39, 19, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (40, 20, 2, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (44, 4, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (45, 5, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (46, 6, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (47, 7, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (48, 8, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (50, 10, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (51, 11, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (52, 12, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (53, 13, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (54, 14, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (55, 15, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (56, 16, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (57, 17, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (58, 18, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (59, 19, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (60, 20, 3, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (64, 4, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (65, 5, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (66, 6, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (67, 7, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (68, 8, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (70, 10, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (71, 11, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (72, 12, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (73, 13, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (74, 14, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (75, 15, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (76, 16, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (77, 17, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (78, 18, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (79, 19, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (80, 20, 4, CAST(N'2020-11-26T22:07:37.730' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (81, 21, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (82, 21, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (86, 24, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (87, 25, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (88, 26, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (89, 26, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (90, 27, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (91, 28, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (92, 29, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (93, 30, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (94, 31, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (95, 32, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (96, 33, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (97, 34, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (98, 35, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (99, 36, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (100, 37, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (101, 38, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (102, 39, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (103, 40, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (104, 40, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (105, 41, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (106, 41, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (107, 42, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (108, 43, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (109, 44, 1, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (110, 44, 2, CAST(N'2020-12-03T07:44:14.597' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1081, 23, 2, CAST(N'2021-01-18T11:45:26.960' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1082, 22, 1, CAST(N'2021-01-18T11:47:39.630' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1083, 22, 2, CAST(N'2021-01-18T11:47:39.637' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1136, 9, 1, CAST(N'2021-01-21T12:52:41.937' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1137, 9, 2, CAST(N'2021-01-21T12:52:41.940' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1138, 9, 3, CAST(N'2021-01-21T12:52:41.943' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1139, 9, 4, CAST(N'2021-01-21T12:52:41.943' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1148, 66, 2, CAST(N'2021-01-21T14:37:45.770' AS DateTime))
GO
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1165, 67, 2, CAST(N'2021-01-21T19:48:09.347' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1182, 3, 1, CAST(N'2021-01-21T20:34:03.910' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1183, 3, 2, CAST(N'2021-01-21T20:34:03.913' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1184, 3, 3, CAST(N'2021-01-21T20:34:03.913' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1185, 3, 4, CAST(N'2021-01-21T20:34:03.917' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1188, 64, 2, CAST(N'2021-01-21T20:34:59.077' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1189, 68, 1, CAST(N'2021-01-21T20:38:38.517' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1190, 2, 1, CAST(N'2021-01-21T20:40:12.060' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1191, 2, 2, CAST(N'2021-01-21T20:40:12.063' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1192, 2, 3, CAST(N'2021-01-21T20:40:12.063' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1193, 2, 4, CAST(N'2021-01-21T20:40:12.067' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1203, 70, 1, CAST(N'2021-01-21T21:56:24.040' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1205, 71, 2, CAST(N'2021-01-21T22:07:24.183' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1215, 65, 3, CAST(N'2021-01-21T22:20:17.643' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1216, 72, 2, CAST(N'2021-01-21T22:25:39.153' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1222, 1, 1, CAST(N'2021-01-22T11:10:36.430' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1223, 1, 2, CAST(N'2021-01-22T11:10:36.433' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1224, 1, 3, CAST(N'2021-01-22T11:10:36.437' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1225, 1, 4, CAST(N'2021-01-22T11:10:36.440' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1226, 69, 1, CAST(N'2021-01-23T21:01:14.477' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1227, 73, 2, CAST(N'2021-01-24T11:37:43.177' AS DateTime))
INSERT [dbo].[MaintenanceItemsByVehicleTypes] ([mivt_id], [mi_id], [vt_id], [mivt_registrationDate]) VALUES (1228, 74, 1, CAST(N'2021-01-25T11:25:32.013' AS DateTime))
SET IDENTITY_INSERT [dbo].[MaintenanceItemsByVehicleTypes] OFF
SET IDENTITY_INSERT [dbo].[maintenanceRoutine] ON 

INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (1, N'MP DMAX RT 95 4X2 5 K', NULL, 1, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), CAST(N'2021-01-27T19:44:12.013' AS DateTime), NULL, 1181666.38)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (2, N'MP DMAX RT 95 4X2 10 K', NULL, 1, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), CAST(N'2021-01-27T19:44:59.917' AS DateTime), NULL, 261387.266)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (3, N'MP DMAX RT 95 4X2 15 K', NULL, 1, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), CAST(N'2021-01-22T23:47:40.900' AS DateTime), NULL, 42970.9)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (4, N'MP DMAX RT 95 4X2 20 K', NULL, 1, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (5, N'MP DMAX RT 95 4X2 25 K', NULL, 1, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (6, N'MP DMAX RT 95 4X2 30 K', NULL, 1, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (7, N'MP DMAX RT 95 4X2 35 K', NULL, 1, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (8, N'MP DMAX RT 95 4X2 40 K', NULL, 1, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (9, N'MP DMAX RT 95 4X2 45 K', NULL, 1, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (10, N'MP DMAX RT 95 4X2 50 K', NULL, 1, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (11, N'MP DMAX RT 95 4X2 55 K', NULL, 1, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (12, N'MP DMAX RT 95 4X2 60 K', NULL, 1, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (13, N'MP DMAX RT 95 4X2 65 K', NULL, 1, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (14, N'MP DMAX RT 95 4X2 70 K', NULL, 1, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (15, N'MP DMAX RT 95 4X2 75 K', NULL, 1, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (16, N'MP DMAX RT 95 4X2 80 K', NULL, 1, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (17, N'MP DMAX RT 95 4X2 85 K', NULL, 1, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (18, N'MP DMAX RT 95 4X2 90 K', NULL, 1, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (19, N'MP DMAX RT 95 4X2 95 K', NULL, 1, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (20, N'MP DMAX RT 95 4X2 100 K', NULL, 1, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (21, N'MP DMAX RT 95 4X4 5 K', NULL, 2, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (22, N'MP DMAX RT 95 4X4 10 K', NULL, 2, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (23, N'MP DMAX RT 95 4X4 15 K', NULL, 2, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (24, N'MP DMAX RT 95 4X4 20 K', NULL, 2, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (25, N'MP DMAX RT 95 4X4 25 K', NULL, 2, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (26, N'MP DMAX RT 95 4X4 30 K', NULL, 2, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (27, N'MP DMAX RT 95 4X4 35 K', NULL, 2, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (28, N'MP DMAX RT 95 4X4 40 K', NULL, 2, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (29, N'MP DMAX RT 95 4X4 45 K', NULL, 2, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (30, N'MP DMAX RT 95 4X4 50 K', NULL, 2, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (31, N'MP DMAX RT 95 4X4 55 K', NULL, 2, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (32, N'MP DMAX RT 95 4X4 60 K', NULL, 2, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (33, N'MP DMAX RT 95 4X4 65 K', NULL, 2, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (34, N'MP DMAX RT 95 4X4 70 K', NULL, 2, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (35, N'MP DMAX RT 95 4X4 75 K', NULL, 2, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (36, N'MP DMAX RT 95 4X4 80 K', NULL, 2, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (37, N'MP DMAX RT 95 4X4 85 K', NULL, 2, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (38, N'MP DMAX RT 95 4X4 90 K', NULL, 2, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (39, N'MP DMAX RT 95 4X4 95 K', NULL, 2, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (40, N'MP DMAX RT 95 4X4 100 K', NULL, 2, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (41, N'MP CRUZE 1.4 TURBO 5 K', NULL, 3, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (42, N'MP CRUZE 1.4 TURBO 10 K', NULL, 3, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (43, N'MP CRUZE 1.4 TURBO 15 K', NULL, 3, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (44, N'MP CRUZE 1.4 TURBO 20 K', NULL, 3, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (45, N'MP CRUZE 1.4 TURBO 25 K', NULL, 3, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (46, N'MP CRUZE 1.4 TURBO 30 K', NULL, 3, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (47, N'MP CRUZE 1.4 TURBO 35 K', NULL, 3, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (48, N'MP CRUZE 1.4 TURBO 40 K', NULL, 3, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (49, N'MP CRUZE 1.4 TURBO 45 K', NULL, 3, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (50, N'MP CRUZE 1.4 TURBO 50 K', NULL, 3, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (51, N'MP CRUZE 1.4 TURBO 55 K', NULL, 3, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (52, N'MP CRUZE 1.4 TURBO 60 K', NULL, 3, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (53, N'MP CRUZE 1.4 TURBO 65 K', NULL, 3, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (54, N'MP CRUZE 1.4 TURBO 70 K', NULL, 3, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (55, N'MP CRUZE 1.4 TURBO 75 K', NULL, 3, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (56, N'MP CRUZE 1.4 TURBO 80 K', NULL, 3, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (57, N'MP CRUZE 1.4 TURBO 85 K', NULL, 3, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (58, N'MP CRUZE 1.4 TURBO 90 K', NULL, 3, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (59, N'MP CRUZE 1.4 TURBO 95 K', NULL, 3, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (60, N'MP CRUZE 1.4 TURBO 100 K', NULL, 3, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (61, N'MP TRACKER TM 5 K', NULL, 4, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (62, N'MP TRACKER TM 10 K', NULL, 4, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (63, N'MP TRACKER TM 15 K', NULL, 4, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (64, N'MP TRACKER TM 20 K', NULL, 4, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (65, N'MP TRACKER TM 25 K', NULL, 4, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (66, N'MP TRACKER TM 30 K', NULL, 4, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (67, N'MP TRACKER TM 35 K', NULL, 4, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (68, N'MP TRACKER TM 40 K', NULL, 4, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (69, N'MP TRACKER TM 45 K', NULL, 4, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (70, N'MP TRACKER TM 50 K', NULL, 4, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (71, N'MP TRACKER TM 55 K', NULL, 4, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (72, N'MP TRACKER TM 60 K', NULL, 4, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (73, N'MP TRACKER TM 65 K', NULL, 4, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (74, N'MP TRACKER TM 70 K', NULL, 4, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (75, N'MP TRACKER TM 75 K', NULL, 4, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (76, N'MP TRACKER TM 80 K', NULL, 4, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (77, N'MP TRACKER TM 85 K', NULL, 4, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (78, N'MP TRACKER TM 90 K', NULL, 4, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (79, N'MP TRACKER TM 95 K', NULL, 4, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (80, N'MP TRACKER TM 100 K', NULL, 4, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (81, N'MP TRACKER TA 5 K', NULL, 5, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (82, N'MP TRACKER TA 10 K', NULL, 5, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (83, N'MP TRACKER TA 15 K', NULL, 5, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (84, N'MP TRACKER TA 20 K', NULL, 5, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (85, N'MP TRACKER TA 25 K', NULL, 5, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (86, N'MP TRACKER TA 30 K', NULL, 5, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (87, N'MP TRACKER TA 35 K', NULL, 5, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (88, N'MP TRACKER TA 40 K', NULL, 5, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (89, N'MP TRACKER TA 45 K', NULL, 5, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (90, N'MP TRACKER TA 50 K', NULL, 5, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (91, N'MP TRACKER TA 55 K', NULL, 5, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (92, N'MP TRACKER TA 60 K', NULL, 5, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (93, N'MP TRACKER TA 65 K', NULL, 5, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (94, N'MP TRACKER TA 70 K', NULL, 5, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (95, N'MP TRACKER TA 75 K', NULL, 5, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (96, N'MP TRACKER TA 80 K', NULL, 5, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (97, N'MP TRACKER TA 85 K', NULL, 5, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (98, N'MP TRACKER TA 90 K', NULL, 5, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (99, N'MP TRACKER TA 95 K', NULL, 5, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (100, N'MP TRACKER TA 100 K', NULL, 5, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (101, N'MP TRACKER AWD 5 K', NULL, 6, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (102, N'MP TRACKER AWD 10 K', NULL, 6, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (103, N'MP TRACKER AWD 15 K', NULL, 6, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (104, N'MP TRACKER AWD 20 K', NULL, 6, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (105, N'MP TRACKER AWD 25 K', NULL, 6, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (106, N'MP TRACKER AWD 30 K', NULL, 6, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (107, N'MP TRACKER AWD 35 K', NULL, 6, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (108, N'MP TRACKER AWD 40 K', NULL, 6, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (109, N'MP TRACKER AWD 45 K', NULL, 6, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (110, N'MP TRACKER AWD 50 K', NULL, 6, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (111, N'MP TRACKER AWD 55 K', NULL, 6, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (112, N'MP TRACKER AWD 60 K', NULL, 6, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (113, N'MP TRACKER AWD 65 K', NULL, 6, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (114, N'MP TRACKER AWD 70 K', NULL, 6, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (115, N'MP TRACKER AWD 75 K', NULL, 6, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (116, N'MP TRACKER AWD 80 K', NULL, 6, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (117, N'MP TRACKER AWD 85 K', NULL, 6, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (118, N'MP TRACKER AWD 90 K', NULL, 6, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (119, N'MP TRACKER AWD 95 K', NULL, 6, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (120, N'MP TRACKER AWD 100 K', NULL, 6, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (121, N'MP ONIX TM MCM 5 K', NULL, 7, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (122, N'MP ONIX TM MCM 10 K', NULL, 7, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (123, N'MP ONIX TM MCM 15 K', NULL, 7, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (124, N'MP ONIX TM MCM 20 K', NULL, 7, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (125, N'MP ONIX TM MCM 25 K', NULL, 7, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (126, N'MP ONIX TM MCM 30 K', NULL, 7, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (127, N'MP ONIX TM MCM 35 K', NULL, 7, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (128, N'MP ONIX TM MCM 40 K', NULL, 7, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (129, N'MP ONIX TM MCM 45 K', NULL, 7, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (130, N'MP ONIX TM MCM 50 K', NULL, 7, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (131, N'MP ONIX TM MCM 55 K', NULL, 7, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (132, N'MP ONIX TM MCM 60 K', NULL, 7, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (133, N'MP ONIX TM MCM 65 K', NULL, 7, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (134, N'MP ONIX TM MCM 70 K', NULL, 7, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (135, N'MP ONIX TM MCM 75 K', NULL, 7, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (136, N'MP ONIX TM MCM 80 K', NULL, 7, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (137, N'MP ONIX TM MCM 85 K', NULL, 7, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (138, N'MP ONIX TM MCM 90 K', NULL, 7, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (139, N'MP ONIX TM MCM 95 K', NULL, 7, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (140, N'MP ONIX TM MCM 100 K', NULL, 7, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (141, N'MP ONIX TA MCM 5 K', NULL, 8, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (142, N'MP ONIX TA MCM 10 K', NULL, 8, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (143, N'MP ONIX TA MCM 15 K', NULL, 8, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (144, N'MP ONIX TA MCM 20 K', NULL, 8, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (145, N'MP ONIX TA MCM 25 K', NULL, 8, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (146, N'MP ONIX TA MCM 30 K', NULL, 8, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (147, N'MP ONIX TA MCM 35 K', NULL, 8, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (148, N'MP ONIX TA MCM 40 K', NULL, 8, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (149, N'MP ONIX TA MCM 45 K', NULL, 8, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (150, N'MP ONIX TA MCM 50 K', NULL, 8, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (151, N'MP ONIX TA MCM 55 K', NULL, 8, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (152, N'MP ONIX TA MCM 60 K', NULL, 8, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (153, N'MP ONIX TA MCM 65 K', NULL, 8, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (154, N'MP ONIX TA MCM 70 K', NULL, 8, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (155, N'MP ONIX TA MCM 75 K', NULL, 8, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (156, N'MP ONIX TA MCM 80 K', NULL, 8, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (157, N'MP ONIX TA MCM 85 K', NULL, 8, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (158, N'MP ONIX TA MCM 90 K', NULL, 8, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (159, N'MP ONIX TA MCM 95 K', NULL, 8, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (160, N'MP ONIX TA MCM 100 K', NULL, 8, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (161, N'MP COLORADO TA 5 K', NULL, 9, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (162, N'MP COLORADO TA 10 K', NULL, 9, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (163, N'MP COLORADO TA 15 K', NULL, 9, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (164, N'MP COLORADO TA 20 K', NULL, 9, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (165, N'MP COLORADO TA 25 K', NULL, 9, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (166, N'MP COLORADO TA 30 K', NULL, 9, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (167, N'MP COLORADO TA 35 K', NULL, 9, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (168, N'MP COLORADO TA 40 K', NULL, 9, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (169, N'MP COLORADO TA 45 K', NULL, 9, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (170, N'MP COLORADO TA 50 K', NULL, 9, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (171, N'MP COLORADO TA 55 K', NULL, 9, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (172, N'MP COLORADO TA 60 K', NULL, 9, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (173, N'MP COLORADO TA 65 K', NULL, 9, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (174, N'MP COLORADO TA 70 K', NULL, 9, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (175, N'MP COLORADO TA 75 K', NULL, 9, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (176, N'MP COLORADO TA 80 K', NULL, 9, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (177, N'MP COLORADO TA 85 K', NULL, 9, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (178, N'MP COLORADO TA 90 K', NULL, 9, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (179, N'MP COLORADO TA 95 K', NULL, 9, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (180, N'MP COLORADO TA 100 K', NULL, 9, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (181, N'MP COLORADO TM 5 K', NULL, 10, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (182, N'MP COLORADO TM 10 K', NULL, 10, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (183, N'MP COLORADO TM 15 K', NULL, 10, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (184, N'MP COLORADO TM 20 K', NULL, 10, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (185, N'MP COLORADO TM 25 K', NULL, 10, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (186, N'MP COLORADO TM 30 K', NULL, 10, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (187, N'MP COLORADO TM 35 K', NULL, 10, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (188, N'MP COLORADO TM 40 K', NULL, 10, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (189, N'MP COLORADO TM 45 K', NULL, 10, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (190, N'MP COLORADO TM 50 K', NULL, 10, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (191, N'MP COLORADO TM 55 K', NULL, 10, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (192, N'MP COLORADO TM 60 K', NULL, 10, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (193, N'MP COLORADO TM 65 K', NULL, 10, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (194, N'MP COLORADO TM 70 K', NULL, 10, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (195, N'MP COLORADO TM 75 K', NULL, 10, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (196, N'MP COLORADO TM 80 K', NULL, 10, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (197, N'MP COLORADO TM 85 K', NULL, 10, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (198, N'MP COLORADO TM 90 K', NULL, 10, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (199, N'MP COLORADO TM 95 K', NULL, 10, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (200, N'MP COLORADO TM 100 K', NULL, 10, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (201, N'MP TRAIL BLAZER MCM 5 K', NULL, 11, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (202, N'MP TRAIL BLAZER MCM 10 K', NULL, 11, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (203, N'MP TRAIL BLAZER MCM 15 K', NULL, 11, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (204, N'MP TRAIL BLAZER MCM 20 K', NULL, 11, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (205, N'MP TRAIL BLAZER MCM 25 K', NULL, 11, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (206, N'MP TRAIL BLAZER MCM 30 K', NULL, 11, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (207, N'MP TRAIL BLAZER MCM 35 K', NULL, 11, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (208, N'MP TRAIL BLAZER MCM 40 K', NULL, 11, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (209, N'MP TRAIL BLAZER MCM 45 K', NULL, 11, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (210, N'MP TRAIL BLAZER MCM 50 K', NULL, 11, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (211, N'MP TRAIL BLAZER MCM 55 K', NULL, 11, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (212, N'MP TRAIL BLAZER MCM 60 K', NULL, 11, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (213, N'MP TRAIL BLAZER MCM 65 K', NULL, 11, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (214, N'MP TRAIL BLAZER MCM 70 K', NULL, 11, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (215, N'MP TRAIL BLAZER MCM 75 K', NULL, 11, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (216, N'MP TRAIL BLAZER MCM 80 K', NULL, 11, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (217, N'MP TRAIL BLAZER MCM 85 K', NULL, 11, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (218, N'MP TRAIL BLAZER MCM 90 K', NULL, 11, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (219, N'MP TRAIL BLAZER MCM 95 K', NULL, 11, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (220, N'MP TRAIL BLAZER MCM 100 K', NULL, 11, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (221, N'MP TRAIL BLAZER GAS 5 K', NULL, 12, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (222, N'MP TRAIL BLAZER GAS 10 K', NULL, 12, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (223, N'MP TRAIL BLAZER GAS 15 K', NULL, 12, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (224, N'MP TRAIL BLAZER GAS 20 K', NULL, 12, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (225, N'MP TRAIL BLAZER GAS 25 K', NULL, 12, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (226, N'MP TRAIL BLAZER GAS 30 K', NULL, 12, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (227, N'MP TRAIL BLAZER GAS 35 K', NULL, 12, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (228, N'MP TRAIL BLAZER GAS 40 K', NULL, 12, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (229, N'MP TRAIL BLAZER GAS 45 K', NULL, 12, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (230, N'MP TRAIL BLAZER GAS 50 K', NULL, 12, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (231, N'MP TRAIL BLAZER GAS 55 K', NULL, 12, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (232, N'MP TRAIL BLAZER GAS 60 K', NULL, 12, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (233, N'MP TRAIL BLAZER GAS 65 K', NULL, 12, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (234, N'MP TRAIL BLAZER GAS 70 K', NULL, 12, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (235, N'MP TRAIL BLAZER GAS 75 K', NULL, 12, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (236, N'MP TRAIL BLAZER GAS 80 K', NULL, 12, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (237, N'MP TRAIL BLAZER GAS 85 K', NULL, 12, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (238, N'MP TRAIL BLAZER GAS 90 K', NULL, 12, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (239, N'MP TRAIL BLAZER GAS 95 K', NULL, 12, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (240, N'MP TRAIL BLAZER GAS 100 K', NULL, 12, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (241, N'MP CAMARO NG 5 K', NULL, 13, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (242, N'MP CAMARO NG 10 K', NULL, 13, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (243, N'MP CAMARO NG 15 K', NULL, 13, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (244, N'MP CAMARO NG 20 K', NULL, 13, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (245, N'MP CAMARO NG 25 K', NULL, 13, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (246, N'MP CAMARO NG 30 K', NULL, 13, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (247, N'MP CAMARO NG 35 K', NULL, 13, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (248, N'MP CAMARO NG 40 K', NULL, 13, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (249, N'MP CAMARO NG 45 K', NULL, 13, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (250, N'MP CAMARO NG 50 K', NULL, 13, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (251, N'MP CAMARO NG 55 K', NULL, 13, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (252, N'MP CAMARO NG 60 K', NULL, 13, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (253, N'MP CAMARO NG 65 K', NULL, 13, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (254, N'MP CAMARO NG 70 K', NULL, 13, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (255, N'MP CAMARO NG 75 K', NULL, 13, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (256, N'MP CAMARO NG 80 K', NULL, 13, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (257, N'MP CAMARO NG 85 K', NULL, 13, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (258, N'MP CAMARO NG 90 K', NULL, 13, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (259, N'MP CAMARO NG 95 K', NULL, 13, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (260, N'MP CAMARO NG 100 K', NULL, 13, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (261, N'MP TAHOE 5 K', NULL, 14, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (262, N'MP TAHOE 10 K', NULL, 14, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (263, N'MP TAHOE 15 K', NULL, 14, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (264, N'MP TAHOE 20 K', NULL, 14, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (265, N'MP TAHOE 25 K', NULL, 14, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (266, N'MP TAHOE 30 K', NULL, 14, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (267, N'MP TAHOE 35 K', NULL, 14, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (268, N'MP TAHOE 40 K', NULL, 14, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (269, N'MP TAHOE 45 K', NULL, 14, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (270, N'MP TAHOE 50 K', NULL, 14, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (271, N'MP TAHOE 55 K', NULL, 14, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (272, N'MP TAHOE 60 K', NULL, 14, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (273, N'MP TAHOE 65 K', NULL, 14, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (274, N'MP TAHOE 70 K', NULL, 14, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (275, N'MP TAHOE 75 K', NULL, 14, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (276, N'MP TAHOE 80 K', NULL, 14, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (277, N'MP TAHOE 85 K', NULL, 14, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (278, N'MP TAHOE 90 K', NULL, 14, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (279, N'MP TAHOE 95 K', NULL, 14, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (280, N'MP TAHOE 100 K', NULL, 14, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (281, N'MP TRAVERSE NG 5 K', NULL, 15, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (282, N'MP TRAVERSE NG 10 K', NULL, 15, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (283, N'MP TRAVERSE NG 15 K', NULL, 15, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (284, N'MP TRAVERSE NG 20 K', NULL, 15, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (285, N'MP TRAVERSE NG 25 K', NULL, 15, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (286, N'MP TRAVERSE NG 30 K', NULL, 15, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (287, N'MP TRAVERSE NG 35 K', NULL, 15, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (288, N'MP TRAVERSE NG 40 K', NULL, 15, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (289, N'MP TRAVERSE NG 45 K', NULL, 15, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (290, N'MP TRAVERSE NG 50 K', NULL, 15, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (291, N'MP TRAVERSE NG 55 K', NULL, 15, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (292, N'MP TRAVERSE NG 60 K', NULL, 15, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (293, N'MP TRAVERSE NG 65 K', NULL, 15, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (294, N'MP TRAVERSE NG 70 K', NULL, 15, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (295, N'MP TRAVERSE NG 75 K', NULL, 15, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (296, N'MP TRAVERSE NG 80 K', NULL, 15, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (297, N'MP TRAVERSE NG 85 K', NULL, 15, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (298, N'MP TRAVERSE NG 90 K', NULL, 15, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (299, N'MP TRAVERSE NG 95 K', NULL, 15, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (300, N'MP TRAVERSE NG 100 K', NULL, 15, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (301, N'MP BLAZER 5 K', NULL, 16, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (302, N'MP BLAZER 10 K', NULL, 16, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (303, N'MP BLAZER 15 K', NULL, 16, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (304, N'MP BLAZER 20 K', NULL, 16, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (305, N'MP BLAZER 25 K', NULL, 16, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (306, N'MP BLAZER 30 K', NULL, 16, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (307, N'MP BLAZER 35 K', NULL, 16, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (308, N'MP BLAZER 40 K', NULL, 16, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (309, N'MP BLAZER 45 K', NULL, 16, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (310, N'MP BLAZER 50 K', NULL, 16, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (311, N'MP BLAZER 55 K', NULL, 16, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (312, N'MP BLAZER 60 K', NULL, 16, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (313, N'MP BLAZER 65 K', NULL, 16, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (314, N'MP BLAZER 70 K', NULL, 16, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (315, N'MP BLAZER 75 K', NULL, 16, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (316, N'MP BLAZER 80 K', NULL, 16, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (317, N'MP BLAZER 85 K', NULL, 16, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (318, N'MP BLAZER 90 K', NULL, 16, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (319, N'MP BLAZER 95 K', NULL, 16, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (320, N'MP BLAZER 100 K', NULL, 16, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (321, N'MP SPARK 5 K', NULL, 17, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (322, N'MP SPARK 10 K', NULL, 17, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (323, N'MP SPARK 15 K', NULL, 17, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (324, N'MP SPARK 20 K', NULL, 17, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (325, N'MP SPARK 25 K', NULL, 17, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (326, N'MP SPARK 30 K', NULL, 17, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (327, N'MP SPARK 35 K', NULL, 17, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (328, N'MP SPARK 40 K', NULL, 17, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (329, N'MP SPARK 45 K', NULL, 17, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (330, N'MP SPARK 50 K', NULL, 17, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (331, N'MP SPARK 55 K', NULL, 17, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (332, N'MP SPARK 60 K', NULL, 17, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (333, N'MP SPARK 65 K', NULL, 17, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (334, N'MP SPARK 70 K', NULL, 17, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (335, N'MP SPARK 75 K', NULL, 17, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (336, N'MP SPARK 80 K', NULL, 17, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (337, N'MP SPARK 85 K', NULL, 17, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (338, N'MP SPARK 90 K', NULL, 17, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (339, N'MP SPARK 95 K', NULL, 17, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (340, N'MP SPARK 100 K', NULL, 17, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (341, N'MP SPARK GT 5 K', NULL, 18, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (342, N'MP SPARK GT 10 K', NULL, 18, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (343, N'MP SPARK GT 15 K', NULL, 18, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (344, N'MP SPARK GT 20 K', NULL, 18, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (345, N'MP SPARK GT 25 K', NULL, 18, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (346, N'MP SPARK GT 30 K', NULL, 18, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (347, N'MP SPARK GT 35 K', NULL, 18, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (348, N'MP SPARK GT 40 K', NULL, 18, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (349, N'MP SPARK GT 45 K', NULL, 18, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (350, N'MP SPARK GT 50 K', NULL, 18, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (351, N'MP SPARK GT 55 K', NULL, 18, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (352, N'MP SPARK GT 60 K', NULL, 18, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (353, N'MP SPARK GT 65 K', NULL, 18, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (354, N'MP SPARK GT 70 K', NULL, 18, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (355, N'MP SPARK GT 75 K', NULL, 18, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (356, N'MP SPARK GT 80 K', NULL, 18, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (357, N'MP SPARK GT 85 K', NULL, 18, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (358, N'MP SPARK GT 90 K', NULL, 18, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (359, N'MP SPARK GT 95 K', NULL, 18, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (360, N'MP SPARK GT 100 K', NULL, 18, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (361, N'MP BEAT 5 K', NULL, 19, 1, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (362, N'MP BEAT 10 K', NULL, 19, 2, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (363, N'MP BEAT 15 K', NULL, 19, 3, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (364, N'MP BEAT 20 K', NULL, 19, 4, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (365, N'MP BEAT 25 K', NULL, 19, 5, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (366, N'MP BEAT 30 K', NULL, 19, 6, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (367, N'MP BEAT 35 K', NULL, 19, 7, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (368, N'MP BEAT 40 K', NULL, 19, 8, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (369, N'MP BEAT 45 K', NULL, 19, 9, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (370, N'MP BEAT 50 K', NULL, 19, 10, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (371, N'MP BEAT 55 K', NULL, 19, 11, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (372, N'MP BEAT 60 K', NULL, 19, 12, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (373, N'MP BEAT 65 K', NULL, 19, 13, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (374, N'MP BEAT 70 K', NULL, 19, 14, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (375, N'MP BEAT 75 K', NULL, 19, 15, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (376, N'MP BEAT 80 K', NULL, 19, 16, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (377, N'MP BEAT 85 K', NULL, 19, 17, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (378, N'MP BEAT 90 K', NULL, 19, 18, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (379, N'MP BEAT 95 K', NULL, 19, 19, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (380, N'MP BEAT 100 K', NULL, 19, 20, 0, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (381, N'MP N300 5 K', NULL, 20, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (382, N'MP N300 10 K', NULL, 20, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (383, N'MP N300 15 K', NULL, 20, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (384, N'MP N300 20 K', NULL, 20, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (385, N'MP N300 25 K', NULL, 20, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (386, N'MP N300 30 K', NULL, 20, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (387, N'MP N300 35 K', NULL, 20, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (388, N'MP N300 40 K', NULL, 20, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (389, N'MP N300 45 K', NULL, 20, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (390, N'MP N300 50 K', NULL, 20, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (391, N'MP N300 55 K', NULL, 20, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (392, N'MP N300 60 K', NULL, 20, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (393, N'MP N300 65 K', NULL, 20, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (394, N'MP N300 70 K', NULL, 20, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (395, N'MP N300 75 K', NULL, 20, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (396, N'MP N300 80 K', NULL, 20, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (397, N'MP N300 85 K', NULL, 20, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (398, N'MP N300 90 K', NULL, 20, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (399, N'MP N300 95 K', NULL, 20, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (400, N'MP N300 100 K', NULL, 20, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (401, N'MP SAIL 5 K', NULL, 21, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (402, N'MP SAIL 10 K', NULL, 21, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (403, N'MP SAIL 15 K', NULL, 21, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (404, N'MP SAIL 20 K', NULL, 21, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (405, N'MP SAIL 25 K', NULL, 21, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (406, N'MP SAIL 30 K', NULL, 21, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (407, N'MP SAIL 35 K', NULL, 21, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (408, N'MP SAIL 40 K', NULL, 21, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (409, N'MP SAIL 45 K', NULL, 21, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (410, N'MP SAIL 50 K', NULL, 21, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (411, N'MP SAIL 55 K', NULL, 21, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (412, N'MP SAIL 60 K', NULL, 21, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (413, N'MP SAIL 65 K', NULL, 21, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (414, N'MP SAIL 70 K', NULL, 21, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (415, N'MP SAIL 75 K', NULL, 21, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (416, N'MP SAIL 80 K', NULL, 21, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (417, N'MP SAIL 85 K', NULL, 21, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (418, N'MP SAIL 90 K', NULL, 21, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (419, N'MP SAIL 95 K', NULL, 21, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (420, N'MP SAIL 100 K', NULL, 21, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (421, N'MP SONIC TM 5 K', NULL, 22, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (422, N'MP SONIC TM 10 K', NULL, 22, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (423, N'MP SONIC TM 15 K', NULL, 22, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (424, N'MP SONIC TM 20 K', NULL, 22, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (425, N'MP SONIC TM 25 K', NULL, 22, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (426, N'MP SONIC TM 30 K', NULL, 22, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (427, N'MP SONIC TM 35 K', NULL, 22, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (428, N'MP SONIC TM 40 K', NULL, 22, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (429, N'MP SONIC TM 45 K', NULL, 22, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (430, N'MP SONIC TM 50 K', NULL, 22, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (431, N'MP SONIC TM 55 K', NULL, 22, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (432, N'MP SONIC TM 60 K', NULL, 22, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (433, N'MP SONIC TM 65 K', NULL, 22, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (434, N'MP SONIC TM 70 K', NULL, 22, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (435, N'MP SONIC TM 75 K', NULL, 22, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (436, N'MP SONIC TM 80 K', NULL, 22, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (437, N'MP SONIC TM 85 K', NULL, 22, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (438, N'MP SONIC TM 90 K', NULL, 22, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (439, N'MP SONIC TM 95 K', NULL, 22, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (440, N'MP SONIC TM 100 K', NULL, 22, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (441, N'MP SONIC TA 5 K', NULL, 23, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (442, N'MP SONIC TA 10 K', NULL, 23, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (443, N'MP SONIC TA 15 K', NULL, 23, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (444, N'MP SONIC TA 20 K', NULL, 23, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (445, N'MP SONIC TA 25 K', NULL, 23, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (446, N'MP SONIC TA 30 K', NULL, 23, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (447, N'MP SONIC TA 35 K', NULL, 23, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (448, N'MP SONIC TA 40 K', NULL, 23, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (449, N'MP SONIC TA 45 K', NULL, 23, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (450, N'MP SONIC TA 50 K', NULL, 23, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (451, N'MP SONIC TA 55 K', NULL, 23, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (452, N'MP SONIC TA 60 K', NULL, 23, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (453, N'MP SONIC TA 65 K', NULL, 23, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (454, N'MP SONIC TA 70 K', NULL, 23, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (455, N'MP SONIC TA 75 K', NULL, 23, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (456, N'MP SONIC TA 80 K', NULL, 23, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (457, N'MP SONIC TA 85 K', NULL, 23, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (458, N'MP SONIC TA 90 K', NULL, 23, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (459, N'MP SONIC TA 95 K', NULL, 23, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (460, N'MP SONIC TA 100 K', NULL, 23, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (461, N'MP CAPTIVA 2.4 5 K', NULL, 24, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (462, N'MP CAPTIVA 2.4 10 K', NULL, 24, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (463, N'MP CAPTIVA 2.4 15 K', NULL, 24, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (464, N'MP CAPTIVA 2.4 20 K', NULL, 24, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (465, N'MP CAPTIVA 2.4 25 K', NULL, 24, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (466, N'MP CAPTIVA 2.4 30 K', NULL, 24, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (467, N'MP CAPTIVA 2.4 35 K', NULL, 24, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (468, N'MP CAPTIVA 2.4 40 K', NULL, 24, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (469, N'MP CAPTIVA 2.4 45 K', NULL, 24, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (470, N'MP CAPTIVA 2.4 50 K', NULL, 24, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (471, N'MP CAPTIVA 2.4 55 K', NULL, 24, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (472, N'MP CAPTIVA 2.4 60 K', NULL, 24, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (473, N'MP CAPTIVA 2.4 65 K', NULL, 24, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (474, N'MP CAPTIVA 2.4 70 K', NULL, 24, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (475, N'MP CAPTIVA 2.4 75 K', NULL, 24, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (476, N'MP CAPTIVA 2.4 80 K', NULL, 24, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (477, N'MP CAPTIVA 2.4 85 K', NULL, 24, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (478, N'MP CAPTIVA 2.4 90 K', NULL, 24, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (479, N'MP CAPTIVA 2.4 95 K', NULL, 24, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (480, N'MP CAPTIVA 2.4 100 K', NULL, 24, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (481, N'MP CAPTIVA 3.0 5 K', NULL, 25, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (482, N'MP CAPTIVA 3.0 10 K', NULL, 25, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (483, N'MP CAPTIVA 3.0 15 K', NULL, 25, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (484, N'MP CAPTIVA 3.0 20 K', NULL, 25, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (485, N'MP CAPTIVA 3.0 25 K', NULL, 25, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (486, N'MP CAPTIVA 3.0 30 K', NULL, 25, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (487, N'MP CAPTIVA 3.0 35 K', NULL, 25, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (488, N'MP CAPTIVA 3.0 40 K', NULL, 25, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (489, N'MP CAPTIVA 3.0 45 K', NULL, 25, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (490, N'MP CAPTIVA 3.0 50 K', NULL, 25, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (491, N'MP CAPTIVA 3.0 55 K', NULL, 25, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (492, N'MP CAPTIVA 3.0 60 K', NULL, 25, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (493, N'MP CAPTIVA 3.0 65 K', NULL, 25, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (494, N'MP CAPTIVA 3.0 70 K', NULL, 25, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (495, N'MP CAPTIVA 3.0 75 K', NULL, 25, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (496, N'MP CAPTIVA 3.0 80 K', NULL, 25, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (497, N'MP CAPTIVA 3.0 85 K', NULL, 25, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (498, N'MP CAPTIVA 3.0 90 K', NULL, 25, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (499, N'MP CAPTIVA 3.0 95 K', NULL, 25, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (500, N'MP CAPTIVA 3.0 100 K', NULL, 25, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (501, N'MP COBALT TM 5 K', NULL, 26, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (502, N'MP COBALT TM 10 K', NULL, 26, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (503, N'MP COBALT TM 15 K', NULL, 26, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (504, N'MP COBALT TM 20 K', NULL, 26, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (505, N'MP COBALT TM 25 K', NULL, 26, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (506, N'MP COBALT TM 30 K', NULL, 26, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (507, N'MP COBALT TM 35 K', NULL, 26, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (508, N'MP COBALT TM 40 K', NULL, 26, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (509, N'MP COBALT TM 45 K', NULL, 26, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (510, N'MP COBALT TM 50 K', NULL, 26, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (511, N'MP COBALT TM 55 K', NULL, 26, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (512, N'MP COBALT TM 60 K', NULL, 26, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (513, N'MP COBALT TM 65 K', NULL, 26, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (514, N'MP COBALT TM 70 K', NULL, 26, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (515, N'MP COBALT TM 75 K', NULL, 26, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (516, N'MP COBALT TM 80 K', NULL, 26, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (517, N'MP COBALT TM 85 K', NULL, 26, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (518, N'MP COBALT TM 90 K', NULL, 26, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (519, N'MP COBALT TM 95 K', NULL, 26, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (520, N'MP COBALT TM 100 K', NULL, 26, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (521, N'MP COBALT TA 5 K', NULL, 27, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (522, N'MP COBALT TA 10 K', NULL, 27, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (523, N'MP COBALT TA 15 K', NULL, 27, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (524, N'MP COBALT TA 20 K', NULL, 27, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (525, N'MP COBALT TA 25 K', NULL, 27, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (526, N'MP COBALT TA 30 K', NULL, 27, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (527, N'MP COBALT TA 35 K', NULL, 27, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (528, N'MP COBALT TA 40 K', NULL, 27, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (529, N'MP COBALT TA 45 K', NULL, 27, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (530, N'MP COBALT TA 50 K', NULL, 27, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (531, N'MP COBALT TA 55 K', NULL, 27, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (532, N'MP COBALT TA 60 K', NULL, 27, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (533, N'MP COBALT TA 65 K', NULL, 27, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (534, N'MP COBALT TA 70 K', NULL, 27, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (535, N'MP COBALT TA 75 K', NULL, 27, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (536, N'MP COBALT TA 80 K', NULL, 27, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (537, N'MP COBALT TA 85 K', NULL, 27, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (538, N'MP COBALT TA 90 K', NULL, 27, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (539, N'MP COBALT TA 95 K', NULL, 27, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (540, N'MP COBALT TA 100 K', NULL, 27, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (541, N'MP NHR EIV (ABS) 5 K', NULL, 28, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (542, N'MP NHR EIV (ABS) 10 K', NULL, 28, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (543, N'MP NHR EIV (ABS) 15 K', NULL, 28, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (544, N'MP NHR EIV (ABS) 20 K', NULL, 28, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (545, N'MP NHR EIV (ABS) 25 K', NULL, 28, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (546, N'MP NHR EIV (ABS) 30 K', NULL, 28, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (547, N'MP NHR EIV (ABS) 35 K', NULL, 28, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (548, N'MP NHR EIV (ABS) 40 K', NULL, 28, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (549, N'MP NHR EIV (ABS) 45 K', NULL, 28, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (550, N'MP NHR EIV (ABS) 50 K', NULL, 28, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (551, N'MP NHR EIV (ABS) 55 K', NULL, 28, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (552, N'MP NHR EIV (ABS) 60 K', NULL, 28, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (553, N'MP NHR EIV (ABS) 65 K', NULL, 28, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (554, N'MP NHR EIV (ABS) 70 K', NULL, 28, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (555, N'MP NHR EIV (ABS) 75 K', NULL, 28, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (556, N'MP NHR EIV (ABS) 80 K', NULL, 28, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (557, N'MP NHR EIV (ABS) 85 K', NULL, 28, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (558, N'MP NHR EIV (ABS) 90 K', NULL, 28, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (559, N'MP NHR EIV (ABS) 95 K', NULL, 28, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (560, N'MP NHR EIV (ABS) 100 K', NULL, 28, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (561, N'MP NKR MWB EIV (ABS) 5 K', NULL, 29, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (562, N'MP NKR MWB EIV (ABS) 10 K', NULL, 29, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (563, N'MP NKR MWB EIV (ABS) 15 K', NULL, 29, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (564, N'MP NKR MWB EIV (ABS) 20 K', NULL, 29, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (565, N'MP NKR MWB EIV (ABS) 25 K', NULL, 29, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (566, N'MP NKR MWB EIV (ABS) 30 K', NULL, 29, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (567, N'MP NKR MWB EIV (ABS) 35 K', NULL, 29, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (568, N'MP NKR MWB EIV (ABS) 40 K', NULL, 29, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (569, N'MP NKR MWB EIV (ABS) 45 K', NULL, 29, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (570, N'MP NKR MWB EIV (ABS) 50 K', NULL, 29, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (571, N'MP NKR MWB EIV (ABS) 55 K', NULL, 29, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (572, N'MP NKR MWB EIV (ABS) 60 K', NULL, 29, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (573, N'MP NKR MWB EIV (ABS) 65 K', NULL, 29, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (574, N'MP NKR MWB EIV (ABS) 70 K', NULL, 29, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (575, N'MP NKR MWB EIV (ABS) 75 K', NULL, 29, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (576, N'MP NKR MWB EIV (ABS) 80 K', NULL, 29, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (577, N'MP NKR MWB EIV (ABS) 85 K', NULL, 29, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (578, N'MP NKR MWB EIV (ABS) 90 K', NULL, 29, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (579, N'MP NKR MWB EIV (ABS) 95 K', NULL, 29, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (580, N'MP NKR MWB EIV (ABS) 100 K', NULL, 29, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (581, N'MP NPS 4x4 EIV (ABS) 5 K', NULL, 30, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (582, N'MP NPS 4x4 EIV (ABS) 10 K', NULL, 30, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (583, N'MP NPS 4x4 EIV (ABS) 15 K', NULL, 30, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (584, N'MP NPS 4x4 EIV (ABS) 20 K', NULL, 30, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (585, N'MP NPS 4x4 EIV (ABS) 25 K', NULL, 30, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (586, N'MP NPS 4x4 EIV (ABS) 30 K', NULL, 30, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (587, N'MP NPS 4x4 EIV (ABS) 35 K', NULL, 30, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (588, N'MP NPS 4x4 EIV (ABS) 40 K', NULL, 30, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (589, N'MP NPS 4x4 EIV (ABS) 45 K', NULL, 30, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (590, N'MP NPS 4x4 EIV (ABS) 50 K', NULL, 30, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (591, N'MP NPS 4x4 EIV (ABS) 55 K', NULL, 30, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (592, N'MP NPS 4x4 EIV (ABS) 60 K', NULL, 30, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (593, N'MP NPS 4x4 EIV (ABS) 65 K', NULL, 30, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (594, N'MP NPS 4x4 EIV (ABS) 70 K', NULL, 30, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (595, N'MP NPS 4x4 EIV (ABS) 75 K', NULL, 30, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (596, N'MP NPS 4x4 EIV (ABS) 80 K', NULL, 30, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (597, N'MP NPS 4x4 EIV (ABS) 85 K', NULL, 30, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (598, N'MP NPS 4x4 EIV (ABS) 90 K', NULL, 30, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (599, N'MP NPS 4x4 EIV (ABS) 95 K', NULL, 30, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (600, N'MP NPS 4x4 EIV (ABS) 100 K', NULL, 30, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (601, N'MP EQUINOX LS/LT 5 K', NULL, 31, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (602, N'MP EQUINOX LS/LT 10 K', NULL, 31, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 316993.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (603, N'MP EQUINOX LS/LT 15 K', NULL, 31, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (604, N'MP EQUINOX LS/LT 20 K', NULL, 31, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 415273.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (605, N'MP EQUINOX LS/LT 25 K', NULL, 31, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (606, N'MP EQUINOX LS/LT 30 K', NULL, 31, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 380272.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (607, N'MP EQUINOX LS/LT 35 K', NULL, 31, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (608, N'MP EQUINOX LS/LT 40 K', NULL, 31, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 415273.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (609, N'MP EQUINOX LS/LT 45 K', NULL, 31, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (610, N'MP EQUINOX LS/LT 50 K', NULL, 31, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 316993.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (611, N'MP EQUINOX LS/LT 55 K', NULL, 31, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (612, N'MP EQUINOX LS/LT 60 K', NULL, 31, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 478552.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (613, N'MP EQUINOX LS/LT 65 K', NULL, 31, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (614, N'MP EQUINOX LS/LT 70 K', NULL, 31, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 489613.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (615, N'MP EQUINOX LS/LT 75 K', NULL, 31, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (616, N'MP EQUINOX LS/LT 80 K', NULL, 31, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 415273.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (617, N'MP EQUINOX LS/LT 85 K', NULL, 31, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (618, N'MP EQUINOX LS/LT 90 K', NULL, 31, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 575972.1)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (619, N'MP EQUINOX LS/LT 95 K', NULL, 31, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (620, N'MP EQUINOX LS/LT 100 K', NULL, 31, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 415273.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (621, N'MP EQUINOX PREMIER 5 K', NULL, 32, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (622, N'MP EQUINOX PREMIER 10 K', NULL, 32, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), CAST(N'2021-01-28T19:21:30.603' AS DateTime), NULL, 400085.7)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (623, N'MP EQUINOX PREMIER 15 K', NULL, 32, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (624, N'MP EQUINOX PREMIER 20 K', NULL, 32, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 434486.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (625, N'MP EQUINOX PREMIER 25 K', NULL, 32, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (626, N'MP EQUINOX PREMIER 30 K', NULL, 32, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 399485.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (627, N'MP EQUINOX PREMIER 35 K', NULL, 32, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (628, N'MP EQUINOX PREMIER 40 K', NULL, 32, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 434486.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (629, N'MP EQUINOX PREMIER 45 K', NULL, 32, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (630, N'MP EQUINOX PREMIER 50 K', NULL, 32, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 336206.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (631, N'MP EQUINOX PREMIER 55 K', NULL, 32, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (632, N'MP EQUINOX PREMIER 60 K', NULL, 32, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 497765.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (633, N'MP EQUINOX PREMIER 65 K', NULL, 32, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (634, N'MP EQUINOX PREMIER 70 K', NULL, 32, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 508826.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (635, N'MP EQUINOX PREMIER 75 K', NULL, 32, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (636, N'MP EQUINOX PREMIER 80 K', NULL, 32, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 434486.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (637, N'MP EQUINOX PREMIER 85 K', NULL, 32, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (638, N'MP EQUINOX PREMIER 90 K', NULL, 32, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), CAST(N'2021-01-29T11:29:06.520' AS DateTime), NULL, 766915.063)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (639, N'MP EQUINOX PREMIER 95 K', NULL, 32, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (640, N'MP EQUINOX PREMIER 100 K', NULL, 32, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 434486.438)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (641, N'MP NEW CAPTIVA 1.5 TA 5 K', NULL, 33, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 115273.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (642, N'MP NEW CAPTIVA 1.5 TA 10 K', NULL, 33, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 324063.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (643, N'MP NEW CAPTIVA 1.5 TA 15 K', NULL, 33, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (644, N'MP NEW CAPTIVA 1.5 TA 20 K', NULL, 33, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 585815.9)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (645, N'MP NEW CAPTIVA 1.5 TA 25 K', NULL, 33, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (646, N'MP NEW CAPTIVA 1.5 TA 30 K', NULL, 33, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 367067.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (647, N'MP NEW CAPTIVA 1.5 TA 35 K', NULL, 33, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (648, N'MP NEW CAPTIVA 1.5 TA 40 K', NULL, 33, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 455054.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (649, N'MP NEW CAPTIVA 1.5 TA 45 K', NULL, 33, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (650, N'MP NEW CAPTIVA 1.5 TA 50 K', NULL, 33, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 324063.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (651, N'MP NEW CAPTIVA 1.5 TA 55 K', NULL, 33, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (652, N'MP NEW CAPTIVA 1.5 TA 60 K', NULL, 33, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 1458743)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (653, N'MP NEW CAPTIVA 1.5 TA 65 K', NULL, 33, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (654, N'MP NEW CAPTIVA 1.5 TA 70 K', NULL, 33, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 324063.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (655, N'MP NEW CAPTIVA 1.5 TA 75 K', NULL, 33, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (656, N'MP NEW CAPTIVA 1.5 TA 80 K', NULL, 33, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 455054.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (657, N'MP NEW CAPTIVA 1.5 TA 85 K', NULL, 33, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (658, N'MP NEW CAPTIVA 1.5 TA 90 K', NULL, 33, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 367067.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (659, N'MP NEW CAPTIVA 1.5 TA 95 K', NULL, 33, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (660, N'MP NEW CAPTIVA 1.5 TA 100 K', NULL, 33, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 585815.9)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (661, N'MP ONIX 1.0 TURBO TA 5 K', NULL, 34, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (662, N'MP ONIX 1.0 TURBO TA 10 K', NULL, 34, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (663, N'MP ONIX 1.0 TURBO TA 15 K', NULL, 34, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (664, N'MP ONIX 1.0 TURBO TA 20 K', NULL, 34, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (665, N'MP ONIX 1.0 TURBO TA 25 K', NULL, 34, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (666, N'MP ONIX 1.0 TURBO TA 30 K', NULL, 34, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 378356.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (667, N'MP ONIX 1.0 TURBO TA 35 K', NULL, 34, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (668, N'MP ONIX 1.0 TURBO TA 40 K', NULL, 34, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (669, N'MP ONIX 1.0 TURBO TA 45 K', NULL, 34, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (670, N'MP ONIX 1.0 TURBO TA 50 K', NULL, 34, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (671, N'MP ONIX 1.0 TURBO TA 55 K', NULL, 34, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (672, N'MP ONIX 1.0 TURBO TA 60 K', NULL, 34, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 358357.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (673, N'MP ONIX 1.0 TURBO TA 65 K', NULL, 34, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (674, N'MP ONIX 1.0 TURBO TA 70 K', NULL, 34, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (675, N'MP ONIX 1.0 TURBO TA 75 K', NULL, 34, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (676, N'MP ONIX 1.0 TURBO TA 80 K', NULL, 34, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 591208.1)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (677, N'MP ONIX 1.0 TURBO TA 85 K', NULL, 34, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (678, N'MP ONIX 1.0 TURBO TA 90 K', NULL, 34, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 378356.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (679, N'MP ONIX 1.0 TURBO TA 95 K', NULL, 34, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (680, N'MP ONIX 1.0 TURBO TA 100 K', NULL, 34, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (681, N'MP ONIX 1.0 TURBO TM 5 K', NULL, 35, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (682, N'MP ONIX 1.0 TURBO TM 10 K', NULL, 35, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (683, N'MP ONIX 1.0 TURBO TM 15 K', NULL, 35, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (684, N'MP ONIX 1.0 TURBO TM 20 K', NULL, 35, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (685, N'MP ONIX 1.0 TURBO TM 25 K', NULL, 35, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (686, N'MP ONIX 1.0 TURBO TM 30 K', NULL, 35, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 378356.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (687, N'MP ONIX 1.0 TURBO TM 35 K', NULL, 35, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (688, N'MP ONIX 1.0 TURBO TM 40 K', NULL, 35, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (689, N'MP ONIX 1.0 TURBO TM 45 K', NULL, 35, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (690, N'MP ONIX 1.0 TURBO TM 50 K', NULL, 35, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (691, N'MP ONIX 1.0 TURBO TM 55 K', NULL, 35, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (692, N'MP ONIX 1.0 TURBO TM 60 K', NULL, 35, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 358357.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (693, N'MP ONIX 1.0 TURBO TM 65 K', NULL, 35, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (694, N'MP ONIX 1.0 TURBO TM 70 K', NULL, 35, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (695, N'MP ONIX 1.0 TURBO TM 75 K', NULL, 35, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (696, N'MP ONIX 1.0 TURBO TM 80 K', NULL, 35, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 463913.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (697, N'MP ONIX 1.0 TURBO TM 85 K', NULL, 35, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (698, N'MP ONIX 1.0 TURBO TM 90 K', NULL, 35, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 378356.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (699, N'MP ONIX 1.0 TURBO TM 95 K', NULL, 35, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (700, N'MP ONIX 1.0 TURBO TM 100 K', NULL, 35, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (701, N'MP ONIX 1.2 TURBO TA 5 K', NULL, 36, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (702, N'MP ONIX 1.2 TURBO TA 10 K', NULL, 36, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (703, N'MP ONIX 1.2 TURBO TA 15 K', NULL, 36, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (704, N'MP ONIX 1.2 TURBO TA 20 K', NULL, 36, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (705, N'MP ONIX 1.2 TURBO TA 25 K', NULL, 36, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (706, N'MP ONIX 1.2 TURBO TA 30 K', NULL, 36, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 378356.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (707, N'MP ONIX 1.2 TURBO TA 35 K', NULL, 36, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (708, N'MP ONIX 1.2 TURBO TA 40 K', NULL, 36, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (709, N'MP ONIX 1.2 TURBO TA 45 K', NULL, 36, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (710, N'MP ONIX 1.2 TURBO TA 50 K', NULL, 36, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (711, N'MP ONIX 1.2 TURBO TA 55 K', NULL, 36, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (712, N'MP ONIX 1.2 TURBO TA 60 K', NULL, 36, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 358357.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (713, N'MP ONIX 1.2 TURBO TA 65 K', NULL, 36, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (714, N'MP ONIX 1.2 TURBO TA 70 K', NULL, 36, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 342492.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (715, N'MP ONIX 1.2 TURBO TA 75 K', NULL, 36, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (716, N'MP ONIX 1.2 TURBO TA 80 K', NULL, 36, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 615208.1)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (717, N'MP ONIX 1.2 TURBO TA 85 K', NULL, 36, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (718, N'MP ONIX 1.2 TURBO TA 90 K', NULL, 36, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 378356.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (719, N'MP ONIX 1.2 TURBO TA 95 K', NULL, 36, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (720, N'MP ONIX 1.2 TURBO TA 100 K', NULL, 36, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, 322493.156)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (721, N'MP NPR EIV (ABS) 5 K', NULL, 37, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (722, N'MP NPR EIV (ABS) 10 K', NULL, 37, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (723, N'MP NPR EIV (ABS) 15 K', NULL, 37, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (724, N'MP NPR EIV (ABS) 20 K', NULL, 37, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (725, N'MP NPR EIV (ABS) 25 K', NULL, 37, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (726, N'MP NPR EIV (ABS) 30 K', NULL, 37, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (727, N'MP NPR EIV (ABS) 35 K', NULL, 37, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (728, N'MP NPR EIV (ABS) 40 K', NULL, 37, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (729, N'MP NPR EIV (ABS) 45 K', NULL, 37, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (730, N'MP NPR EIV (ABS) 50 K', NULL, 37, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (731, N'MP NPR EIV (ABS) 55 K', NULL, 37, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (732, N'MP NPR EIV (ABS) 60 K', NULL, 37, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (733, N'MP NPR EIV (ABS) 65 K', NULL, 37, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (734, N'MP NPR EIV (ABS) 70 K', NULL, 37, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (735, N'MP NPR EIV (ABS) 75 K', NULL, 37, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (736, N'MP NPR EIV (ABS) 80 K', NULL, 37, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (737, N'MP NPR EIV (ABS) 85 K', NULL, 37, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (738, N'MP NPR EIV (ABS) 90 K', NULL, 37, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (739, N'MP NPR EIV (ABS) 95 K', NULL, 37, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (740, N'MP NPR EIV (ABS) 100 K', NULL, 37, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (741, N'MP NQR EIV (ABS) 5 K', NULL, 38, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (742, N'MP NQR EIV (ABS) 10 K', NULL, 38, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (743, N'MP NQR EIV (ABS) 15 K', NULL, 38, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (744, N'MP NQR EIV (ABS) 20 K', NULL, 38, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (745, N'MP NQR EIV (ABS) 25 K', NULL, 38, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (746, N'MP NQR EIV (ABS) 30 K', NULL, 38, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (747, N'MP NQR EIV (ABS) 35 K', NULL, 38, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (748, N'MP NQR EIV (ABS) 40 K', NULL, 38, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (749, N'MP NQR EIV (ABS) 45 K', NULL, 38, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (750, N'MP NQR EIV (ABS) 50 K', NULL, 38, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (751, N'MP NQR EIV (ABS) 55 K', NULL, 38, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (752, N'MP NQR EIV (ABS) 60 K', NULL, 38, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (753, N'MP NQR EIV (ABS) 65 K', NULL, 38, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (754, N'MP NQR EIV (ABS) 70 K', NULL, 38, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (755, N'MP NQR EIV (ABS) 75 K', NULL, 38, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (756, N'MP NQR EIV (ABS) 80 K', NULL, 38, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (757, N'MP NQR EIV (ABS) 85 K', NULL, 38, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (758, N'MP NQR EIV (ABS) 90 K', NULL, 38, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (759, N'MP NQR EIV (ABS) 95 K', NULL, 38, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (760, N'MP NQR EIV (ABS) 100 K', NULL, 38, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (761, N'MP FRR EIV 5 K', NULL, 39, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (762, N'MP FRR EIV 10 K', NULL, 39, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (763, N'MP FRR EIV 15 K', NULL, 39, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (764, N'MP FRR EIV 20 K', NULL, 39, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (765, N'MP FRR EIV 25 K', NULL, 39, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (766, N'MP FRR EIV 30 K', NULL, 39, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (767, N'MP FRR EIV 35 K', NULL, 39, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (768, N'MP FRR EIV 40 K', NULL, 39, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (769, N'MP FRR EIV 45 K', NULL, 39, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (770, N'MP FRR EIV 50 K', NULL, 39, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (771, N'MP FRR EIV 55 K', NULL, 39, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (772, N'MP FRR EIV 60 K', NULL, 39, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (773, N'MP FRR EIV 65 K', NULL, 39, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (774, N'MP FRR EIV 70 K', NULL, 39, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (775, N'MP FRR EIV 75 K', NULL, 39, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (776, N'MP FRR EIV 80 K', NULL, 39, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (777, N'MP FRR EIV 85 K', NULL, 39, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (778, N'MP FRR EIV 90 K', NULL, 39, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (779, N'MP FRR EIV 95 K', NULL, 39, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (780, N'MP FRR EIV 100 K', NULL, 39, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (781, N'MP FTR EIV 5 K', NULL, 40, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (782, N'MP FTR EIV 10 K', NULL, 40, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (783, N'MP FTR EIV 15 K', NULL, 40, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (784, N'MP FTR EIV 20 K', NULL, 40, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (785, N'MP FTR EIV 25 K', NULL, 40, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (786, N'MP FTR EIV 30 K', NULL, 40, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (787, N'MP FTR EIV 35 K', NULL, 40, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (788, N'MP FTR EIV 40 K', NULL, 40, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (789, N'MP FTR EIV 45 K', NULL, 40, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (790, N'MP FTR EIV 50 K', NULL, 40, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (791, N'MP FTR EIV 55 K', NULL, 40, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (792, N'MP FTR EIV 60 K', NULL, 40, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (793, N'MP FTR EIV 65 K', NULL, 40, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (794, N'MP FTR EIV 70 K', NULL, 40, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (795, N'MP FTR EIV 75 K', NULL, 40, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (796, N'MP FTR EIV 80 K', NULL, 40, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (797, N'MP FTR EIV 85 K', NULL, 40, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (798, N'MP FTR EIV 90 K', NULL, 40, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (799, N'MP FTR EIV 95 K', NULL, 40, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (800, N'MP FTR EIV 100 K', NULL, 40, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (801, N'MP FVR EIV 5 K', NULL, 41, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (802, N'MP FVR EIV 10 K', NULL, 41, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (803, N'MP FVR EIV 15 K', NULL, 41, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (804, N'MP FVR EIV 20 K', NULL, 41, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (805, N'MP FVR EIV 25 K', NULL, 41, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (806, N'MP FVR EIV 30 K', NULL, 41, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (807, N'MP FVR EIV 35 K', NULL, 41, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (808, N'MP FVR EIV 40 K', NULL, 41, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (809, N'MP FVR EIV 45 K', NULL, 41, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (810, N'MP FVR EIV 50 K', NULL, 41, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (811, N'MP FVR EIV 55 K', NULL, 41, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (812, N'MP FVR EIV 60 K', NULL, 41, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (813, N'MP FVR EIV 65 K', NULL, 41, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (814, N'MP FVR EIV 70 K', NULL, 41, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (815, N'MP FVR EIV 75 K', NULL, 41, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (816, N'MP FVR EIV 80 K', NULL, 41, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (817, N'MP FVR EIV 85 K', NULL, 41, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (818, N'MP FVR EIV 90 K', NULL, 41, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (819, N'MP FVR EIV 95 K', NULL, 41, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (820, N'MP FVR EIV 100 K', NULL, 41, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (821, N'MP FVZ EIV 5 K', NULL, 42, 1, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (822, N'MP FVZ EIV 10 K', NULL, 42, 2, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (823, N'MP FVZ EIV 15 K', NULL, 42, 3, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (824, N'MP FVZ EIV 20 K', NULL, 42, 4, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (825, N'MP FVZ EIV 25 K', NULL, 42, 5, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (826, N'MP FVZ EIV 30 K', NULL, 42, 6, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (827, N'MP FVZ EIV 35 K', NULL, 42, 7, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (828, N'MP FVZ EIV 40 K', NULL, 42, 8, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (829, N'MP FVZ EIV 45 K', NULL, 42, 9, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (830, N'MP FVZ EIV 50 K', NULL, 42, 10, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (831, N'MP FVZ EIV 55 K', NULL, 42, 11, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (832, N'MP FVZ EIV 60 K', NULL, 42, 12, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (833, N'MP FVZ EIV 65 K', NULL, 42, 13, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (834, N'MP FVZ EIV 70 K', NULL, 42, 14, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (835, N'MP FVZ EIV 75 K', NULL, 42, 15, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (836, N'MP FVZ EIV 80 K', NULL, 42, 16, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (837, N'MP FVZ EIV 85 K', NULL, 42, 17, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (838, N'MP FVZ EIV 90 K', NULL, 42, 18, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (839, N'MP FVZ EIV 95 K', NULL, 42, 19, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (840, N'MP FVZ EIV 100 K', NULL, 42, 20, 1, CAST(N'2020-11-26T20:53:00.770' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (841, N'BEAT 5K', NULL, 19, 1, 0, CAST(N'2021-01-22T23:40:57.620' AS DateTime), NULL, CAST(N'2021-01-22T23:41:14.460' AS DateTime), 42483)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (842, N'MANTENIMIENTO CORRECTIVO', NULL, 1, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (843, N'MANTENIMIENTO CORRECTIVO', NULL, 2, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (844, N'MANTENIMIENTO CORRECTIVO', NULL, 3, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (845, N'MANTENIMIENTO CORRECTIVO', NULL, 4, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (846, N'MANTENIMIENTO CORRECTIVO', NULL, 5, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (847, N'MANTENIMIENTO CORRECTIVO', NULL, 6, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (848, N'MANTENIMIENTO CORRECTIVO', NULL, 7, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (849, N'MANTENIMIENTO CORRECTIVO', NULL, 8, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (850, N'MANTENIMIENTO CORRECTIVO', NULL, 9, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (851, N'MANTENIMIENTO CORRECTIVO', NULL, 10, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (852, N'MANTENIMIENTO CORRECTIVO', NULL, 11, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (853, N'MANTENIMIENTO CORRECTIVO', NULL, 12, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (854, N'MANTENIMIENTO CORRECTIVO', NULL, 13, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (855, N'MANTENIMIENTO CORRECTIVO', NULL, 14, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (856, N'MANTENIMIENTO CORRECTIVO', NULL, 15, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (857, N'MANTENIMIENTO CORRECTIVO', NULL, 16, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (858, N'MANTENIMIENTO CORRECTIVO', NULL, 17, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (859, N'MANTENIMIENTO CORRECTIVO', NULL, 18, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (860, N'MANTENIMIENTO CORRECTIVO', NULL, 19, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (861, N'MANTENIMIENTO CORRECTIVO', NULL, 20, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (862, N'MANTENIMIENTO CORRECTIVO', NULL, 21, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (863, N'MANTENIMIENTO CORRECTIVO', NULL, 22, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (864, N'MANTENIMIENTO CORRECTIVO', NULL, 23, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (865, N'MANTENIMIENTO CORRECTIVO', NULL, 24, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (866, N'MANTENIMIENTO CORRECTIVO', NULL, 25, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (867, N'MANTENIMIENTO CORRECTIVO', NULL, 26, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (868, N'MANTENIMIENTO CORRECTIVO', NULL, 27, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (869, N'MANTENIMIENTO CORRECTIVO', NULL, 28, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (870, N'MANTENIMIENTO CORRECTIVO', NULL, 29, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (871, N'MANTENIMIENTO CORRECTIVO', NULL, 30, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (872, N'MANTENIMIENTO CORRECTIVO', NULL, 31, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (873, N'MANTENIMIENTO CORRECTIVO', NULL, 32, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (874, N'MANTENIMIENTO CORRECTIVO', NULL, 33, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (875, N'MANTENIMIENTO CORRECTIVO', NULL, 34, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (876, N'MANTENIMIENTO CORRECTIVO', NULL, 35, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (877, N'MANTENIMIENTO CORRECTIVO', NULL, 36, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (878, N'MANTENIMIENTO CORRECTIVO', NULL, 37, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (879, N'MANTENIMIENTO CORRECTIVO', NULL, 38, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (880, N'MANTENIMIENTO CORRECTIVO', NULL, 39, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (881, N'MANTENIMIENTO CORRECTIVO', NULL, 40, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (882, N'MANTENIMIENTO CORRECTIVO', NULL, 41, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[maintenanceRoutine] ([mr_id], [mr_name], [mr_description], [vm_id], [fq_id], [mr_state], [mr_registrationDate], [mr_updateDate], [mr_deleteDate], [mr_referencePrice]) VALUES (883, N'MANTENIMIENTO CORRECTIVO', NULL, 42, 21, 1, CAST(N'2021-03-03T16:25:09.237' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[maintenanceRoutine] OFF
SET IDENTITY_INSERT [dbo].[Modules] ON 

INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (1, N'Clientes', N'/MasterClients', N'nav-client', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (2, N'Concesionarios', N'/MasterDealers', N'nav-dealer', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (3, N'Mantenimientos', N'/ItemsAndRoutines', N'nav-routine', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (5, N'Contratos', N'/MasterContracts', N'nav-contract', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (6, N'Movimientos', N'/MasterMovements', N'nav-movements', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (7, N'Gestión de cupos', N'/QuotaManagement', N'nav-quota', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (8, N'Orden de trabajo', N'/WorkOrderManagement', N'nav-work-order', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (9, N'Aprobaciones', N'/DashboardClient', N'nav-approbation', 0, 1)
SET IDENTITY_INSERT [dbo].[Modules] OFF
SET IDENTITY_INSERT [dbo].[Movement] ON 

INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (1, N'CREACIÓN DE CUPO', N'MOVIMIENTO QUE ASOCIA UN CUPO INICIAL AL CLIENTE', 1, 1, CAST(N'2020-12-05T10:51:39.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (2, N'ADICIÓN DE CUPO', N'MOVIMIENTO QUE AUMENTA EL CUPO ACTUAL DEL CLIENTE', 1, 1, CAST(N'2020-12-05T10:51:39.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (3, N'CANCELACIÓN DE CUPO', N'MOVIMIENTO QUE ANULA EL CUPO ACTUAL DEL CLIENTE', 1, 1, CAST(N'2020-12-05T10:51:39.060' AS DateTime), CAST(N'2020-12-07T13:01:28.500' AS DateTime), NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (4, N'ORDEN DE TRABAJO', N'MOVIMIENTO QUE RESTA AL CUPO DISPONIBLE Y SUMA AL CUPO EN TRÁNSITO', 2, 1, CAST(N'2020-12-05T10:51:39.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (5, N'APROBACIÓN DE ÓRDEN DE TRABAJO', N'MOVIMIENTO QUE RESTA EL VALOR DE LA ÓRDEN DE TRABAJO DE CUPO EN TRÁNSITO Y AUMENTA EL CUPO CONSUMIDO', 2, 1, CAST(N'2020-12-05T11:03:04.277' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (6, N'CANCELACIÓN DE ÓRDEN DE TRABAJO', N'MOVIMIENTO QUE SUMA EL VALOR DE LA ÓRDEN DE TRABAJO AL CUPO DISPONIBLE Y LO RESTA DE CUPO EN TRÁNSITO', 1, 1, CAST(N'2020-12-05T11:03:04.277' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (7, N'LIBERACIÓN DE CUPO', N'MOVIMIENTO QUE RESTA EL VALOR DEL PAGO, DEL VALOR DEL CUPO CONSUMIDO Y LO SUMA AL CUPO DISPONIBLE', 1, 1, CAST(N'2020-12-07T13:16:57.270' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (8, N'FINALIZACIÓN DE ORDEN DE TRABAJO', N'MOVIMIENTO QUE RESTA EL CUPO EN TRÁNSITO GENERADO Y LO SUMA AL CUPO CONSUMIDO CUANDO EL CONCESIONARIO FINALIZA EL SERVICIO', 2, 1, CAST(N'2021-03-04T15:35:25.703' AS DateTime), NULL, NULL)
INSERT [dbo].[Movement] ([m_id], [m_name], [m_description], [mtp_id], [m_state], [m_registrationDate], [m_updateDate], [m_deleteDate]) VALUES (9, N'ANULACIÓN DE ORDEN DE TRABAJO', N'MOVIMIENTO QUE RESTA EL CUPO EN TRÁNSITO Y LO SUMA AL CUPO DISPONIBLE CUÁNDO EL CONCESIONARIO NO PUEDE COMPLETAR EL SERVICIO', 1, 1, CAST(N'2021-03-04T15:35:25.703' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Movement] OFF
SET IDENTITY_INSERT [dbo].[MovementType] ON 

INSERT [dbo].[MovementType] ([mtp_id], [mtp_name], [mtp_description], [mtp_registrationDate], [mtp_updateDate], [mtp_deleteDate]) VALUES (1, N'DÉBITO', N'Adiciona su valor al cupo del cliente', CAST(N'2020-12-05T10:42:16.550' AS DateTime), NULL, NULL)
INSERT [dbo].[MovementType] ([mtp_id], [mtp_name], [mtp_description], [mtp_registrationDate], [mtp_updateDate], [mtp_deleteDate]) VALUES (2, N'CRÉDITO', N'Resta su valor al cupo del cliente', CAST(N'2020-12-05T10:42:16.550' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MovementType] OFF
SET IDENTITY_INSERT [dbo].[Operations] ON 

INSERT [dbo].[Operations] ([op_id], [op_symbol], [op_name], [op_state], [op_registrationDate], [op_updateDate], [op_deleteDate]) VALUES (1, N'=', N'ES IGUAL A', 1, CAST(N'2020-12-06T19:17:01.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Operations] ([op_id], [op_symbol], [op_name], [op_state], [op_registrationDate], [op_updateDate], [op_deleteDate]) VALUES (2, N'+', N'MÁS', 1, CAST(N'2020-12-06T19:17:01.467' AS DateTime), NULL, NULL)
INSERT [dbo].[Operations] ([op_id], [op_symbol], [op_name], [op_state], [op_registrationDate], [op_updateDate], [op_deleteDate]) VALUES (3, N'-', N'MENOS', 1, CAST(N'2020-12-06T19:17:01.467' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Operations] OFF
SET IDENTITY_INSERT [dbo].[PresentationUnit] ON 

INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (1, N'UND', N'UNIDAD', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (2, N'CTO', N'CUARTO', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (3, N'PNT', N'PINTA', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (4, N'LT', N'LITRO', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (5, N'GLN', N'GALÓN', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (6, N'HRS', N'HORAS', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PresentationUnit] OFF
SET IDENTITY_INSERT [dbo].[PricesByContract] ON 

INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (1, 1, 1, 80000, CAST(N'2021-03-15T10:22:33.803' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (2, 1, 2, 80000, CAST(N'2021-03-15T10:22:33.817' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (3, 1, 3, 71400, CAST(N'2021-03-15T10:22:33.817' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (4, 1, 4, 71400, CAST(N'2021-03-15T10:22:33.820' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (5, 1, 45, 71400, CAST(N'2021-03-15T10:22:33.823' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (6, 1, 46, 71400, CAST(N'2021-03-15T10:22:33.823' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (7, 1, 5, 71400, CAST(N'2021-03-15T10:22:33.827' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (8, 1, 47, 71400, CAST(N'2021-03-15T10:22:33.830' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (9, 1, 49, 71400, CAST(N'2021-03-15T10:22:33.830' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (10, 1, 48, 71400, CAST(N'2021-03-15T10:22:33.833' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (11, 1, 6, 71400, CAST(N'2021-03-15T10:22:33.837' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (12, 1, 7, 71400, CAST(N'2021-03-15T10:22:33.840' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (13, 1, 50, 71400, CAST(N'2021-03-15T10:22:33.840' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (14, 1, 8, 71400, CAST(N'2021-03-15T10:22:33.843' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (15, 1, 9, 71400, CAST(N'2021-03-15T10:22:33.847' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (16, 1, 10, 71400, CAST(N'2021-03-15T10:22:33.847' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (17, 1, 11, 71400, CAST(N'2021-03-15T10:22:33.850' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (18, 1, 12, 71400, CAST(N'2021-03-15T10:22:33.853' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (19, 1, 13, 71400, CAST(N'2021-03-15T10:22:33.853' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (20, 1, 51, 71400, CAST(N'2021-03-15T10:22:33.857' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (21, 1, 52, 71400, CAST(N'2021-03-15T10:22:33.860' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (22, 1, 53, 71400, CAST(N'2021-03-15T10:22:33.863' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (23, 1, 54, 71400, CAST(N'2021-03-15T10:22:33.867' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (24, 1, 55, 71400, CAST(N'2021-03-15T10:22:33.867' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (25, 1, 56, 71400, CAST(N'2021-03-15T10:22:33.870' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (26, 1, 57, 71400, CAST(N'2021-03-15T10:22:33.873' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (27, 1, 58, 71400, CAST(N'2021-03-15T10:22:33.873' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (28, 1, 59, 71400, CAST(N'2021-03-15T10:22:33.877' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (29, 1, 14, 71400, CAST(N'2021-03-15T10:22:33.880' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (30, 1, 15, 80000, CAST(N'2021-03-15T10:22:33.883' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (31, 1, 16, 71400, CAST(N'2021-03-15T10:22:33.887' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (32, 1, 17, 71400, CAST(N'2021-03-15T10:22:33.890' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (33, 1, 18, 71400, CAST(N'2021-03-15T10:22:33.890' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (34, 1, 19, 71400, CAST(N'2021-03-15T10:22:33.893' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (35, 1, 60, 71400, CAST(N'2021-03-15T10:22:33.897' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (36, 1, 61, 71400, CAST(N'2021-03-15T10:22:33.900' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (37, 1, 62, 71400, CAST(N'2021-03-15T10:22:33.900' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (38, 1, 63, 71400, CAST(N'2021-03-15T10:22:33.903' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (39, 1, 20, 71400, CAST(N'2021-03-15T10:22:33.907' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (40, 1, 69, 78000, CAST(N'2021-03-15T10:22:33.910' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (41, 1, 21, 19250, CAST(N'2021-03-15T10:22:33.913' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (42, 1, 22, 23000, CAST(N'2021-03-15T10:22:33.917' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (43, 1, 23, 75000, CAST(N'2021-03-15T10:22:33.917' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (44, 1, 72, 2434234, CAST(N'2021-03-15T10:22:33.920' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (45, 1, 35, 6000, CAST(N'2021-03-15T10:22:33.927' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (46, 1, 42, 13500, CAST(N'2021-03-15T10:22:33.927' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (47, 1, 65, 150000, CAST(N'2021-03-15T10:22:33.930' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (48, 1, 70, 788888, CAST(N'2021-03-15T10:22:33.933' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (49, 1, 71, 80000, CAST(N'2021-03-15T10:22:33.937' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (50, 1, 27, 19000, CAST(N'2021-03-15T10:22:33.940' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (51, 1, 28, 20000, CAST(N'2021-03-15T10:22:33.943' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (52, 1, 29, 18000, CAST(N'2021-03-15T10:22:33.947' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (53, 1, 40, 40000, CAST(N'2021-03-15T10:22:33.950' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (54, 1, 43, 50000, CAST(N'2021-03-15T10:22:33.953' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (55, 1, 64, 1000000, CAST(N'2021-03-15T10:22:33.957' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (56, 1, 68, 50000, CAST(N'2021-03-15T10:22:33.960' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (57, 1, 30, 17000, CAST(N'2021-03-15T10:22:33.963' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (58, 1, 36, 15000, CAST(N'2021-03-15T10:22:33.967' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (59, 1, 38, 25000, CAST(N'2021-03-15T10:22:33.970' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (60, 1, 31, 49001, CAST(N'2021-03-15T10:22:33.973' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (61, 1, 37, 29000, CAST(N'2021-03-15T10:22:33.973' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (62, 1, 39, 84000, CAST(N'2021-03-15T10:22:33.977' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (63, 1, 32, 23000, CAST(N'2021-03-15T10:22:33.980' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (64, 1, 33, 55000, CAST(N'2021-03-15T10:22:33.983' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (65, 1, 41, 50000, CAST(N'2021-03-15T10:22:33.987' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (66, 1, 25, 20000, CAST(N'2021-03-15T10:22:33.990' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (67, 1, 26, 20000, CAST(N'2021-03-15T10:22:33.997' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (68, 1, 44, 8000, CAST(N'2021-03-15T10:22:34.000' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (69, 1, 67, 89000, CAST(N'2021-03-15T10:22:34.003' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (70, 1, 24, 15000, CAST(N'2021-03-15T10:22:34.007' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByContract] ([pbc_id], [cntr_id], [mi_id], [mi_referencePrice], [pbc_registrationDate], [pbc_updateDate], [pbc_deleteDate]) VALUES (71, 1, 34, 101000, CAST(N'2021-03-15T10:22:34.010' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PricesByContract] OFF
SET IDENTITY_INSERT [dbo].[PricesByDealer] ON 

INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1, 1, 1, 80000, CAST(N'2020-11-28T11:15:14.843' AS DateTime), CAST(N'2021-01-25T12:39:16.463' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (2, 1, 2, 80000, CAST(N'2020-11-28T11:15:15.877' AS DateTime), CAST(N'2020-11-28T11:27:47.077' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (3, 1, 3, 71400, CAST(N'2020-11-28T11:15:15.887' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (4, 1, 4, 71400, CAST(N'2020-11-28T11:15:15.887' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (5, 1, 45, 71400, CAST(N'2020-11-28T11:15:15.890' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (6, 1, 46, 71400, CAST(N'2020-11-28T11:15:15.923' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (7, 1, 5, 71400, CAST(N'2020-11-28T11:15:15.930' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (8, 1, 47, 71400, CAST(N'2020-11-28T11:15:15.937' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (9, 1, 49, 71400, CAST(N'2020-11-28T11:15:15.943' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (10, 1, 48, 71400, CAST(N'2020-11-28T11:15:15.950' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (11, 1, 6, 71400, CAST(N'2020-11-28T11:15:15.960' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (12, 1, 7, 71400, CAST(N'2020-11-28T11:15:15.963' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (13, 1, 50, 71400, CAST(N'2020-11-28T11:15:15.970' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (14, 1, 8, 71400, CAST(N'2020-11-28T11:15:16.010' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (15, 1, 9, 71400, CAST(N'2020-11-28T11:15:16.013' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (16, 1, 10, 71400, CAST(N'2020-11-28T11:15:16.043' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (17, 1, 11, 71400, CAST(N'2020-11-28T11:15:16.050' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (18, 1, 12, 71400, CAST(N'2020-11-28T11:15:16.057' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (19, 1, 13, 71400, CAST(N'2020-11-28T11:15:16.060' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (20, 1, 51, 71400, CAST(N'2020-11-28T11:15:16.070' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (21, 1, 52, 71400, CAST(N'2020-11-28T11:15:16.073' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (22, 1, 53, 71400, CAST(N'2020-11-28T11:15:16.080' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (23, 1, 54, 71400, CAST(N'2020-11-28T11:15:16.083' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (24, 1, 55, 71400, CAST(N'2020-11-28T11:15:16.083' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (25, 1, 56, 71400, CAST(N'2020-11-28T11:15:16.087' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (26, 1, 57, 71400, CAST(N'2020-11-28T11:15:16.090' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (27, 1, 58, 71400, CAST(N'2020-11-28T11:15:16.090' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (28, 1, 59, 71400, CAST(N'2020-11-28T11:15:16.093' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (29, 1, 14, 71400, CAST(N'2020-11-28T11:15:16.093' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (30, 1, 15, 80000, CAST(N'2020-11-28T11:15:16.097' AS DateTime), CAST(N'2020-11-28T12:38:08.900' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (31, 1, 16, 71400, CAST(N'2020-11-28T11:15:16.100' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (32, 1, 17, 71400, CAST(N'2020-11-28T11:15:16.100' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (33, 1, 18, 71400, CAST(N'2020-11-28T11:15:16.103' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (34, 1, 19, 71400, CAST(N'2020-11-28T11:15:16.103' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (35, 1, 60, 71400, CAST(N'2020-11-28T11:15:16.107' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (36, 1, 61, 71400, CAST(N'2020-11-28T11:15:16.107' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (37, 1, 62, 71400, CAST(N'2020-11-28T11:15:16.110' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (38, 1, 63, 71400, CAST(N'2020-11-28T11:15:16.110' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (39, 1, 20, 71400, CAST(N'2020-11-28T11:15:16.113' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (40, 1, 21, 19250, CAST(N'2020-11-28T11:15:16.117' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (41, 1, 22, 23000, CAST(N'2020-11-28T11:15:16.120' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (42, 1, 23, 75000, CAST(N'2020-11-28T11:15:16.120' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (43, 1, 35, 6000, CAST(N'2020-11-28T11:15:16.123' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (44, 1, 42, 13500, CAST(N'2020-11-28T11:15:16.127' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (45, 1, 27, 19000, CAST(N'2020-11-28T11:15:16.127' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (46, 1, 28, 20000, CAST(N'2020-11-28T11:15:16.130' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (47, 1, 29, 18000, CAST(N'2020-11-28T11:15:16.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (48, 1, 40, 40000, CAST(N'2020-11-28T11:15:16.137' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (49, 1, 43, 50000, CAST(N'2020-11-28T11:15:16.137' AS DateTime), CAST(N'2020-11-28T11:27:47.090' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (50, 1, 30, 17000, CAST(N'2020-11-28T11:15:16.140' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (51, 1, 36, 15000, CAST(N'2020-11-28T11:15:16.143' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (52, 1, 38, 25000, CAST(N'2020-11-28T11:15:16.147' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (53, 1, 31, 49001, CAST(N'2020-11-28T11:15:16.150' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (54, 1, 37, 29000, CAST(N'2020-11-28T11:15:16.153' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (55, 1, 39, 84000, CAST(N'2020-11-28T11:15:16.153' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (56, 1, 32, 23000, CAST(N'2020-11-28T11:15:16.157' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (57, 1, 33, 55000, CAST(N'2020-11-28T11:15:16.160' AS DateTime), CAST(N'2020-11-28T11:40:49.203' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (58, 1, 41, 50000, CAST(N'2020-11-28T11:15:16.163' AS DateTime), CAST(N'2020-11-28T11:40:29.613' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (59, 1, 25, 20000, CAST(N'2020-11-28T11:15:16.200' AS DateTime), CAST(N'2020-11-28T11:22:30.623' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (60, 1, 26, 20000, CAST(N'2020-11-28T11:15:16.207' AS DateTime), CAST(N'2020-11-28T11:40:18.160' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (61, 1, 44, 8000, CAST(N'2020-11-28T11:15:16.213' AS DateTime), CAST(N'2020-11-28T11:41:02.947' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (62, 1, 24, 15000, CAST(N'2020-11-28T11:15:16.230' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (63, 1, 34, 101000, CAST(N'2020-11-28T11:15:16.240' AS DateTime), CAST(N'2020-11-28T11:41:21.760' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (64, 2, 1, 73000, CAST(N'2020-11-28T12:39:43.013' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (65, 2, 2, 75000, CAST(N'2020-11-28T12:39:43.133' AS DateTime), CAST(N'2021-01-25T11:23:23.863' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (66, 2, 3, 73000, CAST(N'2020-11-28T12:39:43.137' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (67, 2, 4, 73000, CAST(N'2020-11-28T12:39:43.140' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (68, 2, 45, 73000, CAST(N'2020-11-28T12:39:43.140' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (69, 2, 46, 73000, CAST(N'2020-11-28T12:39:43.143' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (70, 2, 5, 73000, CAST(N'2020-11-28T12:39:43.143' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (71, 2, 47, 73000, CAST(N'2020-11-28T12:39:43.147' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (72, 2, 49, 73000, CAST(N'2020-11-28T12:39:43.147' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (73, 2, 48, 73000, CAST(N'2020-11-28T12:39:43.150' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (74, 2, 6, 73000, CAST(N'2020-11-28T12:39:43.150' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (75, 2, 7, 73000, CAST(N'2020-11-28T12:39:43.160' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (76, 2, 50, 73000, CAST(N'2020-11-28T12:39:43.163' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (77, 2, 8, 71400, CAST(N'2020-11-28T12:39:43.163' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (78, 2, 9, 71400, CAST(N'2020-11-28T12:39:43.167' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (79, 2, 10, 73000, CAST(N'2020-11-28T12:39:43.167' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (80, 2, 11, 73000, CAST(N'2020-11-28T12:39:43.170' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (81, 2, 12, 71400, CAST(N'2020-11-28T12:39:43.173' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (82, 2, 13, 71400, CAST(N'2020-11-28T12:39:43.177' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (83, 2, 51, 71400, CAST(N'2020-11-28T12:39:43.180' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (84, 2, 52, 71400, CAST(N'2020-11-28T12:39:43.183' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (85, 2, 53, 71400, CAST(N'2020-11-28T12:39:43.183' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (86, 2, 54, 71400, CAST(N'2020-11-28T12:39:43.187' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (87, 2, 55, 71400, CAST(N'2020-11-28T12:39:43.190' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (88, 2, 56, 71400, CAST(N'2020-11-28T12:39:43.193' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (89, 2, 57, 71400, CAST(N'2020-11-28T12:39:43.193' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (90, 2, 58, 71400, CAST(N'2020-11-28T12:39:43.197' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (91, 2, 59, 71400, CAST(N'2020-11-28T12:39:43.200' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (92, 2, 14, 71400, CAST(N'2020-11-28T12:39:43.200' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (93, 2, 15, 71400, CAST(N'2020-11-28T12:39:43.203' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (94, 2, 16, 71400, CAST(N'2020-11-28T12:39:43.207' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (95, 2, 17, 71400, CAST(N'2020-11-28T12:39:43.210' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (96, 2, 18, 71400, CAST(N'2020-11-28T12:39:43.223' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (97, 2, 19, 71400, CAST(N'2020-11-28T12:39:43.227' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (98, 2, 60, 71400, CAST(N'2020-11-28T12:39:43.227' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (99, 2, 61, 71400, CAST(N'2020-11-28T12:39:43.230' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (100, 2, 62, 71400, CAST(N'2020-11-28T12:39:43.233' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (101, 2, 63, 71400, CAST(N'2020-11-28T12:39:43.253' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (102, 2, 20, 71400, CAST(N'2020-11-28T12:39:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (103, 2, 21, 19250, CAST(N'2020-11-28T12:39:43.270' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (104, 2, 22, 21000, CAST(N'2020-11-28T12:39:43.273' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (105, 2, 23, 70000, CAST(N'2020-11-28T12:39:43.277' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (106, 2, 35, 6000, CAST(N'2020-11-28T12:39:43.277' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (107, 2, 42, 13500, CAST(N'2020-11-28T12:39:43.280' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (108, 2, 27, 19000, CAST(N'2020-11-28T12:39:43.283' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (109, 2, 28, 20000, CAST(N'2020-11-28T12:39:43.287' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (110, 2, 29, 18000, CAST(N'2020-11-28T12:39:43.303' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (111, 2, 40, 40000, CAST(N'2020-11-28T12:39:43.307' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (112, 2, 43, 48000, CAST(N'2020-11-28T12:39:43.310' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (113, 2, 30, 19000, CAST(N'2020-11-28T12:39:43.310' AS DateTime), CAST(N'2021-01-25T11:24:01.130' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (114, 2, 36, 17050, CAST(N'2020-11-28T12:39:43.313' AS DateTime), CAST(N'2021-01-25T11:24:01.143' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (115, 2, 38, 25000, CAST(N'2020-11-28T12:39:43.317' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (116, 2, 31, 49001, CAST(N'2020-11-28T12:39:43.317' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (117, 2, 37, 29000, CAST(N'2020-11-28T12:39:43.320' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (118, 2, 39, 84000, CAST(N'2020-11-28T12:39:43.343' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (119, 2, 32, 23000, CAST(N'2020-11-28T12:39:43.343' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (120, 2, 33, 53000, CAST(N'2020-11-28T12:39:43.367' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (121, 2, 41, 48999, CAST(N'2020-11-28T12:39:43.377' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (122, 2, 25, 19000, CAST(N'2020-11-28T12:39:43.380' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (123, 2, 26, 16000, CAST(N'2020-11-28T12:39:43.400' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (124, 2, 44, 7222, CAST(N'2020-11-28T12:39:43.403' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (125, 2, 24, 10000, CAST(N'2020-11-28T12:39:43.407' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (126, 2, 34, 100000, CAST(N'2020-11-28T12:39:43.407' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1002, 2, 69, 20000, CAST(N'2021-01-25T09:25:11.150' AS DateTime), CAST(N'2021-01-25T09:26:16.783' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1003, 2, 72, 100000, CAST(N'2021-01-25T09:25:11.400' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1004, 2, 65, 150000, CAST(N'2021-01-25T09:25:11.407' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1005, 2, 70, 78800, CAST(N'2021-01-25T09:25:11.413' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1006, 2, 71, 79999, CAST(N'2021-01-25T09:25:11.420' AS DateTime), CAST(N'2021-01-25T09:27:03.930' AS DateTime), NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1007, 2, 64, 1000000, CAST(N'2021-01-25T09:25:11.423' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1008, 2, 66, 5200, CAST(N'2021-01-25T09:25:11.430' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1009, 2, 73, 75000, CAST(N'2021-01-25T09:25:11.433' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1010, 2, 68, 60000, CAST(N'2021-01-25T09:25:11.440' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1011, 2, 67, 1000, CAST(N'2021-01-25T09:25:11.443' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1012, 3, 1, 714000, CAST(N'2021-01-25T10:22:20.127' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1013, 3, 2, 71400, CAST(N'2021-01-25T10:22:20.137' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1014, 3, 3, 71400, CAST(N'2021-01-25T10:22:20.143' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1015, 3, 4, 71400, CAST(N'2021-01-25T10:22:20.143' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1016, 3, 45, 71400, CAST(N'2021-01-25T10:22:20.147' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1017, 3, 46, 71400, CAST(N'2021-01-25T10:22:20.150' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1018, 3, 5, 71400, CAST(N'2021-01-25T10:22:20.157' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1019, 3, 47, 71400, CAST(N'2021-01-25T10:22:20.160' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1020, 3, 49, 71400, CAST(N'2021-01-25T10:22:20.163' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1021, 3, 48, 71400, CAST(N'2021-01-25T10:22:20.167' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1022, 3, 6, 71400, CAST(N'2021-01-25T10:22:20.170' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1023, 3, 7, 71400, CAST(N'2021-01-25T10:22:20.173' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1024, 3, 50, 71400, CAST(N'2021-01-25T10:22:20.177' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1025, 3, 8, 71400, CAST(N'2021-01-25T10:22:20.180' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1026, 3, 9, 71400, CAST(N'2021-01-25T10:22:20.183' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1027, 3, 10, 71400, CAST(N'2021-01-25T10:22:20.187' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1028, 3, 11, 71400, CAST(N'2021-01-25T10:22:20.190' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1029, 3, 12, 71400, CAST(N'2021-01-25T10:22:20.193' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1030, 3, 13, 71400, CAST(N'2021-01-25T10:22:20.200' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1031, 3, 51, 71400, CAST(N'2021-01-25T10:22:20.203' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1032, 3, 52, 71400, CAST(N'2021-01-25T10:22:20.207' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1033, 3, 53, 71400, CAST(N'2021-01-25T10:22:20.210' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1034, 3, 54, 71400, CAST(N'2021-01-25T10:22:20.213' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1035, 3, 55, 71400, CAST(N'2021-01-25T10:22:20.217' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1036, 3, 56, 71400, CAST(N'2021-01-25T10:22:20.220' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1037, 3, 57, 71400, CAST(N'2021-01-25T10:22:20.223' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1038, 3, 58, 71400, CAST(N'2021-01-25T10:22:20.230' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1039, 3, 59, 71400, CAST(N'2021-01-25T10:22:20.233' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1040, 3, 14, 71400, CAST(N'2021-01-25T10:22:20.237' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1041, 3, 15, 71400, CAST(N'2021-01-25T10:22:20.240' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1042, 3, 16, 71400, CAST(N'2021-01-25T10:22:20.247' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1043, 3, 17, 71400, CAST(N'2021-01-25T10:22:20.250' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1044, 3, 18, 71400, CAST(N'2021-01-25T10:22:20.257' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1045, 3, 19, 71400, CAST(N'2021-01-25T10:22:20.260' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1046, 3, 60, 71400, CAST(N'2021-01-25T10:22:20.263' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1047, 3, 61, 71400, CAST(N'2021-01-25T10:22:20.267' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1048, 3, 62, 71400, CAST(N'2021-01-25T10:22:20.270' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1049, 3, 63, 71400, CAST(N'2021-01-25T10:22:20.273' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1050, 3, 20, 71400, CAST(N'2021-01-25T10:22:20.277' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1051, 3, 69, 78000, CAST(N'2021-01-25T10:22:20.283' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1052, 3, 21, 19250, CAST(N'2021-01-25T10:22:20.283' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1053, 3, 22, 19213.29, CAST(N'2021-01-25T10:22:20.290' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1054, 3, 23, 69937, CAST(N'2021-01-25T10:22:20.293' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1055, 3, 72, 2434234, CAST(N'2021-01-25T10:22:20.297' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1056, 3, 35, 6000, CAST(N'2021-01-25T10:22:20.300' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1057, 3, 42, 13500, CAST(N'2021-01-25T10:22:20.303' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1058, 3, 65, 150000, CAST(N'2021-01-25T10:22:20.307' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1059, 3, 70, 788888, CAST(N'2021-01-25T10:22:20.310' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1060, 3, 71, 80000, CAST(N'2021-01-25T10:22:20.317' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1061, 3, 27, 19000, CAST(N'2021-01-25T10:22:20.320' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1062, 3, 28, 20000, CAST(N'2021-01-25T10:22:20.323' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1063, 3, 29, 18000, CAST(N'2021-01-25T10:22:20.330' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1064, 3, 40, 40000, CAST(N'2021-01-25T10:22:20.333' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1065, 3, 43, 48000, CAST(N'2021-01-25T10:22:20.337' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1066, 3, 64, 1000000, CAST(N'2021-01-25T10:22:20.340' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1067, 3, 66, 5000, CAST(N'2021-01-25T10:22:20.343' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1068, 3, 73, 75000, CAST(N'2021-01-25T10:22:20.350' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1069, 3, 68, 50000, CAST(N'2021-01-25T10:22:20.353' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1070, 3, 30, 17000, CAST(N'2021-01-25T10:22:20.357' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1071, 3, 36, 15000, CAST(N'2021-01-25T10:22:20.360' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1072, 3, 38, 25000, CAST(N'2021-01-25T10:22:20.363' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1073, 3, 31, 49001, CAST(N'2021-01-25T10:22:20.367' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1074, 3, 37, 29000, CAST(N'2021-01-25T10:22:20.370' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1075, 3, 39, 84000, CAST(N'2021-01-25T10:22:20.373' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1076, 3, 32, 23000, CAST(N'2021-01-25T10:22:20.380' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1077, 3, 33, 53000, CAST(N'2021-01-25T10:22:20.383' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1078, 3, 41, 48999, CAST(N'2021-01-25T10:22:20.387' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1079, 3, 25, 19000, CAST(N'2021-01-25T10:22:20.390' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1080, 3, 26, 16000, CAST(N'2021-01-25T10:22:20.393' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1081, 3, 44, 7222, CAST(N'2021-01-25T10:22:20.397' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1082, 3, 67, 89000, CAST(N'2021-01-25T10:22:20.400' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1083, 3, 24, 9500, CAST(N'2021-01-25T10:22:20.407' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1084, 3, 34, 98001, CAST(N'2021-01-25T10:22:20.410' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1085, 2, 74, 150000, CAST(N'2021-01-25T11:29:37.727' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1086, 1, 69, 78000, CAST(N'2021-01-25T12:39:16.473' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1087, 1, 72, 2434234, CAST(N'2021-01-25T12:39:16.487' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1088, 1, 65, 150000, CAST(N'2021-01-25T12:39:16.493' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1089, 1, 70, 788888, CAST(N'2021-01-25T12:39:16.503' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1090, 1, 71, 80000, CAST(N'2021-01-25T12:39:16.513' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1091, 1, 64, 1000000, CAST(N'2021-01-25T12:39:16.523' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1092, 1, 66, 5000, CAST(N'2021-01-25T12:39:16.533' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1093, 1, 73, 75000, CAST(N'2021-01-25T12:39:16.540' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1094, 1, 68, 50000, CAST(N'2021-01-25T12:39:16.550' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1095, 1, 67, 89000, CAST(N'2021-01-25T12:39:16.553' AS DateTime), NULL, NULL)
INSERT [dbo].[PricesByDealer] ([pbd_id], [deal_id], [mi_id], [mi_referencePrice], [pbd_registrationDate], [pbd_updateDate], [pbd_deleteDate]) VALUES (1096, 1, 74, 150000, CAST(N'2021-01-25T12:39:16.560' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PricesByDealer] OFF
SET IDENTITY_INSERT [dbo].[RulesByMovement] ON 

INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (1, 1, 1, 1, 1, 5, NULL, NULL, CAST(N'2020-12-06T19:23:56.460' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (2, 1, 2, 3, 1, 5, NULL, NULL, CAST(N'2020-12-06T19:23:56.460' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (3, 2, 1, 1, 1, 1, 2, 5, CAST(N'2020-12-07T11:37:31.553' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (4, 2, 2, 3, 1, 3, 2, 5, CAST(N'2020-12-07T11:37:31.553' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (5, 3, 1, 1, 1, 5, NULL, NULL, CAST(N'2020-12-07T12:01:08.337' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (6, 3, 2, 3, 1, 5, NULL, NULL, CAST(N'2020-12-07T12:01:08.337' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (7, 3, 3, 2, 1, 5, NULL, NULL, CAST(N'2020-12-07T12:02:27.830' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (8, 3, 4, 4, 1, 5, NULL, NULL, CAST(N'2020-12-07T12:02:27.830' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (9, 4, 1, 3, 1, 3, 3, 5, CAST(N'2020-12-07T12:09:16.843' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (10, 4, 2, 4, 1, 4, 2, 5, CAST(N'2020-12-07T12:09:16.843' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (11, 8, 1, 4, 1, 4, 3, 5, CAST(N'2020-12-07T12:36:10.313' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (12, 8, 2, 2, 1, 2, 2, 5, CAST(N'2020-12-07T12:36:10.313' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (13, 6, 1, 4, 1, 4, 3, 5, CAST(N'2020-12-07T12:55:51.953' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (14, 6, 2, 3, 1, 3, 2, 5, CAST(N'2020-12-07T12:55:51.953' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (15, 7, 1, 2, 1, 2, 3, 5, CAST(N'2020-12-07T13:18:58.987' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (16, 7, 2, 3, 1, 3, 2, 5, CAST(N'2020-12-07T13:18:58.987' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (17, 9, 1, 4, 1, 4, 3, 5, CAST(N'2021-03-04T16:05:35.610' AS DateTime), NULL, NULL)
INSERT [dbo].[RulesByMovement] ([rlm_id], [m_id], [rlm_order], [rlm_field_1], [rlm_op_1], [rlm_field_2], [rlm_op_2], [rlm_field_3], [rlm_registrationDate], [rlm_updateDate], [rlm_deleteDate]) VALUES (18, 9, 2, 3, 1, 3, 2, 5, CAST(N'2021-03-04T16:05:35.610' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RulesByMovement] OFF
SET IDENTITY_INSERT [dbo].[Taxes] ON 

INSERT [dbo].[Taxes] ([tax_id], [tax_name], [tax_desccription], [tax_percentValue], [tax_state], [tax_registrationDate], [tax_updateDate], [tax_deleteDate]) VALUES (1, N'IVA 19%', NULL, 19, 1, CAST(N'2021-01-20T19:03:11.987' AS DateTime), NULL, NULL)
INSERT [dbo].[Taxes] ([tax_id], [tax_name], [tax_desccription], [tax_percentValue], [tax_state], [tax_registrationDate], [tax_updateDate], [tax_deleteDate]) VALUES (2, N'Impuesto al consumo 8%', NULL, 8, 1, CAST(N'2021-01-20T22:58:16.860' AS DateTime), NULL, NULL)
INSERT [dbo].[Taxes] ([tax_id], [tax_name], [tax_desccription], [tax_percentValue], [tax_state], [tax_registrationDate], [tax_updateDate], [tax_deleteDate]) VALUES (3, N'Impuesto al consumo 16%', NULL, 16, 1, CAST(N'2021-01-20T22:58:16.860' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Taxes] OFF
SET IDENTITY_INSERT [dbo].[TaxesByMaintenanceItem] ON 

INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (4, 1, 4, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (5, 1, 5, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (6, 1, 6, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (7, 1, 7, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (8, 1, 8, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (10, 1, 10, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (11, 1, 11, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (12, 1, 12, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (13, 1, 13, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (14, 1, 14, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (15, 1, 15, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (16, 1, 16, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (17, 1, 17, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (18, 1, 18, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (19, 1, 19, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (20, 1, 20, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (21, 1, 21, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (22, 1, 22, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (23, 1, 23, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (24, 1, 24, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (25, 1, 25, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (26, 1, 26, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (27, 1, 27, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (28, 1, 28, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (29, 1, 29, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (30, 1, 30, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (31, 1, 31, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (32, 1, 32, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (33, 1, 33, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (34, 1, 34, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (35, 1, 35, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (36, 1, 36, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (37, 1, 37, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (38, 1, 38, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (39, 1, 39, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (40, 1, 40, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (41, 1, 41, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (42, 1, 42, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (43, 1, 43, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (44, 1, 44, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (45, 1, 45, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (46, 1, 46, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (47, 1, 47, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (48, 1, 48, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (50, 1, 50, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (51, 1, 51, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (52, 1, 52, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (53, 1, 53, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (54, 1, 54, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (55, 1, 55, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (56, 1, 56, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (57, 1, 57, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (58, 1, 58, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (59, 1, 59, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (60, 1, 60, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (61, 1, 61, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (62, 1, 62, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (63, 1, 63, CAST(N'2021-01-21T11:52:41.590' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (78, 1, 9, CAST(N'2021-01-21T12:52:41.947' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (80, 1, 66, CAST(N'2021-01-21T14:37:45.797' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (81, 2, 66, CAST(N'2021-01-21T14:37:45.803' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (82, 3, 66, CAST(N'2021-01-21T14:37:45.810' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (89, 1, 67, CAST(N'2021-01-21T19:48:09.373' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (96, 1, 3, CAST(N'2021-01-21T20:34:03.923' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (102, 2, 64, CAST(N'2021-01-21T20:34:59.087' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (103, 1, 68, CAST(N'2021-01-21T20:38:38.527' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (104, 1, 2, CAST(N'2021-01-21T20:40:12.073' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (107, 1, 70, CAST(N'2021-01-21T21:56:24.077' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (111, 1, 71, CAST(N'2021-01-21T22:07:24.243' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (117, 1, 49, CAST(N'2021-01-21T22:19:31.930' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (120, 1, 1, CAST(N'2021-01-22T11:10:36.447' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (121, 1, 69, CAST(N'2021-01-23T21:01:14.527' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (122, 1, 73, CAST(N'2021-01-24T11:37:43.197' AS DateTime))
INSERT [dbo].[TaxesByMaintenanceItem] ([txmi_id], [tax_id], [mi_id], [txmi_registrationDate]) VALUES (123, 1, 74, CAST(N'2021-01-25T11:25:32.033' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaxesByMaintenanceItem] OFF
SET IDENTITY_INSERT [dbo].[transactionState] ON 

INSERT [dbo].[transactionState] ([trxst_id], [trxst_name], [trxst_description], [trxst_state], [trxst_registrationDate], [trxst_updateDate], [trxst_deleteDate]) VALUES (1, N'APROBADA', N'ES CUANDO LA TRANSACCIÓN HA SIDO APROBADA POR UN USUARIO AUTORIZADO', 1, CAST(N'2020-12-07T18:42:20.753' AS DateTime), NULL, NULL)
INSERT [dbo].[transactionState] ([trxst_id], [trxst_name], [trxst_description], [trxst_state], [trxst_registrationDate], [trxst_updateDate], [trxst_deleteDate]) VALUES (2, N'RECHAZADA', N'ES CUANDO LA TRANSACCIÓN HA SIDO RECHAZADA POR UN USUARIO AUTORIZADO', 1, CAST(N'2020-12-07T18:42:20.753' AS DateTime), NULL, NULL)
INSERT [dbo].[transactionState] ([trxst_id], [trxst_name], [trxst_description], [trxst_state], [trxst_registrationDate], [trxst_updateDate], [trxst_deleteDate]) VALUES (3, N'ANULADA', N'ES CUANDO LA TRANSACCIÓN HA SIDO ANULADA POR UN USUARIO AUTORIZADO', 1, CAST(N'2020-12-07T18:42:20.753' AS DateTime), NULL, NULL)
INSERT [dbo].[transactionState] ([trxst_id], [trxst_name], [trxst_description], [trxst_state], [trxst_registrationDate], [trxst_updateDate], [trxst_deleteDate]) VALUES (4, N'FINALIZADA', N'ES CUÁNDO ESTA TRANSACCIÓN FUE COMPLETADA EN SU TOTALIDAD POR EL CONCESIONARIO', 1, CAST(N'2021-03-04T16:37:06.090' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[transactionState] OFF
SET IDENTITY_INSERT [dbo].[TypeOfMaintenanceItem] ON 

INSERT [dbo].[TypeOfMaintenanceItem] ([tmi_id], [tmi_name], [tmi_state], [tmi_registrationDate], [tmi_updateDate], [tmi_DeleteDate]) VALUES (1, N'REPUESTO', 1, CAST(N'2020-11-06T12:15:25.960' AS DateTime), NULL, NULL)
INSERT [dbo].[TypeOfMaintenanceItem] ([tmi_id], [tmi_name], [tmi_state], [tmi_registrationDate], [tmi_updateDate], [tmi_DeleteDate]) VALUES (2, N'MANO DE OBRA', 1, CAST(N'2020-11-06T12:15:25.960' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TypeOfMaintenanceItem] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (2, N'William', N'Forero', N'wforero', N'Renting2020', 1, NULL, NULL, NULL)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (3, N'LAURA', N'GALINDO', N'l.galindo', N'Renting2020', 4, NULL, NULL, 1)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (4, N'PAULA', N'TORRES', N'p.torres', N'Renting2020', 4, NULL, NULL, 1)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (11, N'autoniza', N'', N'autoniza', N'1234', 3, NULL, 1, NULL)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (12, N'autogrande', N'', N'autogrande', N'1234', 3, NULL, 2, NULL)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (13, N'san jorge', N'', N'san jorge', N'1234', 3, NULL, 3, NULL)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (1011, N'renting', N'renting', N'renting', N'1234', 4, NULL, NULL, 1)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (1012, N'nokia', N'', N'nokia', N'1234', 2, 1, NULL, NULL)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (2011, N'brinsa', N'', N'brinsa', N'1234', 2, 1001, NULL, NULL)
INSERT [dbo].[Users] ([usr_id], [usr_firstName], [usr_lastName], [usr_name], [usr_password], [grp_id], [cli_id], [deal_id], [cpn_id]) VALUES (2012, N'saves', N'', N'saves', N'1234', 2, 1002, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1, N'ABC123', N'0104070205AF', 31, N'2020', 20000, 1, 1, CAST(N'2021-03-15T10:20:56.547' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
SET IDENTITY_INSERT [dbo].[VehicleBrand] ON 

INSERT [dbo].[VehicleBrand] ([vb_id], [vb_name], [vb_state], [vb_registrationDate], [vb_updateDate], [vb_deleteDate]) VALUES (1, N'CHEVROLET', 1, CAST(N'2020-11-03T18:36:04.993' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[VehicleBrand] OFF
SET IDENTITY_INSERT [dbo].[VehicleModel] ON 

INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1, N'DMAX RT 95 4X2', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (2, N'DMAX RT 95 4X4', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (3, N'CRUZE 1.4 TURBO', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (4, N'TRACKER TM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (5, N'TRACKER TA', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (6, N'TRACKER AWD', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (7, N'ONIX TM MCM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (8, N'ONIX TA MCM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (9, N'COLORADO TA', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (10, N'COLORADO TM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (11, N'TRAIL BLAZER MCM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (12, N'TRAIL BLAZER GAS', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (13, N'CAMARO NG', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (14, N'TAHOE', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (15, N'TRAVERSE NG', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (16, N'BLAZER', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (17, N'SPARK', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (18, N'SPARK GT', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (19, N'BEAT', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (20, N'N300', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (21, N'SAIL', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (22, N'SONIC TM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (23, N'SONIC TA', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (24, N'CAPTIVA 2.4', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (25, N'CAPTIVA 3.0', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (26, N'COBALT TM', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (27, N'COBALT TA', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (28, N'NHR EIV (ABS)', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (29, N'NKR MWB EIV (ABS)', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (30, N'NPS 4x4 EIV (ABS)', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (31, N'EQUINOX LS/LT', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (32, N'EQUINOX PREMIER', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (33, N'NEW CAPTIVA 1.5 TA', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (34, N'ONIX 1.0 TURBO TA', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (35, N'ONIX 1.0 TURBO TM', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (36, N'ONIX 1.2 TURBO TA', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (37, N'NPR EIV (ABS)', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (38, N'NQR EIV (ABS)', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (39, N'FRR EIV', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (40, N'FTR EIV', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (41, N'FVR EIV', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (42, N'FVZ EIV', NULL, 1, CAST(N'2020-11-26T20:44:39.413' AS DateTime), NULL, NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[VehicleModel] OFF
SET IDENTITY_INSERT [dbo].[VehicleModelsByContract] ON 

INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1009, 31, 1, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1010, 32, 1, NULL)
SET IDENTITY_INSERT [dbo].[VehicleModelsByContract] OFF
SET IDENTITY_INSERT [dbo].[VehiclesByContract] ON 

INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1005, 1, 1)
SET IDENTITY_INSERT [dbo].[VehiclesByContract] OFF
SET IDENTITY_INSERT [dbo].[vehicleState] ON 

INSERT [dbo].[vehicleState] ([vs_id], [vs_name], [vs_state], [vs_registrationDate], [vs_updateDate], [vs_deleteDate]) VALUES (1, N'ACTIVO', 1, CAST(N'2020-11-03T21:26:42.087' AS DateTime), NULL, NULL)
INSERT [dbo].[vehicleState] ([vs_id], [vs_name], [vs_state], [vs_registrationDate], [vs_updateDate], [vs_deleteDate]) VALUES (2, N'INACTIVO', 1, CAST(N'2020-11-03T21:26:42.087' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[vehicleState] OFF
SET IDENTITY_INSERT [dbo].[VehicleType] ON 

INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (1, N'Automóvil', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (2, N'Camioneta', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (3, N'Carga', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (4, N'Pasajeros', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[VehicleType] OFF
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
ALTER TABLE [dbo].[FieldsToOperate] ADD  DEFAULT ((1)) FOR [fto_state]
GO
ALTER TABLE [dbo].[FieldsToOperate] ADD  DEFAULT (getdate()) FOR [fto_registrationDate]
GO
ALTER TABLE [dbo].[FinancialInformationByClient] ADD  DEFAULT ((1)) FOR [ficl_state]
GO
ALTER TABLE [dbo].[FinancialInformationByClient] ADD  DEFAULT (getdate()) FOR [ficl_registrationDate]
GO
ALTER TABLE [dbo].[frequency] ADD  DEFAULT ((1)) FOR [fq_state]
GO
ALTER TABLE [dbo].[frequency] ADD  DEFAULT (getdate()) FOR [fq_registrationDate]
GO
ALTER TABLE [dbo].[ItemsByRoutines] ADD  DEFAULT (getdate()) FOR [ibr_registrationDate]
GO
ALTER TABLE [dbo].[JobTitlesClient] ADD  DEFAULT ((1)) FOR [jtcl_state]
GO
ALTER TABLE [dbo].[LOG_TRX] ADD  DEFAULT (getdate()) FOR [ltrx_registrationDate]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT ((1)) FOR [mi_state]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT (getdate()) FOR [mi_registrationDate]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT (getdate()) FOR [mi_updateDate]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT (getdate()) FOR [mi_deleteDate]
GO
ALTER TABLE [dbo].[MaintenanceItem] ADD  DEFAULT ((1)) FOR [mi_handleTax]
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
ALTER TABLE [dbo].[Movement] ADD  DEFAULT ((1)) FOR [m_state]
GO
ALTER TABLE [dbo].[Movement] ADD  DEFAULT (getdate()) FOR [m_registrationDate]
GO
ALTER TABLE [dbo].[MovementType] ADD  DEFAULT (getdate()) FOR [mtp_registrationDate]
GO
ALTER TABLE [dbo].[observationsByTransaction] ADD  DEFAULT ((1)) FOR [obstrx_state]
GO
ALTER TABLE [dbo].[observationsByTransaction] ADD  DEFAULT (getdate()) FOR [obstrx_registrationDate]
GO
ALTER TABLE [dbo].[Operations] ADD  DEFAULT ((1)) FOR [op_state]
GO
ALTER TABLE [dbo].[Operations] ADD  DEFAULT (getdate()) FOR [op_registrationDate]
GO
ALTER TABLE [dbo].[PresentationUnit] ADD  DEFAULT ((1)) FOR [pu_state]
GO
ALTER TABLE [dbo].[PresentationUnit] ADD  DEFAULT (getdate()) FOR [pu_registrationDate]
GO
ALTER TABLE [dbo].[PricesByContract] ADD  DEFAULT (getdate()) FOR [pbc_registrationDate]
GO
ALTER TABLE [dbo].[PricesByDealer] ADD  DEFAULT (getdate()) FOR [pbd_registrationDate]
GO
ALTER TABLE [dbo].[RulesByMovement] ADD  DEFAULT (getdate()) FOR [rlm_registrationDate]
GO
ALTER TABLE [dbo].[Taxes] ADD  DEFAULT ((1)) FOR [tax_state]
GO
ALTER TABLE [dbo].[Taxes] ADD  DEFAULT (getdate()) FOR [tax_registrationDate]
GO
ALTER TABLE [dbo].[TaxesByMaintenanceItem] ADD  DEFAULT (getdate()) FOR [txmi_registrationDate]
GO
ALTER TABLE [dbo].[transactionItems] ADD  DEFAULT ((0)) FOR [mi_valueWithoutDiscount]
GO
ALTER TABLE [dbo].[transactionItems] ADD  DEFAULT ((0)) FOR [mi_discountValue]
GO
ALTER TABLE [dbo].[transactionItems] ADD  DEFAULT ((0)) FOR [mi_valueWithDiscountWithoutTaxes]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT ((1)) FOR [trx_state]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT (getdate()) FOR [trx_registrationDate]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT ((0)) FOR [trx_valueWithoutDiscount]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT ((0)) FOR [trx_discountValue]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT ((0)) FOR [trx_valueWithDiscountWithoutTaxes]
GO
ALTER TABLE [dbo].[transactionState] ADD  DEFAULT ((1)) FOR [trxst_state]
GO
ALTER TABLE [dbo].[transactionState] ADD  DEFAULT (getdate()) FOR [trxst_registrationDate]
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
ALTER TABLE [dbo].[FinancialInformationByClient]  WITH CHECK ADD FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([act_id])
REFERENCES [dbo].[Actions] ([act_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([act_id])
REFERENCES [dbo].[Actions] ([act_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([act_id])
REFERENCES [dbo].[Actions] ([act_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([grp_id])
REFERENCES [dbo].[Groups] ([grp_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([grp_id])
REFERENCES [dbo].[Groups] ([grp_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([grp_id])
REFERENCES [dbo].[Groups] ([grp_id])
GO
ALTER TABLE [dbo].[GroupModuleAction]  WITH CHECK ADD FOREIGN KEY([mdl_id])
REFERENCES [dbo].[Modules] ([mdl_id])
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
ALTER TABLE [dbo].[LOG_TRX]  WITH CHECK ADD FOREIGN KEY([trx_id])
REFERENCES [dbo].[transactions] ([trx_id])
GO
ALTER TABLE [dbo].[MaintenanceItem]  WITH CHECK ADD FOREIGN KEY([pu_id])
REFERENCES [dbo].[PresentationUnit] ([pu_id])
GO
ALTER TABLE [dbo].[MaintenanceItem]  WITH CHECK ADD FOREIGN KEY([tmi_id])
REFERENCES [dbo].[TypeOfMaintenanceItem] ([tmi_id])
GO
ALTER TABLE [dbo].[MaintenanceItem]  WITH CHECK ADD  CONSTRAINT [fk_maintenanceItem_dealer] FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[MaintenanceItem] CHECK CONSTRAINT [fk_maintenanceItem_dealer]
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
ALTER TABLE [dbo].[Movement]  WITH CHECK ADD FOREIGN KEY([mtp_id])
REFERENCES [dbo].[MovementType] ([mtp_id])
GO
ALTER TABLE [dbo].[observationsByTransaction]  WITH CHECK ADD FOREIGN KEY([trx_id])
REFERENCES [dbo].[transactions] ([trx_id])
GO
ALTER TABLE [dbo].[observationsByTransaction]  WITH CHECK ADD  CONSTRAINT [FK_observations_users] FOREIGN KEY([usr_id])
REFERENCES [dbo].[Users] ([usr_id])
GO
ALTER TABLE [dbo].[observationsByTransaction] CHECK CONSTRAINT [FK_observations_users]
GO
ALTER TABLE [dbo].[PricesByContract]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[PricesByContract]  WITH CHECK ADD FOREIGN KEY([cntr_id])
REFERENCES [dbo].[Contract] ([cntr_id])
GO
ALTER TABLE [dbo].[PricesByDealer]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[PricesByDealer]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[RulesByMovement]  WITH CHECK ADD FOREIGN KEY([rlm_field_1])
REFERENCES [dbo].[FieldsToOperate] ([fto_id])
GO
ALTER TABLE [dbo].[RulesByMovement]  WITH CHECK ADD FOREIGN KEY([rlm_field_2])
REFERENCES [dbo].[FieldsToOperate] ([fto_id])
GO
ALTER TABLE [dbo].[RulesByMovement]  WITH CHECK ADD FOREIGN KEY([rlm_field_3])
REFERENCES [dbo].[FieldsToOperate] ([fto_id])
GO
ALTER TABLE [dbo].[RulesByMovement]  WITH CHECK ADD FOREIGN KEY([rlm_op_1])
REFERENCES [dbo].[Operations] ([op_id])
GO
ALTER TABLE [dbo].[RulesByMovement]  WITH CHECK ADD FOREIGN KEY([rlm_op_2])
REFERENCES [dbo].[Operations] ([op_id])
GO
ALTER TABLE [dbo].[RulesByMovement]  WITH CHECK ADD FOREIGN KEY([m_id])
REFERENCES [dbo].[Movement] ([m_id])
GO
ALTER TABLE [dbo].[TaxesByMaintenanceItem]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[TaxesByMaintenanceItem]  WITH CHECK ADD FOREIGN KEY([tax_id])
REFERENCES [dbo].[Taxes] ([tax_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD FOREIGN KEY([bra_id])
REFERENCES [dbo].[branch] ([bra_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD FOREIGN KEY([cntr_id])
REFERENCES [dbo].[Contract] ([cntr_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD FOREIGN KEY([deal_id])
REFERENCES [dbo].[Dealer] ([deal_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD FOREIGN KEY([mr_id])
REFERENCES [dbo].[maintenanceRoutine] ([mr_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD FOREIGN KEY([trx_id])
REFERENCES [dbo].[transactions] ([trx_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD FOREIGN KEY([veh_id])
REFERENCES [dbo].[Vehicle] ([veh_id])
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD  CONSTRAINT [fk_trx_relation_id] FOREIGN KEY([trx_relation_id])
REFERENCES [dbo].[transactions] ([trx_id])
GO
ALTER TABLE [dbo].[transactionDetail] CHECK CONSTRAINT [fk_trx_relation_id]
GO
ALTER TABLE [dbo].[transactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_USU_ENDDING] FOREIGN KEY([usu_ending])
REFERENCES [dbo].[Users] ([usr_id])
GO
ALTER TABLE [dbo].[transactionDetail] CHECK CONSTRAINT [FK_USU_ENDDING]
GO
ALTER TABLE [dbo].[transactionItems]  WITH CHECK ADD FOREIGN KEY([mi_id])
REFERENCES [dbo].[MaintenanceItem] ([mi_id])
GO
ALTER TABLE [dbo].[transactionItems]  WITH CHECK ADD FOREIGN KEY([trx_id])
REFERENCES [dbo].[transactions] ([trx_id])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([trxst_id])
REFERENCES [dbo].[transactionState] ([trxst_id])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD FOREIGN KEY([m_id])
REFERENCES [dbo].[Movement] ([m_id])
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [fk_transactions_client] FOREIGN KEY([cli_id])
REFERENCES [dbo].[Client] ([cli_id])
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [fk_transactions_client]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([cpn_id])
REFERENCES [dbo].[Company] ([cpn_id])
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
/****** Object:  StoredProcedure [dbo].[STRPRC_CREATE_FINANCIAL_INFORMATION]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_CREATE_FINANCIAL_INFORMATION]
	@CLIENT_ID INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO FinancialInformationByClient (cli_id, ficl_approvedQuota,ficl_consumedQuota,ficl_inTransitQuota,ficl_currentQuota)
			VALUES (@CLIENT_ID,0,0,0,0)
		COMMIT TRAN
	END TRY 
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT ERROR_MESSAGE()
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[STRPRC_CREATE_LOG_TRANSACTION]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_CREATE_LOG_TRANSACTION]
	@TRX_ID INT,
	@APPROVED_QUOTA FLOAT(53),
	@CONSUMED_QUOTA FLOAT(53),
	@CURRENT_QUOTA FLOAT(53),
	@IN_TRANSIT_QUOTA FLOAT(53)
AS
BEGIN
	BEGIN TRY	
		BEGIN TRAN
			INSERT INTO LOG_TRX (trx_id,ltrx_initApprovedQuota,	ltrx_initConsumedQuota,ltrx_initCurrentQuota, ltrx_initInTransitQuota)
			VALUES (@TRX_ID, @APPROVED_QUOTA,@CONSUMED_QUOTA,@CURRENT_QUOTA,@IN_TRANSIT_QUOTA)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_AMOUNT_WORKORDERS_BY_CLIENT_AND_MONTH]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_AMOUNT_WORKORDERS_BY_CLIENT_AND_MONTH]
	@CLIENT_ID INT = NULL,
	@DEALER_ID INT = NULL ,
	@INI_DATE DATETIME = NULL ,
	@END_DATE DATETIME = NULL  

AS
BEGIN
 
 DECLARE @ROW_ACTIVE INT = 1  
 DECLARE @ORDEN_DE_TRABAJO INT = 4  
 DECLARE @STATE_FINISHED INT = 4  
  
 SET @END_DATE = ISNULL(@END_DATE,GETDATE())  
 SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -365, @END_DATE))  
  
	SELECT   
	cl.cli_name as Cliente,
	CASE   
	WHEN MONTH(trx.trx_registrationDate) = 1 THEN 'ENERO'  
	WHEN MONTH(trx.trx_registrationDate) = 2 THEN 'FEBRERO'  
	WHEN MONTH(trx.trx_registrationDate) = 3 THEN 'MARZO'  
	WHEN MONTH(trx.trx_registrationDate) = 4 THEN 'ABRIL'  
	WHEN MONTH(trx.trx_registrationDate) = 5 THEN 'MAYO'  
	WHEN MONTH(trx.trx_registrationDate) = 6 THEN 'JUNIO'  
	WHEN MONTH(trx.trx_registrationDate) = 7 THEN 'JULIO'  
	WHEN MONTH(trx.trx_registrationDate) = 8 THEN 'AGOSTO'  
	WHEN MONTH(trx.trx_registrationDate) = 9 THEN 'SEPTIEMBRE'  
	WHEN MONTH(trx.trx_registrationDate) = 10 THEN 'OCTUBRE'  
	WHEN MONTH(trx.trx_registrationDate) = 11 THEN 'NOVIEMBRE'  
	WHEN MONTH(trx.trx_registrationDate) = 12 THEN 'DICIEMBRE'  
	END AS Mes,  
	YEAR(trx.trx_registrationDate) as Anio,
	COUNT(*) as Cantidad
	FROM transactions trx  
	INNER JOIN transactionDetail td  
	ON td.trx_id = trx.trx_id  
	INNER JOIN Client cl
	ON cl.cli_id = trx.cli_id
	WHERE trx.trx_state = @ROW_ACTIVE  
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)  
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)   
	AND trx.m_id = @ORDEN_DE_TRABAJO  
	AND trx.trxst_id = @STATE_FINISHED  
	AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE  
	GROUP BY  MONTH(trx.trx_registrationDate), YEAR(trx.trx_registrationDate), cl.cli_id  , cl.cli_name
	ORDER BY YEAR(trx.trx_registrationDate),MONTH(trx.trx_registrationDate) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_AMOUNT_WORKORDERS_BY_DEALER_AND_MONTH]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_AMOUNT_WORKORDERS_BY_DEALER_AND_MONTH]
	 @CLIENT_ID INT = NULL,
	 @DEALER_ID INT = NULL ,
	 @INI_DATE DATETIME = NULL ,
	 @END_DATE DATETIME = NULL  
AS
BEGIN

 
 DECLARE @ROW_ACTIVE INT = 1  
 DECLARE @ORDEN_DE_TRABAJO INT = 4  
 DECLARE @STATE_FINISHED INT = 4  
  
 SET @END_DATE = ISNULL(@END_DATE,GETDATE())  
 SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -365, @END_DATE))  
  
	SELECT   
		dl.deal_name as Concesionario,
	CASE   
	WHEN MONTH(trx.trx_registrationDate) = 1 THEN 'ENERO'  
	WHEN MONTH(trx.trx_registrationDate) = 2 THEN 'FEBRERO'  
	WHEN MONTH(trx.trx_registrationDate) = 3 THEN 'MARZO'  
	WHEN MONTH(trx.trx_registrationDate) = 4 THEN 'ABRIL'  
	WHEN MONTH(trx.trx_registrationDate) = 5 THEN 'MAYO'  
	WHEN MONTH(trx.trx_registrationDate) = 6 THEN 'JUNIO'  
	WHEN MONTH(trx.trx_registrationDate) = 7 THEN 'JULIO'  
	WHEN MONTH(trx.trx_registrationDate) = 8 THEN 'AGOSTO'  
	WHEN MONTH(trx.trx_registrationDate) = 9 THEN 'SEPTIEMBRE'  
	WHEN MONTH(trx.trx_registrationDate) = 10 THEN 'OCTUBRE'  
	WHEN MONTH(trx.trx_registrationDate) = 11 THEN 'NOVIEMBRE'  
	WHEN MONTH(trx.trx_registrationDate) = 12 THEN 'DICIEMBRE'  
	END AS Mes,  
	YEAR(trx.trx_registrationDate) as Anio,
	COUNT(*) as Cantidad
	FROM transactions trx  
	INNER JOIN transactionDetail td  
	ON td.trx_id = trx.trx_id  
	INNER JOIN Dealer dl
		ON td.deal_id = dl.deal_id
	WHERE trx.trx_state = @ROW_ACTIVE  
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)  
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)   
	AND trx.m_id = @ORDEN_DE_TRABAJO  
	AND trx.trxst_id = @STATE_FINISHED  
	AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE  
	GROUP BY  MONTH(trx.trx_registrationDate), YEAR(trx.trx_registrationDate),dl.deal_id, dl.deal_name
	ORDER BY YEAR(trx.trx_registrationDate),MONTH(trx.trx_registrationDate) ASC

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_CLIENTS_WITHOUT_QUOTA]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_CLIENTS_WITHOUT_QUOTA]
AS 
BEGIN
	SELECT cl.* 
	FROM Client cl
	LEFT JOIN financialInformationByClient fi 
		ON cl.cli_id = fi.cli_id
	WHERE fi.cli_id IS NULL
	AND cl.cli_state = 1
END




GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_COUNT_TOTAL_WORKORDER_BY_DEALER_AND_CLIENT]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_COUNT_TOTAL_WORKORDER_BY_DEALER_AND_CLIENT]
	@DEALER_ID INT = NULL,
	@CLIENT_ID INT = NULL,
	@INIT_DATE DATETIME = NULL,
	@END_DATE DATETIME = NULL
AS
BEGIN
	/*
		Autor: William Forero
		Fecha: 2021/02/15
		Descripción: 
			Este SP extrae la información del total de las ordendes de trabajo por estado
	*/
	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @ACTIVO INT = 1
	SET @INIT_DATE = ISNULL(@INIT_DATE,DATEADD(DAY,-30,GETDATE()))
	SET @END_DATE = ISNULL(@END_DATE,GETDATE())	 

	SELECT COUNT(*) as Cantidad, ISNULL(ts.trxst_name,'PENDIENTE') AS Estado
	FROM transactions trx
	INNER JOIN transactionDetail td
		ON td.trx_id = trx.trx_id
	FULL JOIN transactionState ts
		ON ts.trxst_id = trx.trxst_id
	WHERE trx.m_id = @ORDEN_DE_TRABAJO
	AND trx.trx_state = @ACTIVO
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)
	AND trx.trx_registrationDate BETWEEN @INIT_DATE AND @END_DATE
	GROUP BY trx.trxst_id, ts.trxst_name
	ORDER BY Estado ASC
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_FINANCIAL_INFORMATION_BY_CLIENT]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_FINANCIAL_INFORMATION_BY_CLIENT]
AS
BEGIN
	SELECT CL.cli_id,CL.cli_document,CL.cli_name,CL.cli_phone,CL.cli_cellphone,CL.cli_website,CL.cty_id,
			FCL.ficl_approvedQuota,FCL.ficl_currentQuota,FCL.ficl_consumedQuota,FCL.ficl_inTransitQuota
	FROM FinancialInformationByClient FCL
	INNER JOIN Client CL 
		ON FCL.cli_id = CL.cli_id 		
	WHERE FCL.ficl_state = 1
	AND CL.cli_state = 1
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_TRANSACTIONS_BY_CLIENT]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_TRANSACTIONS_BY_CLIENT]
@CLIENT_ID INT

AS 
BEGIN
	DECLARE @STATE_ACTIVE INT = 1

	SELECT TOP 100 TR.trx_id,TR.trx_consecutive,TR.m_id,MV.m_name,TR.trxst_id, TS.trxst_name,
	TR.trx_registrationDate,TR.usu_id,TR.trx_value,TD.deal_id, DL.deal_name, TD.bra_id, BR.bra_name,
	LG.ltrx_initCurrentQuota,LG.ltrx_initConsumedQuota,ltrx_initInTransitQuota,
	LG.ltrx_endCurrentQuota,Lg.ltrx_endConsumedQuota,LG.ltrx_endInTransitQuota  
	FROM transactions TR
	LEFT JOIN transactionDetail TD
		ON TD.trx_id = TR.trx_id
	LEFT JOIN transactionState TS
		ON TS.trxst_id = TR.trxst_id
	INNER JOIN Movement MV
		ON TR.m_id = MV.m_id
	LEFT JOIN  Dealer DL
		ON DL.deal_id = TD.deal_id
	LEFT JOIN branch BR
		ON BR.bra_id = TD.bra_id
	INNER JOIN LOG_TRX LG
		ON LG.trx_id = TR.trx_id
	WHERE TR.cli_id = @CLIENT_ID
	AND TR.trx_state = @STATE_ACTIVE
	ORDER BY TR.trx_registrationDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_TRANSACTIONS_BY_CLIENT_OR_DEALER]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
CREATE PROCEDURE [dbo].[STRPRC_GET_TRANSACTIONS_BY_CLIENT_OR_DEALER]
	 @DEALER_ID INT = NULL,
	 @CLIENT_ID INT = NULL,
	 @INI_DATE DATETIME = NULL,
	 @END_DATE DATETIME = NULL,
	 @CODE VARCHAR(10) = NULL,
	 @LICENSE_PLATE VARCHAR(10) = NULL,
	 @STATE_WORK_ORDER INT = NULL

AS
BEGIN

	SET @END_DATE = ISNULL(@END_DATE,GETDATE())
	SET @END_DATE = CONCAT(CONVERT(VARCHAR(30),@END_DATE,111),' 23:59:59')

	SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -365, @END_DATE))  
	SET @INI_DATE = CONCAT(CONVERT(VARCHAR(30),@INI_DATE,111),' 00:00:00')

	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @STATE_ACTIVE INT = 1
	DECLARE @TBL_WORK_OREDERS AS TABLE(
		trx_id INT,
		trx_consecutive INT,
		veh_id INT,
		veh_licensePlate VARCHAR(10),
		vm_id INT,
		vm_shortName VARCHAR(500),
		cli_id INT,
		cli_name VARCHAR(500),
		mr_id INT,
		mr_name VARCHAR(500),
		bra_id INT,
		bra_name VARCHAR(500),
		trxst_id INT,
		trxst_name VARCHAR(500),
		trx_registrationDate DATETIME,
		trx_value FLOAT,
		trx_code VARCHAR(10)
	
	)

	INSERT INTO @TBL_WORK_OREDERS
	SELECT TOP 100 TR.trx_id,TR.trx_consecutive,VH.veh_id, VH.veh_licensePlate,VH.vm_id,
	VM.vm_shortName,TR.cli_id,CL.cli_name,TD.mr_id, MR.mr_name,TD.bra_id,BR.bra_name,
	CASE 
		WHEN TR.trxst_id IS NULL THEN 0
		ELSE tr.trxst_id
	END trxst_id,
	CASE 
		WHEN TS.trxst_name IS NULL THEN 'PENDIENTE'
		ELSE TS.trxst_name
	END trxst_name,
	 TR.trx_registrationDate,
		TR.trx_value, TR.trx_code
	FROM transactions TR
	INNER JOIN transactionDetail TD
		ON TR.trx_id = TD.trx_id	
	INNER JOIN Vehicle VH
		ON VH.veh_id = TD.veh_id
	INNER JOIN VehicleModel VM
		ON VH.vm_id = VM.vm_id
	INNER JOIN Client CL
		ON CL.cli_id = TR.cli_id
	INNER JOIN branch BR
		ON BR.bra_id = TD.bra_id
	INNER JOIN maintenanceRoutine MR
		ON MR.mr_id = TD.mr_id
	LEFT JOIN transactionState TS
		ON TS.trxst_id = TR.trxst_id
	WHERE (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
	AND (@CLIENT_ID IS NULL OR TR.cli_id = @CLIENT_ID)
	AND TR.m_id = @ORDEN_DE_TRABAJO
	AND TR.trx_state = @STATE_ACTIVE
	AND TR.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE	
	ORDER BY TR.trx_registrationDate DESC

	SELECT trx_id,trx_consecutive,veh_id, veh_licensePlate,vm_id,vm_shortName,cli_id,cli_name,mr_id, mr_name,bra_id,bra_name, trxst_id, trxst_name,trx_registrationDate,trx_value,trx_code
	FROM @TBL_WORK_OREDERS
	WHERE (@CODE IS NULL OR trx_code LIKE '%'+@CODE+'%')
	AND (@LICENSE_PLATE IS NULL OR veh_licensePlate LIKE '%'+@LICENSE_PLATE+'%')
	AND (@STATE_WORK_ORDER IS NULL OR trxst_id = @STATE_WORK_ORDER)

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_TRANSACTIONS_TODAY]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_TRANSACTIONS_TODAY]
AS
BEGIN
	DECLARE @TODAY AS DATETIME = GETDATE()
	DECLARE @S_DATE AS VARCHAR(30) = CONVERT(varchar(30),@TODAY,111)
	DECLARE @SHORT_DATE VARCHAR(15) = SUBSTRING(@S_DATE,0,11)

	SELECT 
		CL.cli_id,CL.cli_document,CL.cli_name,CL.cli_phone,CL.cli_cellphone,CL.cli_website,CL.cty_id,
		TRX.trx_id,TRX.trx_consecutive,MV.m_id,MV.m_name,TRX.trxst_id,ST.trxst_name,TRX.trx_value,trx.trx_registrationDate,
		TRX.usu_id AS 'usu_id',usr.usr_firstName AS 'usu_name', usr.usr_lastName AS 'usu_lastName', TRX.trx_code
	FROM transactions TRX
	INNER JOIN Client CL 
		ON CL.cli_id = TRX.cli_id
	INNER JOIN Movement MV
		ON MV.m_id = TRX.m_id
	LEFT JOIN transactionState ST
		ON ST.trxst_id = TRX.trxst_id
	INNER JOIN Users usr ON TRX.usu_id = usr.usr_id
	WHERE TRX.trx_state = 1
	AND TRX.trx_registrationDate BETWEEN @SHORT_DATE+' 00:00:00' AND @SHORT_DATE+' 23:59:59' 
	ORDER BY TRX.trx_registrationDate DESC
END


GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_VEHICLES_WITHOUT_CONTRACT]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_VEHICLES_WITHOUT_CONTRACT]
	 @CLIENT_ID INT ,
	 @CONTRACT_ID INT
AS
BEGIN
	DECLARE @STATE_CONTRACT_ACTIVE INT = 1
	DECLARE @STATE_VEHICLE_ACTIVE INT = 1
	DECLARE @TBL_VEHICLES_WITH_CONTRACT AS TABLE (VEH_ID INT)

	/*
	TRAE TODOS LOS VEHÍCULOS QUE TENGAN UN CONTRATO ACTIVO DIFERENTE AL DEL FILTRO
	*/

	INSERT INTO @TBL_VEHICLES_WITH_CONTRACT
	SELECT VHCT.VEH_ID 
	FROM VehiclesByContract VHCT
	INNER JOIN [Contract] CT
		ON VHCT.cntr_id = CT.cntr_id
	WHERE VHCT.cntr_id <> @CONTRACT_ID
	AND CT.cntrst_id = @STATE_CONTRACT_ACTIVE
	AND CT.cntr_state = 1

	SELECT VH.veh_id, VH.veh_licensePlate, VH.veh_chasisCode,VH.vm_id, VM.vm_shortName,
	VM.vt_id,VT.vt_name,VM.vb_id, VB.vb_name,VH.veh_year, VH.veh_mileage,VH.vs_id, VS.vs_name,VH.veh_registrationDate 
	FROM Vehicle VH
	INNER JOIN  vehicleState VS 
		ON VS.vs_id = VH.vs_id
	INNER JOIN VehicleModel VM
		ON VM.vm_id = VH.vm_id
	INNER JOIN VehicleType VT
		ON VT.vt_id = VM.vt_id
	INNER JOIN VehicleBrand VB
		ON VB.vb_id = VM.vb_id
	WHERE VH.cli_id = @CLIENT_ID
	AND VH.veh_id NOT IN( SELECT veh_id FROM @TBL_VEHICLES_WITH_CONTRACT)
	AND VH.vs_id = @STATE_VEHICLE_ACTIVE
	AND VH.veh_state = 1
END

GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_ANNUL_BY_VEHICLE]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_ANNUL_BY_VEHICLE]
	@CLIENT_ID INT = NULL,
	@DEALER_ID INT = NULL,
	@LICENSE_PLATE VARCHAR(10) = NULL,
	@INI_DATE DATETIME = NULL,
	@END_DATE DATETIME = NULL
AS
BEGIN

	DECLARE @ROW_ACTIVE INT = 1
	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @STATE_ANNUL INT = 3

	SET @END_DATE = ISNULL(@END_DATE,GETDATE())
	SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -30, @END_DATE))

	SELECT vh.veh_licensePlate as Placa,   COUNT(*) as Cantidad	
	FROM transactions trx
	INNER JOIN transactionDetail td
		ON td.trx_id = trx.trx_id
	INNER JOIN Vehicle vh
		ON td.veh_id = vh.veh_id
	WHERE trx.trx_state = @ROW_ACTIVE
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
	AND (@LICENSE_PLATE IS NULL OR vh.veh_licensePlate = @LICENSE_PLATE)
	AND trx.m_id = @ORDEN_DE_TRABAJO
	AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE
	AND trx.trxst_id = @STATE_ANNUL
	GROUP BY  vh.veh_licensePlate

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_APPROVED_BY_VEHICLE]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_APPROVED_BY_VEHICLE]
	@CLIENT_ID INT = NULL,
	@DEALER_ID INT = NULL,
	@LICENSE_PLATE VARCHAR(10) = NULL,
	@INI_DATE DATETIME = NULL,
	@END_DATE DATETIME = NULL
AS
BEGIN

	DECLARE @ROW_ACTIVE INT = 1
	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @STATE_APROBADA INT = 1

	SET @END_DATE = ISNULL(@END_DATE,GETDATE())
	SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -30, @END_DATE))

	SELECT vh.veh_licensePlate as Placa,   COUNT(*) as Cantidad	
	FROM transactions trx
	INNER JOIN transactionDetail td
		ON td.trx_id = trx.trx_id
	INNER JOIN Vehicle vh
		ON td.veh_id = vh.veh_id
	WHERE trx.trx_state = @ROW_ACTIVE
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
	AND (@LICENSE_PLATE IS NULL OR vh.veh_licensePlate = @LICENSE_PLATE)
	AND trx.m_id = @ORDEN_DE_TRABAJO
	AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE
	AND trx.trxst_id = @STATE_APROBADA
	GROUP BY  vh.veh_licensePlate

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_BY_DEALER]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_BY_DEALER]
	@DEALER_ID INT
AS
BEGIN

	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @STATE_ACTIVE INT = 1

	SELECT TOP 100 TR.trx_id,TR.trx_consecutive,VH.veh_id, VH.veh_licensePlate,VH.vm_id, VM.vm_shortName,TR.cli_id,CL.cli_name,TD.mr_id, MR.mr_name,TD.bra_id,BR.bra_name,TR.trxst_id, TS.trxst_name, TR.trx_registrationDate,
		TR.trx_value, TR.trx_code
	FROM transactions TR
	INNER JOIN transactionDetail TD
		ON TR.trx_id = TD.trx_id	
	INNER JOIN Vehicle VH
		ON VH.veh_id = TD.veh_id
	INNER JOIN VehicleModel VM
		ON VH.vm_id = VM.vm_id
	INNER JOIN Client CL
		ON CL.cli_id = TR.cli_id
	INNER JOIN branch BR
		ON BR.bra_id = TD.bra_id
	INNER JOIN maintenanceRoutine MR
		ON MR.mr_id = TD.mr_id
	LEFT JOIN transactionState TS
		ON TS.trxst_id = TR.trxst_id
	WHERE td.deal_id = @DEALER_ID
	AND TR.m_id = @ORDEN_DE_TRABAJO
	AND TR.trx_state = @STATE_ACTIVE
	ORDER BY TR.trx_registrationDate DESC

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_CANCELED_BY_VEHICLE]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_CANCELED_BY_VEHICLE]
	@CLIENT_ID INT = NULL,
	@DEALER_ID INT = NULL,
	@LICENSE_PLATE VARCHAR(10) = NULL,
	@INI_DATE DATETIME = NULL,
	@END_DATE DATETIME = NULL
AS
BEGIN

	DECLARE @ROW_ACTIVE INT = 1
	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @STATE_CANCELED INT = 2

	SET @END_DATE = ISNULL(@END_DATE,GETDATE())
	SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -30, @END_DATE))

	SELECT vh.veh_licensePlate as Placa,   COUNT(*) as Cantidad	
	FROM transactions trx
	INNER JOIN transactionDetail td
		ON td.trx_id = trx.trx_id
	INNER JOIN Vehicle vh
		ON td.veh_id = vh.veh_id
	WHERE trx.trx_state = @ROW_ACTIVE
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
	AND (@LICENSE_PLATE IS NULL OR vh.veh_licensePlate = @LICENSE_PLATE)
	AND trx.m_id = @ORDEN_DE_TRABAJO
	AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE
	AND trx.trxst_id = @STATE_CANCELED
	GROUP BY  vh.veh_licensePlate

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_FINISHED_BY_VEHICLE]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_FINISHED_BY_VEHICLE]
	@CLIENT_ID INT = NULL,
	@DEALER_ID INT = NULL,
	@LICENSE_PLATE VARCHAR(10) = NULL,
	@INI_DATE DATETIME = NULL,
	@END_DATE DATETIME = NULL
AS
BEGIN

	DECLARE @ROW_ACTIVE INT = 1
	DECLARE @ORDEN_DE_TRABAJO INT = 4
	DECLARE @STATE_FINISHED INT = 4

	SET @END_DATE = ISNULL(@END_DATE,GETDATE())
	SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -30, @END_DATE))

	SELECT vh.veh_licensePlate as Placa,   COUNT(*) as Cantidad	
	FROM transactions trx
	INNER JOIN transactionDetail td
		ON td.trx_id = trx.trx_id
	INNER JOIN Vehicle vh
		ON td.veh_id = vh.veh_id
	WHERE trx.trx_state = @ROW_ACTIVE
	AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)
	AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
	AND (@LICENSE_PLATE IS NULL OR vh.veh_licensePlate = @LICENSE_PLATE)
	AND trx.m_id = @ORDEN_DE_TRABAJO
	AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE
	AND trx.trxst_id = @STATE_FINISHED
	GROUP BY  vh.veh_licensePlate

END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_PENDING_BY_VEHICLE]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_PENDING_BY_VEHICLE]  
 @CLIENT_ID INT = NULL,  
 @DEALER_ID INT = NULL,
 @LICENSE_PLATE VARCHAR(10) = NULL,  
 @INI_DATE DATETIME = NULL,  
 @END_DATE DATETIME = NULL  
AS  
BEGIN  
  
 DECLARE @ROW_ACTIVE INT = 1  
 DECLARE @ORDEN_DE_TRABAJO INT = 4  
 DECLARE @STATE_APROBADA INT = 1  
  
 SET @END_DATE = ISNULL(@END_DATE,GETDATE())  
 SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -30, @END_DATE))  
  
 SELECT vh.veh_licensePlate as Placa,   COUNT(*) as Cantidad   
 FROM transactions trx  
 INNER JOIN transactionDetail td  
  ON td.trx_id = trx.trx_id  
 INNER JOIN Vehicle vh  
  ON td.veh_id = vh.veh_id  
 WHERE trx.trx_state = @ROW_ACTIVE  
 AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)  
 AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)
 AND (@LICENSE_PLATE IS NULL OR vh.veh_licensePlate = @LICENSE_PLATE)  
 AND trx.m_id = @ORDEN_DE_TRABAJO  
 AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE  
 AND trx.trxst_id IS NULL  
 GROUP BY  vh.veh_licensePlate  
  
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_TO_APPROVE_BY_CLIENT]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_TO_APPROVE_BY_CLIENT]
	@CLIENT_ID INT
AS 
BEGIN
	DECLARE @ORDEN_DE_TRABAJO INT = 4

	SELECT TRX.trx_id,TRX.trx_consecutive,TRX.trx_value,TRX.trx_registrationDate,VH.veh_id,VH.veh_licensePlate,CL.cli_id,CL.cli_document,CL.cli_name,DL.deal_id,DL.deal_name,
	BR.bra_id,BR.bra_name,CT.cntr_id ,CT.cntr_code,CT.cntr_name,MR.mr_id,MR.mr_name,TRX.usu_id,TRX.trx_code
	FROM transactions TRX
	INNER JOIN transactionDetail TD ON TRX.trx_id= TD.trx_id
	INNER JOIN Vehicle	VH ON VH.veh_id = TD.veh_id
	INNER JOIN Client CL ON TRX.cli_id = CL.cli_id
	INNER JOIN Dealer DL ON TD.deal_id = DL.deal_id
	INNER JOIN branch BR ON BR.bra_id = TD.bra_id
	INNER JOIN Contract CT ON CT.cntr_id = TD.cntr_id
	INNER JOIN maintenanceRoutine MR ON MR.mr_id = TD.mr_id
	WHERE TRX.m_id = @ORDEN_DE_TRABAJO
	AND TRX.trx_state = 1
	AND TRX.trxst_id IS NULL
	AND TRX.cli_id = @CLIENT_ID
END



GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_VALUES_BY_MONTH]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_GET_WORKORDERS_VALUES_BY_MONTH]  
 @CLIENT_ID INT = NULL,  
 @DEALER_ID INT = NULL,  
 @INI_DATE DATETIME = NULL,  
 @END_DATE DATETIME = NULL  
AS  
BEGIN  
 DECLARE @ROW_ACTIVE INT = 1  
 DECLARE @ORDEN_DE_TRABAJO INT = 4  
 DECLARE @STATE_FINISHED INT = 4  
  
 SET @END_DATE = ISNULL(@END_DATE,GETDATE())  
 SET @INI_DATE = ISNULL(@INI_DATE,DATEADD(DAY, -700, @END_DATE))  
  
 SELECT   
 CASE   
  WHEN MONTH(trx.trx_registrationDate) = 1 THEN 'ENERO'  
  WHEN MONTH(trx.trx_registrationDate) = 2 THEN 'FEBRERO'  
  WHEN MONTH(trx.trx_registrationDate) = 3 THEN 'MARZO'  
  WHEN MONTH(trx.trx_registrationDate) = 4 THEN 'ABRIL'  
  WHEN MONTH(trx.trx_registrationDate) = 5 THEN 'MAYO'  
  WHEN MONTH(trx.trx_registrationDate) = 6 THEN 'JUNIO'  
  WHEN MONTH(trx.trx_registrationDate) = 7 THEN 'JULIO'  
  WHEN MONTH(trx.trx_registrationDate) = 8 THEN 'AGOSTO'  
  WHEN MONTH(trx.trx_registrationDate) = 9 THEN 'SEPTIEMBRE'  
  WHEN MONTH(trx.trx_registrationDate) = 10 THEN 'OCTUBRE'  
  WHEN MONTH(trx.trx_registrationDate) = 11 THEN 'NOVIEMBRE'  
  WHEN MONTH(trx.trx_registrationDate) = 12 THEN 'DICIEMBRE'  
 END AS Mes,  
 YEAR(trx.trx_registrationDate) as Anio,  
 SUM(trx.trx_value) as Valor  
 FROM transactions trx  
 INNER JOIN transactionDetail td  
  ON td.trx_id = trx.trx_id  
 INNER JOIN Vehicle vh  
  ON td.veh_id = vh.veh_id  
 WHERE trx.trx_state = @ROW_ACTIVE  
 AND (@CLIENT_ID IS NULL OR trx.cli_id = @CLIENT_ID)  
 AND (@DEALER_ID IS NULL OR td.deal_id = @DEALER_ID)   
 AND trx.m_id = @ORDEN_DE_TRABAJO  
 AND trx.trxst_id = @STATE_FINISHED  
 AND trx.trx_registrationDate BETWEEN @INI_DATE AND @END_DATE  
 GROUP BY  MONTH(trx.trx_registrationDate), YEAR(trx.trx_registrationDate)   
 ORDER BY MONTH(trx.trx_registrationDate) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_PROCESS_RULES_OF_TRANSACTION]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [DB_FleetService]
--GO
--/****** Object:  StoredProcedure [dbo].[STRPRC_PROCESS_RULES_OF_TRANSACTION]    Script Date: 2021/01/31 10:08:01 a. m. ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

CREATE PROCEDURE [dbo].[STRPRC_PROCESS_RULES_OF_TRANSACTION]
	 @CLIENT_ID INT,
	 @MOVEMENT_ID INT ,
	 @TRX_VALUE DECIMAL(18,2)
AS
BEGIN
	BEGIN TRY
	 BEGIN TRAN
	PRINT @TRX_VALUE
		--TODO IF THE MOVEMENT IS QUOTA CANCELED  Update state to 0 and delete date to getDate
		DECLARE @TBL_RULES AS TABLE(
			ID_RULE INT,
			MOVEMENT VARCHAR(255),
			ORDER_RULE INT,
			TABLE_NAME VARCHAR(255),
			FIELD_ONE VARCHAR(50),
			OPERATION_ONE VARCHAr(2),
			FIELD_TWO VARCHAR(50),
			OPERATION_TWO VARCHAR(2),
			FIELD_THREE VARCHAR(50)
		)


		DECLARE @field_one AS VARCHAR(50)
		DECLARE @field_two AS VARCHAR(50) 
		DECLARE @field_three AS VARCHAR(50) 
		DECLARE @operation_one AS VARCHAR(2)
		DECLARE @operation_two AS VARCHAR(2)


		INSERT INTO @TBL_RULES (ID_RULE,MOVEMENT,ORDER_RULE,FIELD_ONE,OPERATION_ONE,FIELD_TWO,OPERATION_TWO,FIELD_THREE)
		SELECT RL.rlm_id,m_name,rlm_order,f1.fto_nameDb,op1.op_symbol,f2.fto_nameDb,op2.op_symbol,f3.fto_nameDb 
		FROM RULESBYMOVEMENT rl
		left Join fieldsTooperate f1 on rl.rlm_field_1 = f1.fto_id
		left Join fieldsTooperate f2 on rl.rlm_field_2 = f2.fto_id
		left Join fieldsTooperate f3 on rl.rlm_field_3 = f3.fto_id
		left join Operations op1 on rl.rlm_op_1 = op1.op_id
		left join Operations op2 on rl.rlm_op_2 = op2.op_id
		left join movement m on m.m_id = rl.m_id
		WHERE rl.m_id = @MOVEMENT_ID
		ORDER BY rlm_order ASC


		DECLARE @ROW_COUNT AS INT = 0
		DECLARE @RULE_ID AS INT

		SELECT @ROW_COUNT = COUNT(*) 
		FROM @TBL_RULES

		DECLARE @CAMPO_UPDATE VARCHAR(255)
		DECLARE @QUERY_TO_EXECUTE NVARCHAR(1000)
		DECLARE @TABLE_DESTINATION VARCHAR(255)

		WHILE @ROW_COUNT > 0
		BEGIN
			SELECT TOP 1 @RULE_ID = ID_RULE, @field_one = FIELD_ONE, @operation_one = OPERATION_ONE,
				@field_two = FIELD_TWO, @operation_two = OPERATION_TWO, @field_three = FIELD_THREE
			FROM @TBL_RULES		
			

			SELECT @TABLE_DESTINATION = fto_tableName FROM FieldsToOperate where fto_nameDb = @field_one

			IF(@operation_two IS NULL)
			BEGIN
				SET @CAMPO_UPDATE = CONCAT (@field_one , @operation_one,' CONVERT(DECIMAL(18,2),', @field_two,')', ' ,ficl_updateDate=getdate()')
			END
			ELSE
			BEGIN
				SET @CAMPO_UPDATE = CONCAT (@field_one , @operation_one,' CONVERT(DECIMAL(18,2),', @field_two,')', @operation_two,' CONVERT(DECIMAL(18,2),',@field_three,')', ' ,ficl_updateDate=getdate()')
			END

			SET @CAMPO_UPDATE = REPLACE(@CAMPO_UPDATE,'trx_value',@TRX_VALUE)

			--print @CAMPO_UPDATE

			SET @QUERY_TO_EXECUTE = CONCAT ('UPDATE ', @TABLE_DESTINATION, ' SET ', @CAMPO_UPDATE , ' WHERE cli_id=',@CLIENT_ID, ' AND ficl_state = 1 ')

			--SELECT @QUERY_TO_EXECUTE


			EXECUTE sp_executesql @QUERY_TO_EXECUTE

			DELETE FROM @TBL_RULES
			WHERE ID_RULE = @RULE_ID

			SELECT @ROW_COUNT = COUNT(*) 
			FROM @TBL_RULES
		END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT ERROR_MESSAGE()
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[STRPRC_PROCESS_TRANSACTION_V2]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STRPRC_PROCESS_TRANSACTION_V2]
	@CLIENT_ID INT,
	@MOVEMENT_ID INT,
	@TRX_VALUE_WITHOUT_DISCOUNT DECIMAL (18,2),
	@TRX_DISCOUNT_VALUE DECIMAL(18,2) = 0,
	@TRX_VALUE_WITH_DISCOUNT_WITHOUT_TAXES DECIMAL(18,2) = 0,
	@TRX_TAXES_VALUE DECIMAL(18,2) = 0,
	@TRX_VALUE DECIMAL(18,2),	
	@TRX_STATE INT = NULL,
	@USER_ID INT = NULL
 AS 
 BEGIN
	 BEGIN TRY
		DECLARE @TRX_ID AS INT = 0
		DECLARE @TRX_CONSECUTIVE AS INT = 0
		DECLARE @CREACION_CUPO INT = 1
		DECLARE @CANCELACION_CUPO INT = 3
		DECLARE @APPROVED_QUOTA FLOAT(53) = 0
		DECLARE @CONSUMED_QUOTA FLOAT(53) = 0
		DECLARE @CURRENT_QUOTA FLOAT(53) = 0
		DECLARE @IN_TRANSIT_QUOTA FLOAT(53) = 0
		DECLARE @ORDEN_DE_TRABAJO INT = 4

		

		BEGIN TRAN			
			SELECT TOP 1 @TRX_CONSECUTIVE = trx_consecutive  FROM transactions
			ORDER BY trx_registrationDate DESC

			IF(@TRX_CONSECUTIVE > 0)
			BEGIN
				SET @TRX_CONSECUTIVE = @TRX_CONSECUTIVE + 1
			END
			ELSE
			BEGIN
				SET @TRX_CONSECUTIVE = 1
			END

			IF(@MOVEMENT_ID = @ORDEN_DE_TRABAJO) 
			BEGIN
				DECLARE @CODE VARCHAR(30) = CONCAT('FC_',@TRX_CONSECUTIVE)
				INSERT INTO transactions (trx_consecutive,cli_id,m_id,trx_taxesValue,trx_value,usu_id,trx_code, trx_valueWithoutDiscount, trx_discountValue, trx_valueWithDiscountWithoutTaxes)
				VALUES (@TRX_CONSECUTIVE,@CLIENT_ID,@MOVEMENT_ID,@TRX_TAXES_VALUE,@TRX_VALUE,@USER_ID,@CODE, @TRX_VALUE_WITHOUT_DISCOUNT,@TRX_DISCOUNT_VALUE, @TRX_VALUE_WITH_DISCOUNT_WITHOUT_TAXES)
			END
			ELSE
			BEGIN
				INSERT INTO transactions (trx_consecutive,cli_id,m_id,trx_taxesValue,trx_value,usu_id, trx_valueWithoutDiscount, trx_discountValue, trx_valueWithDiscountWithoutTaxes)
				VALUES (@TRX_CONSECUTIVE,@CLIENT_ID,@MOVEMENT_ID,@TRX_TAXES_VALUE,@TRX_VALUE,@USER_ID, @TRX_VALUE_WITHOUT_DISCOUNT,@TRX_DISCOUNT_VALUE, @TRX_VALUE_WITH_DISCOUNT_WITHOUT_TAXES)
			END

			SELECT TOP 1 @TRX_ID = trx_id
			FROM transactions With(nolock)
			WHERE trx_consecutive = @TRX_CONSECUTIVE
			AND cli_id = @CLIENT_ID


			IF(@MOVEMENT_ID = @CREACION_CUPO)
			BEGIN
				EXEC STRPRC_CREATE_FINANCIAL_INFORMATION @CLIENT_ID
			END
			
			SELECT 
				@APPROVED_QUOTA = ficl_approvedQuota,
				@CONSUMED_QUOTA = ficl_consumedQuota,
				@CURRENT_QUOTA = ficl_currentQuota,
				@IN_TRANSIT_QUOTA = ficl_inTransitQuota
			FROM FinancialInformationByClient
			WHERE cli_id = @CLIENT_ID

			EXEC STRPRC_CREATE_LOG_TRANSACTION	@TRX_ID, @APPROVED_QUOTA, @CONSUMED_QUOTA ,	@CURRENT_QUOTA, @IN_TRANSIT_QUOTA 


			EXEC STRPRC_PROCESS_RULES_OF_TRANSACTION @CLIENT_ID,@MOVEMENT_ID,@TRX_VALUE

			SELECT 
				@APPROVED_QUOTA = ficl_approvedQuota,
				@CONSUMED_QUOTA = ficl_consumedQuota,
				@CURRENT_QUOTA = ficl_currentQuota,
				@IN_TRANSIT_QUOTA = ficl_inTransitQuota
			FROM FinancialInformationByClient
			WHERE cli_id = @CLIENT_ID			

			EXEC STRPRC_UPDATE_LOG_TRANSACTION	@TRX_ID, @APPROVED_QUOTA, @CONSUMED_QUOTA ,	@CURRENT_QUOTA, @IN_TRANSIT_QUOTA 

			IF(@MOVEMENT_ID = @CANCELACION_CUPO)
			BEGIN
				DELETE FROM FinancialInformationByClient
				WHERE cli_id = @CLIENT_ID
				AND ficl_state = 1
			END

			SELECT @TRX_CONSECUTIVE
		COMMIT TRAN
	 END TRY
	 BEGIN CATCH
		ROLLBACK TRAN
		PRINT ERROR_MESSAGE()
	 END CATCH	
 END 
GO
/****** Object:  StoredProcedure [dbo].[STRPRC_UPDATE_LOG_TRANSACTION]    Script Date: 2021/07/04 10:02:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_UPDATE_LOG_TRANSACTION]
	@TRX_ID INT,
	@APPROVED_QUOTA FLOAT(53),
	@CONSUMED_QUOTA FLOAT(53),
	@CURRENT_QUOTA FLOAT(53),
	@IN_TRANSIT_QUOTA FLOAT(53)
AS
BEGIN
	BEGIN TRY	
		BEGIN TRAN
			UPDATE LOG_TRX  
				SET ltrx_endApprovedQuota = @APPROVED_QUOTA,
					ltrx_endConsumedQuota = @CONSUMED_QUOTA,
					ltrx_endCurrentQuota = @CURRENT_QUOTA,
					ltrx_endInTransitQuota = @IN_TRANSIT_QUOTA
			WHERE trx_id = @TRX_ID			
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT ERROR_MESSAGE()
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [DB_FleetService] SET  READ_WRITE 
GO
