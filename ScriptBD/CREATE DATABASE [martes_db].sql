USE [master]
GO

CREATE DATABASE [martes_db]
GO

USE [martes_db]
GO

CREATE TABLE [dbo].[tCategoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tCategorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tProducto](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Inventario] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[RutaImagen] [varchar](200) NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tUsuario](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[CorreoElectronico] [varchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Temporal] [bit] NOT NULL,
	[Vencimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tCategoria] ON 
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1, N'Periféricos')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (2, N'Procesadores')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (3, N'Almacenamiento')
GO
SET IDENTITY_INSERT [dbo].[tCategoria] OFF
GO

SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (1, N'Mouse', CAST(5000.00 AS Decimal(10, 2)), 5, 1, N'PRUEBA', 1)
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (2, N'Intel', CAST(30000.00 AS Decimal(10, 2)), 3, 1, N'PRUEBA', 2)
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (3, N'SSD', CAST(15000.00 AS Decimal(10, 2)), 0, 1, N'PRUEBA', 3)
GO
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento]) VALUES (1, N'305070199', N'B20ED438', N'CAMACHO MONGE TIFANNY ANDREA', N'tcamacho70199@ufide.ac.cr', 1, 1, CAST(N'2024-02-20T20:14:54.033' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tProducto]  WITH CHECK ADD  CONSTRAINT [FK_tProducto_tCategorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tCategoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[tProducto] CHECK CONSTRAINT [FK_tProducto_tCategorias]
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]
	@MostrarTodos BIT
AS
BEGIN

	IF(@MostrarTodos = 1)
	BEGIN
		SELECT	Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, P.IdCategoria, C.Nombre 'NombreCategoria'
		FROM	tProducto P
		INNER JOIN	tCategoria C ON P.IdCategoria = C.IdCategoria
	END
	ELSE
	BEGIN
		SELECT	Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, P.IdCategoria, C.Nombre 'NombreCategoria'
		FROM	tProducto P
		INNER JOIN	tCategoria C ON P.IdCategoria = C.IdCategoria
		WHERE	Inventario > 0
			AND Estado = 1
	END
END
GO

CREATE PROCEDURE [dbo].[IniciarSesionUsuario]
	@Identificacion		varchar(20),
    @Contrasenna		varchar(10)
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento
	FROM	dbo.tUsuario
	WHERE	Identificacion = @Identificacion
		AND Contrasenna = @Contrasenna
		AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[RecuperarAccesoUsuario]
	@Identificacion		varchar(20),
    @CorreoElectronico	varchar(200)
AS
BEGIN

	DECLARE @Consecutivo BIGINT

	SELECT	@Consecutivo = Consecutivo
	FROM	dbo.tUsuario WHERE	Identificacion = @Identificacion 
						AND CorreoElectronico = @CorreoElectronico
						AND Estado = 1

	IF @Consecutivo IS NOT NULL
	BEGIN
		UPDATE	tUsuario
		SET		Contrasenna = LEFT(NEWID(),8),
				Temporal = 1,
				Vencimiento = DATEADD(HOUR, 1, GETDATE())  
		WHERE	Consecutivo = @Consecutivo
	END

	SELECT	Consecutivo,Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento
	FROM	dbo.tUsuario
	WHERE	Consecutivo = @Consecutivo

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

		INSERT INTO dbo.tUsuario(Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento)
		VALUES (@Identificacion,@Contrasenna,@Nombre,@CorreoElectronico,1,0,GETDATE())

	END

END
GO