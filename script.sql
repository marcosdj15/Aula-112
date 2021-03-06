USE [cursomvc]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 21/07/2016 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aluno](
	[AlunoID] [int] IDENTITY(1,1) NOT NULL,
	[AlunoNome] [varchar](100) NOT NULL,
	[AssuntoID] [int] NOT NULL,
	[DepartamentoID] [int] NOT NULL,
 CONSTRAINT [PK_Aluno] PRIMARY KEY CLUSTERED 
(
	[AlunoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Aluno_Materia]    Script Date: 21/07/2016 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aluno_Materia](
	[AlunoMateriaID] [int] IDENTITY(1,1) NOT NULL,
	[AlunoID] [int] NOT NULL,
	[MateriaID] [int] NOT NULL,
 CONSTRAINT [PK_Aluno_Materia] PRIMARY KEY CLUSTERED 
(
	[AlunoMateriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[assunto]    Script Date: 21/07/2016 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[assunto](
	[AssuntoID] [int] IDENTITY(1,1) NOT NULL,
	[DescAssunto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_assunto] PRIMARY KEY CLUSTERED 
(
	[AssuntoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 21/07/2016 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departamento](
	[DepartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoNome] [varchar](100) NOT NULL,
	[DepartamentoSigla] [nchar](10) NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[materia]    Script Date: 21/07/2016 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[materia](
	[MateriaID] [int] IDENTITY(1,1) NOT NULL,
	[MateriaNome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_materia] PRIMARY KEY CLUSTERED 
(
	[MateriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefone]    Script Date: 21/07/2016 19:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefone](
	[TelefoneID] [int] IDENTITY(1,1) NOT NULL,
	[TelefoneDDD] [int] NOT NULL,
	[TelefoneNumero] [int] NOT NULL,
	[AlunoID] [int] NOT NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[TelefoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_aluno_assunto] FOREIGN KEY([AssuntoID])
REFERENCES [dbo].[assunto] ([AssuntoID])
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_aluno_assunto]
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_departamento] FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[departamento] ([DepartamentoID])
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_Aluno_departamento]
GO
ALTER TABLE [dbo].[Aluno_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Materia_Aluno] FOREIGN KEY([AlunoID])
REFERENCES [dbo].[Aluno] ([AlunoID])
GO
ALTER TABLE [dbo].[Aluno_Materia] CHECK CONSTRAINT [FK_Aluno_Materia_Aluno]
GO
ALTER TABLE [dbo].[Aluno_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Materia_materia] FOREIGN KEY([MateriaID])
REFERENCES [dbo].[materia] ([MateriaID])
GO
ALTER TABLE [dbo].[Aluno_Materia] CHECK CONSTRAINT [FK_Aluno_Materia_materia]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [FK_Telefone_Aluno] FOREIGN KEY([AlunoID])
REFERENCES [dbo].[Aluno] ([AlunoID])
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [FK_Telefone_Aluno]
GO
