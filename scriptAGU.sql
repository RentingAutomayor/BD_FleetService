USE [DB_FleetService]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 29/03/2021 10:07:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[act_id] [int] IDENTITY(1,1) NOT NULL,
	[act_name] [varchar](50) NOT NULL,
	[act_description] [varchar](150) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[act_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 29/03/2021 10:07:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[grp_id] [int] IDENTITY(1,1) NOT NULL,
	[grp_name] [varchar](50) NOT NULL,
	[grp_description] [varchar](150) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/03/2021 10:07:56 a. m. ******/
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
	[activo] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
