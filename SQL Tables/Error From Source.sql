USE [Telecom]
GO

/****** Object:  Table [dbo].[Error From Source]    Script Date: 4/4/2025 1:39:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Error From Source](
	[Data Row] [varchar](max) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL,
	[audit_id] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Error From Source] ADD  DEFAULT ((-1)) FOR [audit_id]
GO


