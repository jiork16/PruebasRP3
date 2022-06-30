USE [Rp3Test]
GO
/****** Object:  User [rp3test]    Script Date: 30/06/2022 17:23:41 ******/
CREATE USER [rp3test] FOR LOGIN [rp3test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [rp3test]
GO
/****** Object:  Table [dbo].[tbCategory]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCategory](
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPerson]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPerson](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](25) NULL,
	[Name] [varchar](25) NULL,
	[Password] [varchar](25) NULL,
 CONSTRAINT [PK_tbPerson] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTransaction]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTransaction](
	[TransactionId] [int] NOT NULL,
	[TransactionTypeId] [smallint] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[ShortDescription] [varchar](100) NOT NULL,
	[Amount] [numeric](18, 6) NOT NULL,
	[Notes] [varchar](max) NULL,
	[DateUpdate] [datetime] NULL,
 CONSTRAINT [PK_tbTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTransactionType]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTransactionType](
	[TransactionTypeId] [smallint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbTransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (1, N'Alimentación', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (2, N'Transporte', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (3, N'Educación', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (4, N'Salud', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (5, N'Vestuario', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (6, N'Remuneración', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (7, N'Vivienda', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (8, N'Servicios Básicos', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (9, N'Luz', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (10, N'Agua', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (11, N'Teléfono', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (12, N'Renta', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (13, N'Hipoteca', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (14, N'Alícuota', 1)
GO
SET IDENTITY_INSERT [dbo].[tbPerson] ON 
GO
INSERT [dbo].[tbPerson] ([PersonId], [UserName], [Name], [Password]) VALUES (1, N'persona1', N'Jordan', N'1234')
GO
INSERT [dbo].[tbPerson] ([PersonId], [UserName], [Name], [Password]) VALUES (2, N'persona2', N'Alfredo', N'1234')
GO
INSERT [dbo].[tbPerson] ([PersonId], [UserName], [Name], [Password]) VALUES (3, N'persona3', N'Jonathan', N'1234')
GO
SET IDENTITY_INSERT [dbo].[tbPerson] OFF
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (1, 2, 9, 1, CAST(N'2019-01-29T03:32:31.347' AS DateTime), N'Luz del 03/07/2019', CAST(71.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (2, 2, 1, 1, CAST(N'2019-06-16T00:50:18.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(98.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (3, 2, 8, 1, CAST(N'2019-06-12T21:36:53.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(6.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (4, 2, 4, 1, CAST(N'2019-06-23T14:25:56.347' AS DateTime), N'Salud del 03/07/2019', CAST(59.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (5, 2, 9, 1, CAST(N'2019-06-18T01:48:13.347' AS DateTime), N'Luz del 03/07/2019', CAST(73.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (6, 2, 1, 1, CAST(N'2019-06-26T22:13:35.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(35.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (7, 2, 5, 1, CAST(N'2019-06-27T20:40:00.347' AS DateTime), N'Vestuario del 03/07/2019', CAST(45.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (8, 2, 5, 1, CAST(N'2019-06-20T06:19:12.347' AS DateTime), N'Vestuario del 03/07/2019', CAST(39.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (9, 2, 8, 1, CAST(N'2019-06-07T09:39:31.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(29.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (10, 2, 9, 1, CAST(N'2019-06-09T13:13:13.347' AS DateTime), N'Luz del 03/07/2019', CAST(10.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (11, 2, 7, 2, CAST(N'2019-06-15T17:04:59.347' AS DateTime), N'Vivienda del 03/07/2019', CAST(86.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (12, 2, 7, 2, CAST(N'2019-07-01T18:22:39.347' AS DateTime), N'Vivienda del 03/07/2019', CAST(40.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (13, 1, 6, 2, CAST(N'2019-06-08T14:01:49.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(235.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (14, 2, 1, 2, CAST(N'2019-06-19T10:57:30.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(18.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (15, 1, 6, 2, CAST(N'2019-06-11T21:19:32.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(470.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (16, 2, 4, 2, CAST(N'2019-06-08T02:41:00.347' AS DateTime), N'Salud del 03/07/2019', CAST(98.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (17, 1, 6, 2, CAST(N'2019-06-06T11:12:55.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(365.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (18, 2, 2, 2, CAST(N'2019-06-25T06:12:05.347' AS DateTime), N'Transporte del 03/07/2019', CAST(8.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (19, 2, 2, 2, CAST(N'2019-06-16T15:08:15.347' AS DateTime), N'Transporte del 03/07/2019', CAST(37.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (20, 2, 8, 2, CAST(N'2019-06-14T08:44:01.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(41.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (21, 2, 1, 3, CAST(N'2019-06-28T19:40:10.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(53.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (22, 2, 1, 3, CAST(N'2019-06-07T22:36:57.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(74.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (23, 2, 2, 3, CAST(N'2019-06-10T12:32:54.347' AS DateTime), N'Transporte del 03/07/2019', CAST(3.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (24, 2, 3, 3, CAST(N'2019-06-12T09:01:53.347' AS DateTime), N'Educación del 03/07/2019', CAST(72.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (25, 2, 5, 3, CAST(N'2019-06-08T16:25:39.347' AS DateTime), N'Vestuario del 03/07/2019', CAST(83.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (26, 1, 6, 3, CAST(N'2019-06-25T15:16:22.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(115.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (27, 2, 8, 3, CAST(N'2019-06-17T09:14:30.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(83.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (28, 2, 3, 3, CAST(N'2019-07-01T06:01:11.347' AS DateTime), N'Educación del 03/07/2019', CAST(12.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (29, 2, 3, 3, CAST(N'2019-06-29T15:04:55.347' AS DateTime), N'Educación del 03/07/2019', CAST(72.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (30, 2, 4, 3, CAST(N'2019-06-17T16:57:57.347' AS DateTime), N'Salud del 03/07/2019', CAST(30.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (31, 1, 1, 1, CAST(N'2022-06-30T00:00:00.000' AS DateTime), N'Ninguna9', CAST(46.000000 AS Numeric(18, 6)), NULL, NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (32, 2, 9, 1, CAST(N'2022-06-29T00:00:00.000' AS DateTime), N'xq si', CAST(120.630000 AS Numeric(18, 6)), N'pagar', NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (33, 1, 9, 1, CAST(N'2022-06-25T00:00:00.000' AS DateTime), N'erewrer', CAST(2424.000000 AS Numeric(18, 6)), N'rwrwrw', NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (34, 1, 9, 1, CAST(N'2022-06-25T00:00:00.000' AS DateTime), N'erewrer', CAST(2424.000000 AS Numeric(18, 6)), N'rwrwrw', NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (35, 1, 5, 1, CAST(N'2022-01-03T00:00:00.000' AS DateTime), N'sqsq', CAST(3.000000 AS Numeric(18, 6)), N'sqsqs', NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (36, 1, 5, 1, CAST(N'2022-06-30T16:43:48.613' AS DateTime), N'q', CAST(1.000000 AS Numeric(18, 6)), N'w', NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (37, 2, 1, 1, CAST(N'2022-06-30T16:44:12.693' AS DateTime), N'df', CAST(1.000000 AS Numeric(18, 6)), N'd', NULL)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [PersonId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate]) VALUES (38, 2, 5, 1, CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'frg', CAST(1.000000 AS Numeric(18, 6)), N'rt', NULL)
GO
INSERT [dbo].[tbTransactionType] ([TransactionTypeId], [Name]) VALUES (1, N'INGRESOS')
GO
INSERT [dbo].[tbTransactionType] ([TransactionTypeId], [Name]) VALUES (2, N'GASTOS')
GO
ALTER TABLE [dbo].[tbTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tbTransaction_tbCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tbTransaction] CHECK CONSTRAINT [FK_tbTransaction_tbCategory]
GO
ALTER TABLE [dbo].[tbTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tbTransaction_tbPerson] FOREIGN KEY([PersonId])
REFERENCES [dbo].[tbPerson] ([PersonId])
GO
ALTER TABLE [dbo].[tbTransaction] CHECK CONSTRAINT [FK_tbTransaction_tbPerson]
GO
ALTER TABLE [dbo].[tbTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tbTransaction_tbTransactionType] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[tbTransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[tbTransaction] CHECK CONSTRAINT [FK_tbTransaction_tbTransactionType]
GO
/****** Object:  StoredProcedure [dbo].[FillRandomData]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillRandomData]
AS

TRUNCATE TABLE dbo.tbTransaction;

DECLARE @FechaInicial DATETIME;
DECLARE @FechaFinal DATETIME;

DECLARE @FechaProceso DATETIME;
DECLARE @CategoryId INT;
DECLARE @TypeId INT;
DECLARE @Description VARCHAR(500);

SET @FechaInicial = DATEADD(DAY, -30, GETDATE());
SET @FechaFinal = GETDATE() - 1;

SET @FechaProceso = @FechaInicial;

DECLARE @Amount MONEY;

DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT;

DECLARE @Id INT;
SET @Id = 1;

DECLARE @Contador INT;
DECLARE @Limite INT;

SET @Contador = 0;
SET @Limite = 30;

WHILE (@Contador < @Limite)
BEGIN

    ---- This will create a random number between 1 and 999
    SET @Lower = 1; ---- The lowest random number
    SET @Upper = 10; ---- The highest random number
    SELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower), 0);

    SET @CategoryId = @Random;

    SELECT @Description = Name + ' del ' + CONVERT(VARCHAR, GETDATE(), 103)
    FROM dbo.tbCategory
    WHERE CategoryId = @CategoryId;

    SET @Lower = 100; ---- The lowest random number
    SET @Upper = 200; ---- The highest random number
    SELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower) / 100, 0);

    SET @TypeId = @Random;


    SET @Lower = 2; ---- The lowest random number
    SET @Upper = 100; ---- The highest random number
    SELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower), 0);

    SET @Amount = @Random;

    DECLARE @Seconds INT = DATEDIFF(SECOND, @FechaInicial, @FechaFinal);
    SET @Random = ROUND(((@Seconds - 1) * RAND()), 0);

    SELECT @FechaProceso = DATEADD(SECOND, @Random, @FechaInicial);


	IF @CategoryId = 6
	BEGIN
		SET @TypeId = 1
		SET @Amount = @Amount * 5
	END
	ELSE
		SET @TypeId = 2


    INSERT INTO dbo.tbTransaction
    (
        TransactionId,
        TransactionTypeId,
        CategoryId,
        RegisterDate,
        ShortDescription,
        Amount,
        Notes
    )
    VALUES
    (   @Id,           -- TransactionId - int
        @TypeId,       -- TransactionTypeId - smallint
        @CategoryId,   -- CategoryId - int
        @FechaProceso, -- RegisterDate - datetime
        @Description,  -- ShortDescription - varchar(100)
        @Amount,       -- Amount - numeric(18, 6)
        NULL);

    SET @Id = @Id + 1;
    SET @Contador = @Contador + 1;

END;
GO
/****** Object:  StoredProcedure [dbo].[spGetBalance]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetBalance] (@personId  int= null)
AS
BEGIN
	select * from (select TOP (SELECT COUNT(1) FROM tbTransaction) b.Name, SUM(a.Amount)Amount 
	from tbTransaction a join tbCategory b on a.CategoryId=b.CategoryId
	join tbTransactionType c on a.TransactionTypeId =c.TransactionTypeId
	where c.TransactionTypeId=1 and a.personId = ISNULL(@personId,a.personId)
	group by b.Name order by  SUM(a.Amount) desc) as a 
	union all
select * from  (select TOP (SELECT COUNT(1) FROM tbTransaction) b.Name, SUM(a.Amount)*-1 Amount 
	from tbTransaction a join tbCategory b on a.CategoryId=b.CategoryId
	join tbTransactionType c on a.TransactionTypeId =c.TransactionTypeId
	where c.TransactionTypeId=2 and a.personId= ISNULL(@personId,a.personId)
	group by b.Name order by SUM(a.Amount)*-1 asc)as  b
END
GO
/****** Object:  StoredProcedure [dbo].[spTransactionInsert]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransactionInsert]
@infoXml XML
AS
BEGIN

	/*
	Complete the code for Insert to dbo.tbTransaction Table

	Code XML SELECT EXAMPLE:

	SELECT 
	TransactionId = T.info.value('@ TransactionId','int'),
	TransactionTypeId = T.info.value('@ TransactionTypeId','smallint'),
	CategoryId = T.info.value('@ CategoryId','int'),
	RegisterDate = T.info.value('@ RegisterDate','datetime'),
	ShortDescription = T.info.value('@ ShortDescription','varchar(100)'),
	Notes = T.info.value('@ Notes','varchar(max)')
    FROM    @infoXml.nodes('Transaction')
                        AS T ( info ); 
	*/

	RETURN 0;

END
GO
/****** Object:  StoredProcedure [dbo].[spTransactionUpdate]    Script Date: 30/06/2022 17:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransactionUpdate]
@infoXml XML
AS
BEGIN
	
	/*
	Complete the code for Update to dbo.tbTransaction Table

	Code XML SELECT EXAMPLE:

	SELECT 
	TransactionId = T.info.value('@ TransactionId','int'),
	TransactionTypeId = T.info.value('@ TransactionTypeId','smallint'),
	CategoryId = T.info.value('@ CategoryId','int'),
	RegisterDate = T.info.value('@ RegisterDate','datetime'),
	ShortDescription = T.info.value('@ ShortDescription','varchar(100)'),
	Notes = T.info.value('@ Notes','varchar(max)')
    FROM    @infoXml.nodes('Transaction')
                        AS T ( info ); 
	*/
	RETURN 0;
END
GO
