USE [Telecom]
GO

/****** Object:  Table [dbo].[dim_audit]    Script Date: 4/4/2025 1:35:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dim_audit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batch_id] [int] NULL,
	[package_name] [varchar](20) NULL,
	[file_name] [varchar](50) NULL,
	[rows_extracted] [int] NULL,
	[rows_error] [int] NULL,
	[rows_rejected] [int] NULL,
	[rows_inserted] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[successful_Processing_Ind] [nchar](1) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[dim_audit] ADD  DEFAULT (getdate()) FOR [created_at]
GO

ALTER TABLE [dbo].[dim_audit] ADD  DEFAULT (getdate()) FOR [updated_at]
GO

ALTER TABLE [dbo].[dim_audit] ADD  DEFAULT ('N') FOR [successful_Processing_Ind]
GO


