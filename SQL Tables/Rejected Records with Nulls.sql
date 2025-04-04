USE [Telecom]
GO

/****** Object:  Table [dbo].[Rejected Rows Destination]    Script Date: 4/4/2025 1:40:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rejected Rows Destination](
	[id] [int] NULL,
	[imsi] [varchar](9) NULL,
	[imei] [varchar](14) NULL,
	[cell] [bigint] NULL,
	[lac] [bigint] NULL,
	[event_type] [varchar](1) NULL,
	[event_ts] [datetime] NULL,
	[subscriber_id] [int] NULL,
	[TAC] [varchar](8) NULL,
	[SNR] [varchar](6) NULL,
	[audit_id] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Rejected Rows Destination] ADD  DEFAULT ((-1)) FOR [audit_id]
GO


