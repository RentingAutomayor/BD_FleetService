USE [DB_FleetService]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[areas]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[branch]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Client]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[ContractState]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Dealer]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[DealerByDealerNerwork]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[DealerNetwork]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[DiscountType]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[frequency]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[GroupModule]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[GroupModuleAction]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Groups]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[ItemsByRoutines]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[jobTitle]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[JobTitlesClient]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItem]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItemCategory]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleModels]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[MaintenanceItemsByVehicleTypes]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[maintenanceRoutine]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Modules]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[PresentationUnit]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[TypeOfMaintenanceItem]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 26/12/2020 11:05:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[usr_id] [int] IDENTITY(1,1) NOT NULL,
	[usr_name] [varchar](50) NOT NULL,
	[usr_password] [varchar](25) NOT NULL,
	[grp_id] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleBrand]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleModelsByContract]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[VehiclesByContract]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[vehicleState]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
/****** Object:  Table [dbo].[VehicleType]    Script Date: 26/12/2020 11:05:20 a. m. ******/
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
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (1, N'Create', N'Accion para crear nuevos recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (2, N'Read', N'Accion para solo lñleer los recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (3, N'Update', N'Accion para modificar o actualizar recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (4, N'Delete', N'Accion para eliminar recursos')
INSERT [dbo].[Actions] ([act_id], [act_name], [act_description]) VALUES (5, N'Adicionar Cupo', N'Es  una caccion para agregar nuevos cupos ')
SET IDENTITY_INSERT [dbo].[Actions] OFF
GO
SET IDENTITY_INSERT [dbo].[branch] ON 

INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (1, N'Sucursal uno uno', N'calle falsa 123', N'7329434', N'3118707741', 320, NULL, 1, 4, NULL, CAST(N'2020-11-01T16:13:54.903' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (3, N'Principal', N'Cra 12 d # 18 -03', N'3118707741', N'3118707741', 918, NULL, 1, 3, NULL, CAST(N'2020-11-01T16:24:42.930' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (4, N'Sucursal principal', N'calle falsa 123', N'1234565', N'', 906, NULL, 1, 2, NULL, CAST(N'2020-11-01T18:59:00.517' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (5, N'Principal', N'cale falsa 123', N'', N'3118707741', 107, NULL, 1, 5, NULL, CAST(N'2020-11-01T20:49:24.080' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (6, N'Principal', N'', N'', N'3175539407', 918, NULL, 1, 6, NULL, CAST(N'2020-11-01T20:55:33.453' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (7, N'Autoniza Calle 170', N'Diag. 170 No. 69-80', N'', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:32:29.373' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (8, N'Autoniza calle 34', N'carrea 7 # 34-07', N'6289999', N'', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:33:14.030' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (9, N'Autoniza Av Suba 116', N'transversal 60 no. 116-56', N'6289999', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:33:58.590' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (10, N'Autoniza calle 222', N'autopista norte no. 221-91', N'6289999', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:34:44.120' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (11, N'Autoniza calle 80', N'au medellín km 2.5 vía siberia - bogotá', N'6289999', N'3024404040', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:35:25.177' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (12, N'Autoniza colisión buses y camiones', N'Calle 23 A No. 27- 41', N'6289999', N'', NULL, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:36:27.800' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (13, N'Autoniza Toberín', N'Calle 164 #19 b -20', N'6289999', N'', NULL, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:37:08.040' AS DateTime))
INSERT [dbo].[branch] ([bra_id], [bra_name], [bra_adress], [bra_phone], [bra_cellphone], [cty_id], [bra_isMain], [bra_state], [cli_id], [deal_id], [bra_registrationDate]) VALUES (14, N'Autoniza Américas', N'Calle 23 # 31-17', N'6289999', N'', 107, NULL, 1, NULL, 1, CAST(N'2020-11-03T13:38:58.510' AS DateTime))
SET IDENTITY_INSERT [dbo].[branch] OFF
GO
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

INSERT [dbo].[Client] ([cli_id], [cli_document], [cli_name], [cli_phone], [cli_cellphone], [cli_adress], [cli_website], [cty_id], [cli_state], [cli_registrationDate], [cli_updateDate], [cli_deleteDate]) VALUES (2, N'1024555718', N'INDUSTRIAS ACME', N'7328434', N'3228441112', N'CRA 12 D # 18 - 03', N'WWW.INDUSTRIASTECH.COM', 319, 1, CAST(N'2020-11-01T10:53:58.223' AS DateTime), CAST(N'2020-11-26T09:40:16.153' AS DateTime), NULL)
INSERT [dbo].[Client] ([cli_id], [cli_document], [cli_name], [cli_phone], [cli_cellphone], [cli_adress], [cli_website], [cty_id], [cli_state], [cli_registrationDate], [cli_updateDate], [cli_deleteDate]) VALUES (3, N'999999999', N'CONFECCIONES RUQUITA', N'7329434', N'3118707741', N'CRA 12 D # 18 - 05', N'', NULL, 1, CAST(N'2020-11-01T10:58:01.337' AS DateTime), CAST(N'2020-11-01T11:40:57.933' AS DateTime), NULL)
INSERT [dbo].[Client] ([cli_id], [cli_document], [cli_name], [cli_phone], [cli_cellphone], [cli_adress], [cli_website], [cty_id], [cli_state], [cli_registrationDate], [cli_updateDate], [cli_deleteDate]) VALUES (4, N'111111111', N'MERCADERIA', N'44444444', N'', N'ZONA INDUSTRIAL', N'SIN SITIO', 107, 1, CAST(N'2020-11-01T10:59:14.677' AS DateTime), CAST(N'2020-11-01T11:49:15.040' AS DateTime), NULL)
INSERT [dbo].[Client] ([cli_id], [cli_document], [cli_name], [cli_phone], [cli_cellphone], [cli_adress], [cli_website], [cty_id], [cli_state], [cli_registrationDate], [cli_updateDate], [cli_deleteDate]) VALUES (5, N'789456123', N'SINPASIS TECNOLOGIES', N'20130455', N'', N'CALLE FALSA 123', N'SINAPSISTECNOLOGIES.COM', 107, 1, CAST(N'2020-11-01T20:48:27.777' AS DateTime), CAST(N'2020-11-01T20:49:53.487' AS DateTime), NULL)
INSERT [dbo].[Client] ([cli_id], [cli_document], [cli_name], [cli_phone], [cli_cellphone], [cli_adress], [cli_website], [cty_id], [cli_state], [cli_registrationDate], [cli_updateDate], [cli_deleteDate]) VALUES (6, N'51618738', N'CONSTRUCTORA EL APACHURRADITO', N'7329434', N'3175539407', N'CRA 12 D # 18 -03', N'ELAPACHURRADITO.COM', 918, 1, CAST(N'2020-11-01T20:54:20.010' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (1, N'william', N'forero bermeo', N'7329434', N'3175530407', N'williamforerob@gmail.com', N'cra12 d # 18 - 03', 1, NULL, NULL, 1, 2, NULL, CAST(N'2020-11-01T10:55:00.507' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (2, N'Armando', N'Forero', N'', N'3124557899', N'', N'', 1011, NULL, NULL, 1, 3, NULL, CAST(N'2020-11-01T10:58:23.213' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (3, N'Miguel Ángel', N'Forero Gónzales', N'', N'', N'mg@gmail.com', N'', 1012, NULL, NULL, 1, 4, NULL, CAST(N'2020-11-01T11:47:17.860' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (4, N'Diego', N'Casallas', N'3118707741', N'3118707741', N'd.casallas@rt.com', N'', 1012, NULL, NULL, 1, 5, NULL, CAST(N'2020-11-01T20:48:59.840' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (5, N'Armando', N'Forero', N'', N'3175539407', N'elapachurradito@mail.com', N'cra 12 D # 18 - 03', 1012, NULL, NULL, 1, 6, NULL, CAST(N'2020-11-01T20:55:01.807' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (7, N'Andrés', N'Borrero', N'2141122', N'3147896655', N'', N'calle 30 # 70 - 45', 1, NULL, NULL, 1, NULL, 3, CAST(N'2020-11-03T12:39:50.823' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (8, N'Felipe', N'Castañeda', N'', N'3158745566', N'', N'calle 80 # 79 -63', 1013, NULL, NULL, 1, NULL, 3, CAST(N'2020-11-03T12:45:47.243' AS DateTime))
INSERT [dbo].[Contact] ([cnt_id], [cnt_name], [cnt_lastName], [cnt_phone], [cnt_cellPhone], [cnt_email], [cnt_adress], [jtcl_id], [cty_id], [bra_id], [cnt_state], [cli_id], [deal_id], [cnt_registrationDate]) VALUES (9, N'Leidy', N'Fonseca', N'', N'', N'l.fonseca@autogrande.com', N'', 1014, NULL, NULL, 1, NULL, 2, CAST(N'2020-11-03T12:46:34.743' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (1, 1, N'PRBA1', N'prueba 0102', N'pruebas', 1, 6, 2, 0, 2, 15, 10, CAST(N'2020-11-30T15:15:34.000' AS DateTime), CAST(N'2025-11-30T05:00:00.000' AS DateTime), 60, CAST(N'2020-11-22T10:16:35.263' AS DateTime), CAST(N'2020-11-24T18:47:43.937' AS DateTime), CAST(N'2020-11-24T19:12:07.427' AS DateTime), 5)
INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (2, 2, N'PRBA2', N'Prueba 1101', N'prueba de observación', 3, 2, 2, 0, 1, 10, 10, CAST(N'2021-01-01T05:00:00.000' AS DateTime), CAST(N'2023-01-01T05:00:00.000' AS DateTime), 24, CAST(N'2020-11-22T10:21:07.773' AS DateTime), CAST(N'2020-11-24T18:47:32.523' AS DateTime), CAST(N'2020-11-24T19:12:50.210' AS DateTime), 8)
INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (3, 3, N'PRBA3', N'carga liviana mercaderia', N'contrato para vehículos de carga liviana', 3, 4, 1, 1, 4, 1500, 15, CAST(N'2020-11-24T23:37:48.000' AS DateTime), CAST(N'2023-11-24T05:00:00.000' AS DateTime), 36, CAST(N'2020-11-23T18:38:49.127' AS DateTime), CAST(N'2020-11-24T18:34:11.687' AS DateTime), NULL, 10)
INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (4, 4, N'PRBA4', N'Contrato de vehiculos de transporte', N'Contrato de solo camionetas de transporte', 2, 5, 2, 1, 1, 30, 20, CAST(N'2020-12-01T05:00:00.000' AS DateTime), CAST(N'2021-12-01T05:00:00.000' AS DateTime), 12, CAST(N'2020-11-23T18:43:22.733' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (5, 5, N'PRBA5', N'prueba captivas', N'prueba', 1, 5, 2, 1, 1, 30, 10, CAST(N'2020-12-01T05:00:00.000' AS DateTime), CAST(N'2022-12-01T05:00:00.000' AS DateTime), 24, CAST(N'2020-11-23T19:04:48.783' AS DateTime), CAST(N'2020-11-24T18:50:58.500' AS DateTime), NULL, 3)
INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (6, 6, N'PRBA6', N'Prueba para actualizar', N'prueba', 1, 6, 2, 1, 1, 20, 15, CAST(N'2020-11-24T16:10:51.060' AS DateTime), CAST(N'2022-11-24T05:00:00.000' AS DateTime), 24, CAST(N'2020-11-24T11:11:55.107' AS DateTime), CAST(N'2020-11-24T18:33:25.637' AS DateTime), NULL, 1)
INSERT [dbo].[Contract] ([cntr_id], [cntr_consecutive], [cntr_code], [cntr_name], [cntr_observation], [deal_id], [cli_id], [cntrst_id], [cntr_state], [dst_id], [cntr_discountValue], [cntr_amountOfMaintenances], [cntr_startingDate], [cntr_endingDate], [cntr_duration], [cntr_registrationDate], [cntr_updateDate], [cntr_deleteDate], [cntr_amountVehicles]) VALUES (7, 7, N'PRBA7', N'Contrato acme vehículos livianos', N'obs acme', 3, 2, 1, 1, 3, 30, 10, CAST(N'2020-11-25T05:00:00.000' AS DateTime), CAST(N'2025-11-25T05:00:00.000' AS DateTime), 60, CAST(N'2020-11-24T11:14:23.143' AS DateTime), CAST(N'2020-11-26T11:29:32.447' AS DateTime), NULL, 10)
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractState] ON 

INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (1, N'ACTIVO', N'Es cuándo el contrato ya se encuentra firmado y en ejecución', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (2, N'EN NEGOCIACIÓN', N'Es cuándo al contrato le faltan últimar detalles como: ¿Qué placas están vinculadas? ó la negociación del descuento de las partes', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (3, N'CANCELADO', N'Es cuándo el contrato fue finalizado unilateralmente', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
INSERT [dbo].[ContractState] ([cntrst_id], [cntrst_name], [cntrst_description], [cntrst_state], [cntrst_registrationDate], [cntrst_updateDate], [cntrst_deleteDate]) VALUES (4, N'FINALIZADO', N'Es cuándo el contrato finaliza su periodo de ejecución', 1, CAST(N'2020-11-19T10:40:59.900' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ContractState] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ctry_id], [ctry_name], [ctry_state]) VALUES (1, N'Colombia', 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Dealer] ON 

INSERT [dbo].[Dealer] ([deal_id], [deal_document], [deal_name], [deal_state], [deal_registrationDate], [deal_updateDate], [deal_deleteDate]) VALUES (1, N'123456789', N'Autoniza', 1, CAST(N'2020-11-03T12:28:03.523' AS DateTime), NULL, NULL)
INSERT [dbo].[Dealer] ([deal_id], [deal_document], [deal_name], [deal_state], [deal_registrationDate], [deal_updateDate], [deal_deleteDate]) VALUES (2, N'45698713', N'Autogrande', 1, CAST(N'2020-11-03T12:34:44.163' AS DateTime), NULL, NULL)
INSERT [dbo].[Dealer] ([deal_id], [deal_document], [deal_name], [deal_state], [deal_registrationDate], [deal_updateDate], [deal_deleteDate]) VALUES (3, N'123654789', N'San Jorge', 1, CAST(N'2020-11-03T12:39:14.703' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Dealer] OFF
GO
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
GO
SET IDENTITY_INSERT [dbo].[DiscountType] ON 

INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (1, N'PROCENTAJE POR EL TOTAL DEL MANTENIMIENTO', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (2, N'VALOR FIJO POR EL TOTAL DEL MANTENIMIENTO', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (3, N'PORCENTAJE POR REPUESTOS', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
INSERT [dbo].[DiscountType] ([dst_id], [dst_name], [dst_state], [dst_registrationDate], [dst_updateDate], [dst_deleteDate]) VALUES (4, N'VALOR FIJO POR REPUESTOS', 1, CAST(N'2020-11-19T11:33:32.320' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[DiscountType] OFF
GO
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
SET IDENTITY_INSERT [dbo].[frequency] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupModule] ON 

INSERT [dbo].[GroupModule] ([grpmdl_id], [grpmdl_create], [grpmdl_read], [grpmdl_update], [grpmdl_delete], [grp_id], [mdl_id]) VALUES (1, 1, 1, 1, 0, 1, 1)
INSERT [dbo].[GroupModule] ([grpmdl_id], [grpmdl_create], [grpmdl_read], [grpmdl_update], [grpmdl_delete], [grp_id], [mdl_id]) VALUES (2, 1, 0, 0, 0, 1, 2)
INSERT [dbo].[GroupModule] ([grpmdl_id], [grpmdl_create], [grpmdl_read], [grpmdl_update], [grpmdl_delete], [grp_id], [mdl_id]) VALUES (3, 0, 0, 0, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[GroupModule] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupModuleAction] ON 

INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (4, 1, 2, 1)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (5, 1, 2, 3)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (6, 1, 3, 4)
INSERT [dbo].[GroupModuleAction] ([grpmdlact_id], [grp_id], [mdl_id], [act_id]) VALUES (7, 1, 3, 5)
SET IDENTITY_INSERT [dbo].[GroupModuleAction] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([grp_id], [grp_name], [grp_description]) VALUES (1, N'TEC-SOP', N'grupo de soporte del area de tecnologia')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
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
SET IDENTITY_INSERT [dbo].[JobTitlesClient] OFF
GO
SET IDENTITY_INSERT [dbo].[MaintenanceItem] ON 

INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (1, N'MO001', N'ALINEAR Y BALANCEAR LLANTAS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (2, N'MO002', N'CAMBIAR  LÍQUIDO DE FRENOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (3, N'MO003', N'CAMBIAR ACEITE DE TRANSFER', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (4, N'MO004', N'CAMBIAR ACEITE DE TRANSMISIÓN AUTOMÁTICA', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (5, N'MO005', N'CAMBIAR ACEITE Y FILTRO DE MOTOR ', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (6, N'MO006', N'CAMBIAR BANDA DE ACCESORIOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (7, N'MO007', N'CAMBIAR BANDA DE DISTRIBUCIÓN, TENSOR Y BANDA DE BOMBA DE ACEITE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (8, N'MO008', N'CAMBIAR BUJÍAS DE ENCENDIDO', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (9, N'MO009', N'CAMBIAR FILTRO DE AIRE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (10, N'MO010', N'CAMBIAR FILTRO DE COMBUSTIBLE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (11, N'MO011', N'CAMBIAR FILTRO DE VENTILACIÓN', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (12, N'MO012', N'CAMBIAR LÍQUIDO DE FRENOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (13, N'MO013', N'CAMBIAR REFRIGERANTE', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (14, N'MO014', N'INSPECCIONAR: AMORTIGUADORES, MANGUERAS DE REFRIGERANTE, CAÑERÍAS DE LÍQUIDO DE FRENO, FUGAS DE ACEITE DE TRANSMISIÓN Y DE MOTOR, REVISAR NIVEL DE ACEITE DE TRANSMISIÓN', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (15, N'MO015', N'INSPECCIONAR: CARGA DE BATERÍA, AMORTIGUADORES, MANGUERAS DE REFRIGERANTE, CAÑERÍAS DE LÍQUIDO DE FRENO, FUGAS DE ACEITE DE TRANSMISIÓN Y DE MOTOR', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (16, N'MO016', N'INSPECCIONAR: CARGA DE BATERÍA, AMORTIGUADORES, MANGUERAS DE REFRIGERANTE, CAÑERÍAS DE LÍQUIDO DE FRENO, FUGAS DE ACEITE DE TRANSMISIÓN Y DE MOTOR, CERRADURAS Y BISAGRAS, BANDA DE ACCESORIOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (17, N'MO017', N'INSTALAR FILTRO DE VENTILACIÓN', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (18, N'MO018', N'LIMPIAR CUERPO ACELERACIÓN IAC / PCV (usar limpiador)', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (19, N'MO019', N'LIMPIAR,  REVISAR Y REGULAR FRENOS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (20, N'MO020', N'ROTAR Y REVISAR LLANTAS', NULL, 2, 6, 71400, 1, CAST(N'2020-11-14T11:38:34.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (21, N'52135404', N'ACEITE ACDELCO ATF DEXRON VI', NULL, 1, 2, 19250, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (22, N'95633177', N'ACEITE ACDELCO SAE 5W30 DEXOS I GEN 2', NULL, 1, 2, 19213.29, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (23, N'19391608', N'ACEITE SHELL 85W140', NULL, 1, 2, 69937.62, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (24, N'88863336', N'REFRIGERANTE DEXCOOL ACDELCO', NULL, 1, 2, 9500.25, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (25, N'93429134', N'LIMPIADOR CUERPO DE ACELERACIÓN AC DELCO', NULL, 1, 1, 19000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (26, N'88863938', N'LIMPIADOR PARTES DE FRENO AC DELCO', NULL, 1, 1, 16000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (27, N'23866811', N'BANDA DE ALTERNADOR', NULL, 1, 1, 19000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (28, N'23866812', N'BANDA DE COMPRESOR', NULL, 1, 1, 20000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (29, N'23753101', N'BUJÍAS DE ENCENDIDO', NULL, 1, 1, 18000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (30, N'24563823', N'FILTRO DE ACEITE DE MOTOR', NULL, 1, 1, 17000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (31, N'23909020', N'FILTRO DE AIRE', NULL, 1, 1, 49001, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (32, N'23962008', N'FILTRO DE COMBUSTIBLE', NULL, 1, 1, 23000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (33, N'23939588', N'FILTRO DE VENTILACIÓN', NULL, 1, 1, 53000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (34, N'23866022', N'TEMPLADOR DE BANDA DE ACCESORIOS', NULL, 1, 1, 98001, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (35, N'24552829', N'ANILLO TAPÓN DE CARTER', NULL, 1, 1, 6000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (36, N'55509268', N'FILTRO DE ACEITE DE MOTOR', NULL, 1, 1, 15000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (37, N'26241944', N'FILTRO DE AIRE', NULL, 1, 1, 29000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (38, N'12696048', N'FILTRO DE ACEITE DE MOTOR', NULL, 1, 1, 25000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (39, N'84390002', N'FILTRO DE AIRE', NULL, 1, 1, 84000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (40, N'12683541', N'BUJÍAS DE ENCENDIDO', NULL, 1, 1, 40000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (41, N'13508023', N'FILTRO DE VENTILACIÓN', NULL, 1, 1, 48999, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (42, N'12616850', N'ANILLO TAPÓN DE CARTER', NULL, 1, 1, 13500, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (43, N'55509240', N'BUJÍAS DE ENCENDIDO', NULL, 1, 1, 48000, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MaintenanceItem] ([mi_id], [mi_code], [mi_name], [mi_description], [tmi_id], [pu_id], [mi_referencePrice], [mi_state], [mi_registrationDate], [mi_updateDate], [mi_deleteDate], [mict_id]) VALUES (44, N'19315431', N'LÍQUIDO DE FRENOS ACDELCO DOT 4', NULL, 1, 2, 7222, 1, CAST(N'2020-11-26T17:31:00.847' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[MaintenanceItem] OFF
GO
SET IDENTITY_INSERT [dbo].[MaintenanceItemCategory] ON 

INSERT [dbo].[MaintenanceItemCategory] ([mict_id], [mict_name], [mict_state], [mict_registrationDate], [mict_updateDate], [mict_deleteDate]) VALUES (1, N'MANDATORIO', 1, CAST(N'2020-11-13T15:16:36.667' AS DateTime), NULL, NULL)
INSERT [dbo].[MaintenanceItemCategory] ([mict_id], [mict_name], [mict_state], [mict_registrationDate], [mict_updateDate], [mict_deleteDate]) VALUES (2, N'CONSULTIVO', 1, CAST(N'2020-11-13T15:16:36.667' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MaintenanceItemCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Modules] ON 

INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (1, N'Clientes', N'/MasterClients', N'nav-client', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (2, N'Concesionarios', N'/MasterDealers', N'nav-dealer', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (3, N'Mantenimientos', N'/ItemsAndRoutines', N'nav-routine', 0, 1)
INSERT [dbo].[Modules] ([mdl_id], [mdl_name], [mdl_path], [mdl_description], [mdl_father], [mdl_state]) VALUES (5, N'Contratos', N'/MasterContracts', N'nav-contract', 0, 1)
SET IDENTITY_INSERT [dbo].[Modules] OFF
GO
SET IDENTITY_INSERT [dbo].[PresentationUnit] ON 

INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (1, N'UND', N'UNIDAD', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (2, N'CTO', N'CUARTO', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (3, N'PNT', N'PINTA', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (4, N'LT', N'LITRO', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (5, N'GLN', N'GALÓN', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
INSERT [dbo].[PresentationUnit] ([pu_id], [pu_shortName], [pu_longName], [pu_state], [pu_registrationDate], [pu_updateDate], [pu_DeleteDate]) VALUES (6, N'HRS', N'HORAS', 1, CAST(N'2020-11-13T17:31:40.133' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PresentationUnit] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfMaintenanceItem] ON 

INSERT [dbo].[TypeOfMaintenanceItem] ([tmi_id], [tmi_name], [tmi_state], [tmi_registrationDate], [tmi_updateDate], [tmi_DeleteDate]) VALUES (1, N'MATERIAL', 1, CAST(N'2020-11-06T12:15:25.960' AS DateTime), NULL, NULL)
INSERT [dbo].[TypeOfMaintenanceItem] ([tmi_id], [tmi_name], [tmi_state], [tmi_registrationDate], [tmi_updateDate], [tmi_DeleteDate]) VALUES (2, N'MANO DE OBRA', 1, CAST(N'2020-11-06T12:15:25.960' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TypeOfMaintenanceItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([usr_id], [usr_name], [usr_password], [grp_id]) VALUES (2, N'dubier', N'esneider', 1)
INSERT [dbo].[Users] ([usr_id], [usr_name], [usr_password], [grp_id]) VALUES (3, N'esneider123', N'dubier123', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1, N'AAA000', N'123456789', 2, N'2020', 5000, 6, 1, CAST(N'2020-11-20T12:19:58.600' AS DateTime), CAST(N'2020-11-26T11:11:39.540' AS DateTime), NULL, 2)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (2, N'ABC123', N'987654321', 17, N'2015', 35000, 6, 1, CAST(N'2020-11-20T12:20:32.397' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1001, N'ABV123', N'A456KlSDF00101', 9, N'2020', 500, 2, 1, CAST(N'2020-11-21T07:26:51.677' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1002, N'QWE456', N'010203JF456', 13, N'2020', 1000, 2, 1, CAST(N'2020-11-21T07:28:40.037' AS DateTime), CAST(N'2020-11-26T09:40:26.137' AS DateTime), NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1003, N'ZXC012', N'010203040506', 28, N'2018', 25000, 4, 1, CAST(N'2020-11-21T12:40:09.310' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1004, N'ZXC013', N'010204050708', 14, N'2018', 21500, 4, 1, CAST(N'2020-11-21T12:40:45.300' AS DateTime), CAST(N'2020-11-21T12:44:02.523' AS DateTime), NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1005, N'XCV010', N'01040708', 25, N'2020', 500, 5, 1, CAST(N'2020-11-23T18:41:51.350' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1006, N'ABC789', N'010407050602', 28, N'2018', 35000, 2, 1, CAST(N'2020-11-26T09:41:00.237' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1007, N'CBV123', N'010302040809', 28, N'2018', 25000, 2, 1, CAST(N'2020-11-26T09:41:37.180' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([veh_id], [veh_licensePlate], [veh_chasisCode], [vm_id], [veh_year], [veh_mileage], [cli_id], [veh_state], [veh_registrationDate], [veh_updateDate], [veh_deleteDate], [vs_id]) VALUES (1008, N'KKV010', N'010204FAB65', 29, N'2016', 45000, 2, 1, CAST(N'2020-11-26T09:44:29.833' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleBrand] ON 

INSERT [dbo].[VehicleBrand] ([vb_id], [vb_name], [vb_state], [vb_registrationDate], [vb_updateDate], [vb_deleteDate]) VALUES (1, N'CHEVROLET', 1, CAST(N'2020-11-03T18:36:04.993' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[VehicleBrand] OFF
GO
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
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (28, N'NHR', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (29, N'NKR', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (30, N'NFR', NULL, 1, CAST(N'2020-11-13T19:19:39.403' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1001, N'EQUINOX LS/LT', NULL, 1, CAST(N'2020-11-26T18:15:16.330' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1002, N'EQUINOX PREMIER', NULL, 1, CAST(N'2020-11-26T18:15:16.330' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1003, N'NEW CAPTIVA 1.5 TA', NULL, 1, CAST(N'2020-11-26T18:15:16.330' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1004, N'ONIX 1.0 TURBO TA', NULL, 1, CAST(N'2020-11-26T18:15:16.330' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1005, N'ONIX 1.0 TURBO TM', NULL, 1, CAST(N'2020-11-26T18:15:16.330' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[VehicleModel] ([vm_id], [vm_shortName], [vm_longName], [vm_state], [vm_registrationDate], [vm_updateDate], [vm_deleteDate], [vb_id], [vt_id]) VALUES (1006, N'ONIX 1.2 TURBO TA', NULL, 1, CAST(N'2020-11-26T18:15:16.330' AS DateTime), NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[VehicleModel] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleModelsByContract] ON 

INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (9, 17, 6, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (10, 3, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (11, 7, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (12, 8, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (13, 13, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (14, 18, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (15, 17, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (16, 19, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (17, 21, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (18, 22, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (19, 23, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (20, 26, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (21, 27, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (22, 1, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (23, 2, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (24, 4, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (25, 5, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (26, 6, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (27, 9, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (28, 10, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (29, 11, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (30, 12, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (31, 14, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (32, 15, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (33, 16, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (34, 24, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (35, 25, 3, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (112, 25, 5, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1060, 3, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1061, 7, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1062, 8, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1063, 13, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1064, 17, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1065, 1, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1066, 2, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1067, 9, 7, NULL)
INSERT [dbo].[VehicleModelsByContract] ([vmcnt_id], [vm_id], [cntr_id], [vmcnt_registrationDate]) VALUES (1068, 10, 7, NULL)
SET IDENTITY_INSERT [dbo].[VehicleModelsByContract] OFF
GO
SET IDENTITY_INSERT [dbo].[VehiclesByContract] ON 

INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (7, 2, 6)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (8, 1004, 3)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (13, 1005, 5)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1035, 1002, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1036, 1002, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1037, 1008, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1038, 1002, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1039, 1006, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1040, 1008, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1041, 1006, 7)
INSERT [dbo].[VehiclesByContract] ([vehcntr_id], [veh_id], [cntr_id]) VALUES (1042, 1001, 7)
SET IDENTITY_INSERT [dbo].[VehiclesByContract] OFF
GO
SET IDENTITY_INSERT [dbo].[vehicleState] ON 

INSERT [dbo].[vehicleState] ([vs_id], [vs_name], [vs_state], [vs_registrationDate], [vs_updateDate], [vs_deleteDate]) VALUES (1, N'ACTIVO', 1, CAST(N'2020-11-03T21:26:42.087' AS DateTime), NULL, NULL)
INSERT [dbo].[vehicleState] ([vs_id], [vs_name], [vs_state], [vs_registrationDate], [vs_updateDate], [vs_deleteDate]) VALUES (2, N'SINIESTRADO', 1, CAST(N'2020-11-03T21:26:42.087' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[vehicleState] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleType] ON 

INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (1, N'Automóvil', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (2, N'Camioneta', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (3, N'Carga', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
INSERT [dbo].[VehicleType] ([vt_id], [vt_name], [vt_description], [vt_state], [vt_registrationDate], [vt_updateDate], [vt_deleteDate]) VALUES (4, N'Pasajeros', NULL, 1, CAST(N'2020-11-03T18:32:33.263' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[VehicleType] OFF
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
