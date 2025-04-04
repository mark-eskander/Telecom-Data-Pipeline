USE [Telecom]
GO

/****** Object:  Table [dbo].[Fact Transactions]    Script Date: 4/4/2025 1:40:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact Transactions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_id] [int] NOT NULL,
	[IMSI] [varchar](9) NOT NULL,
	[subscriber_id] [int] NOT NULL,
	[TAC] [varchar](8) NOT NULL,
	[SNR] [varchar](6) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[CELL] [int] NOT NULL,
	[LAC] [int] NOT NULL,
	[EVENT_TYPE] [varchar](2) NULL,
	[EVENT_TS] [datetime] NOT NULL,
	[audit_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fact Transactions] ADD  DEFAULT ((-1)) FOR [audit_id]
GO


