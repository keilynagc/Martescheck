USE [master]
GO

CREATE DATABASE [martes_db]
GO

USE [martes_db]
GO

CREATE TABLE [dbo].[tUsuario](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[CorreoElectronico] [varchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado]) VALUES (1, N'305070199', N'70199', N'CAMACHO MONGE TIFANNY ANDREA', N'tcamacho70199@ufide.ac.cr', 1)
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado]) VALUES (2, N'206900400', N'00400', N'HERNANDEZ ARAYA JORGE', N'jhernandez00400@ufide.ac.cr', 1)
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE PROCEDURE [dbo].[IniciarSesionUsuario]
	@Identificacion		varchar(20),
    @Contrasenna		varchar(10)
AS
BEGIN

	DECLARE @Estado INT = 1

	SELECT	Consecutivo,Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado
	FROM	dbo.tUsuario
	WHERE	Identificacion = @Identificacion
		AND Contrasenna = @Contrasenna
		AND Estado = @Estado

END
GO

CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Identificacion		varchar(20),
    @Contrasenna		varchar(10),
    @Nombre				varchar(200),
    @CorreoElectronico	varchar(200)    
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM dbo.tUsuario WHERE Identificacion = @Identificacion)
	BEGIN

		DECLARE @Estado INT = 1

		INSERT INTO dbo.tUsuario(Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado)
		VALUES (@Identificacion,@Contrasenna,@Nombre,@CorreoElectronico,@Estado)

	END

END
GO