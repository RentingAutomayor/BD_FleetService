USE [master]
GO
/****** Object:  Database [DB_FleetService]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[areas]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[branch]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractState]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Dealer]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[DealerByDealerNerwork]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[DealerNetwork]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[DiscountType]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[FieldsToOperate]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[FinancialInformationByClient]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[frequency]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[ItemsByRoutines]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[jobTitle]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[JobTitlesClient]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[LOG_TRX]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItem]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceItemCategory]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleModels]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleTypes]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[maintenanceRoutine]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Movement]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[MovementType]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[observationsByTransaction]    Script Date: 2020/12/26 10:46:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[observationsByTransaction](
	[obstrx_id] [int] IDENTITY(1,1) NOT NULL,
	[trx_id] [int] NULL,
	[obstrx_description] [varchar](500) NULL,
	[usu_id] [int] NULL,
	[obstrx_state] [bit] NULL,
	[obstrx_registrationDate] [datetime] NULL,
	[obtrx_updateDate] [datetime] NULL,
	[obtrx_deleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[obstrx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[PresentationUnit]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[PricesByContract]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[PricesByDealer]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[RulesByMovement]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[transactionDetail]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[trxdt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionItems]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[trxit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[trx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionState]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[TypeOfMaintenanceItem]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleBrand]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleModelsByContract]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[VehiclesByContract]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[vehicleState]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleType]    Script Date: 2020/12/26 10:46:00 a. m. ******/
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
ALTER TABLE [dbo].[transactions] ADD  DEFAULT ((1)) FOR [trx_state]
GO
ALTER TABLE [dbo].[transactions] ADD  DEFAULT (getdate()) FOR [trx_registrationDate]
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
/****** Object:  StoredProcedure [dbo].[STRPRC_CREATE_FINANCIAL_INFORMATION]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[STRPRC_CREATE_LOG_TRANSACTION]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_CLIENTS_WITHOUT_QUOTA]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_FINANCIAL_INFORMATION_BY_CLIENT]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_TRANSACTIONS_TODAY]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
		null AS 'usu_id',null AS 'usu_name', null AS 'usu_lastName'
	FROM transactions TRX
	INNER JOIN Client CL 
		ON CL.cli_id = TRX.cli_id
	INNER JOIN Movement MV
		ON MV.m_id = TRX.m_id
	LEFT JOIN transactionState ST
		ON ST.trxst_id = TRX.trxst_id
	WHERE TRX.trx_state = 1
	AND TRX.trx_registrationDate BETWEEN @SHORT_DATE+' 00:00:00' AND @SHORT_DATE+' 23:59:59' 
	ORDER BY TRX.trx_registrationDate DESC
END


GO
/****** Object:  StoredProcedure [dbo].[STRPRC_GET_WORKORDERS_TO_APPROVE_BY_CLIENT]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
	BR.bra_id,BR.bra_name,CT.cntr_id ,CT.cntr_code,CT.cntr_name,MR.mr_id,MR.mr_name,TRX.usu_id
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
/****** Object:  StoredProcedure [dbo].[STRPRC_PROCESS_RULES_OF_TRANSACTION]    Script Date: 2020/12/26 10:46:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STRPRC_PROCESS_RULES_OF_TRANSACTION]
	 @CLIENT_ID INT ,
	 @MOVEMENT_ID INT,
	 @TRX_VALUE FLOAT(53)
AS
BEGIN
	BEGIN TRY

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

		DECLARE @TRX_VALUE_FORMMATED DECIMAL(15,2) = CAST(@TRX_VALUE AS DECIMAL(15,2))


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

			SET @CAMPO_UPDATE = CONCAT (@field_one, @operation_one, @field_two, @operation_two, @field_three,' , ficl_updateDate=getdate()')

			SET @CAMPO_UPDATE = REPLACE(@CAMPO_UPDATE,'trx_value',@TRX_VALUE_FORMMATED)

			print @CAMPO_UPDATE

			SET @QUERY_TO_EXECUTE = CONCAT ('UPDATE ', @TABLE_DESTINATION, ' SET ', @CAMPO_UPDATE , ' WHERE cli_id=',@CLIENT_ID, ' AND ficl_state = 1 ')


			EXECUTE sp_executesql @QUERY_TO_EXECUTE

			DELETE FROM @TBL_RULES
			WHERE ID_RULE = @RULE_ID

			SELECT @ROW_COUNT = COUNT(*) 
			FROM @TBL_RULES
		END

	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT ERROR_MESSAGE()
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[STRPRC_PROCESS_TRANSACTION]    Script Date: 2020/12/26 10:46:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STRPRC_PROCESS_TRANSACTION]
	@CLIENT_ID INT,
	@MOVEMENT_ID INT,
	@TRX_VALUE FLOAT(53),	
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

			INSERT INTO transactions (trx_consecutive,cli_id,m_id,trx_value,usu_id)
			VALUES (@TRX_CONSECUTIVE,@CLIENT_ID,@MOVEMENT_ID,@TRX_VALUE,@USER_ID)

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
/****** Object:  StoredProcedure [dbo].[STRPRC_UPDATE_LOG_TRANSACTION]    Script Date: 2020/12/26 10:46:01 a. m. ******/
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
