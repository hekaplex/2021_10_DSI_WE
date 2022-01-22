USE [Capstone]
GO

/****** Object:  Table [dbo].[AAPL]    Script Date: 11/12/2021 5:48:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AAPL](
	[Date] [date] NOT NULL,
	[Open] [money] NOT NULL,
	[High] [money] NOT NULL,
	[Low] [money] NOT NULL,
	[Close] [money] NOT NULL,
	[Adj_Close] [money] NOT NULL,
	[Volume] [int] NOT NULL
) ON [PRIMARY]
GO


