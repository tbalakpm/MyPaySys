CREATE DATABASE [MyPay]
GO

USE [MyPay]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[PhoneNumber] [varchar](25) NULL,
	[Active] [bit] NOT NULL,
	[ImagePath] [varchar](255) NULL,
 CONSTRAINT [PK_dbo.Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Department]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Designation]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Doj] [datetime] NULL,
	[Dob] [datetime] NULL,
	[ReportingId] [int] NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ContactNumber] [varchar](25) NOT NULL,
	[Dor] [datetime] NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Pincode] [varchar](10) NULL,
	[BasicPay] [money] NOT NULL,
	[Hra] [money] NOT NULL,
	[Conveyance] [money] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[ImagePath] [varchar](255) NULL,
 CONSTRAINT [PK_dbo.Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[EmployeeAttendance]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAttendance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[InTime] [datetime] NOT NULL,
	[LunchBeginTime] [datetime] NOT NULL,
	[LunchEndTime] [datetime] NOT NULL,
	[OutTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeeAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[SalarySetting]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalarySetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[GraceTime] [varchar](5) NULL,
	[InLunchBreakTime] [varchar](5) NULL,
	[OutLunchBreakTime] [varchar](5) NULL,
	[LeaveAllowed] [int] NOT NULL,
	[BonusStartMonth] [int] NOT NULL,
	[DiwaliBonusPercent] [int] NOT NULL,
	[PongalBonusPercent] [int] NOT NULL,
	[BonusIncrement] [money] NOT NULL,
 CONSTRAINT [PK_dbo.SalarySetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[SalarySlab]    Script Date: 16/07/2016 13:26:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalarySlab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Component] [varchar](25) NULL,
	[Time] [nvarchar](5) NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_dbo.SalarySlab] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Employee_dbo.Company_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_dbo.Employee_dbo.Company_CompanyId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Employee_dbo.Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_dbo.Employee_dbo.Department_DepartmentId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Employee_dbo.Designation_DesignationId] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_dbo.Employee_dbo.Designation_DesignationId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Employee_dbo.Employee_ReportingId] FOREIGN KEY([ReportingId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_dbo.Employee_dbo.Employee_ReportingId]
GO
ALTER TABLE [dbo].[EmployeeAttendance]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmployeeAttendance_dbo.Employee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeAttendance] CHECK CONSTRAINT [FK_dbo.EmployeeAttendance_dbo.Employee_EmployeeId]
GO
