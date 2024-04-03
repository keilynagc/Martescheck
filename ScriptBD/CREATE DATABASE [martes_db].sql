USE [master]
GO

CREATE DATABASE [martes_db]
GO

USE [martes_db]
GO

CREATE TABLE [dbo].[tCarrito](
	[ConsecutivoCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
	[ConsecutivoProducto] [bigint] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_tCarrito] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

CREATE TABLE [dbo].[tRol](
	[ConsecutivoRol] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoRol] ASC
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
	[ConsecutivoRol] [bigint] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tCarrito] ON 
GO
INSERT [dbo].[tCarrito] ([ConsecutivoCarrito], [ConsecutivoUsuario], [ConsecutivoProducto], [FechaCarrito], [Cantidad]) VALUES (1, 2, 19, CAST(N'2024-04-02T20:58:20.870' AS DateTime), 0)
GO
INSERT [dbo].[tCarrito] ([ConsecutivoCarrito], [ConsecutivoUsuario], [ConsecutivoProducto], [FechaCarrito], [Cantidad]) VALUES (2, 2, 20, CAST(N'2024-04-02T20:58:26.670' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[tCarrito] OFF
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
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (19, N'Mouse Inalámbrico', CAST(6500.00 AS Decimal(10, 2)), 8, 1, N'/ImgProductos/19.png', 1)
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (20, N'Teclado', CAST(8000.00 AS Decimal(10, 2)), 6, 1, N'/ImgProductos/20.png', 1)
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (21, N'Teclado', CAST(8000.00 AS Decimal(10, 2)), 6, 1, N'/ImgProductos/20.png', 1)
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (22, N'Teclado', CAST(8000.00 AS Decimal(10, 2)), 6, 1, N'/ImgProductos/20.png', 1)
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (23, N'Teclado', CAST(8000.00 AS Decimal(10, 2)), 6, 1, N'/ImgProductos/20.png', 1)
GO
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[tRol] ON 
GO
INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (2, N'Usuario')
GO
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (1, N'117360383', N'60383', N'AGUERO CALVO KEILYN PAOLA', N'kaguero60383@ufide.ac.cr', 1, 0, CAST(N'2024-03-05T19:39:45.190' AS DateTime), 1)
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (2, N'206900400', N'00400', N'HERNANDEZ ARAYA JORGE', N'jhernandez00400@ufide.ac.cr', 1, 0, CAST(N'2024-03-26T20:36:09.623' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tProducto]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tUsuario]
GO

ALTER TABLE [dbo].[tProducto]  WITH CHECK ADD  CONSTRAINT [FK_tProducto_tCategorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tCategoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[tProducto] CHECK CONSTRAINT [FK_tProducto_tCategorias]
GO

ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([ConsecutivoRol])
REFERENCES [dbo].[tRol] ([ConsecutivoRol])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO

CREATE PROCEDURE [dbo].[ActualizarImagenProducto]
	@Consecutivo	BIGINT,
	@RutaImagen		VARCHAR(200)
AS
BEGIN

	UPDATE dbo.tProducto
	SET RutaImagen = @RutaImagen
	WHERE Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[ActualizarProducto]
	@Consecutivo	BIGINT,
	@NombreProducto	VARCHAR(200),
	@Precio			DECIMAL(10,2),
	@Inventario		INT,
	@IdCategoria	INT   
AS
BEGIN

	UPDATE	dbo.tProducto
	SET		Nombre = @NombreProducto,
			Precio = @Precio,
			Inventario = @Inventario,
			IdCategoria = @IdCategoria
	WHERE	Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
	@Consecutivo		BIGINT,
	@Contrasenna		VARCHAR(10),
	@Nombre				VARCHAR(200),
	@CorreoElectronico	VARCHAR(200)
AS
BEGIN

	UPDATE dbo.tUsuario
	   SET Contrasenna = (CASE WHEN @Contrasenna IS NULL THEN Contrasenna ELSE @Contrasenna END),
		   Nombre = @Nombre,
		   CorreoElectronico = @CorreoElectronico
	 WHERE Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[AgregarCarrito]
	@ConsecutivoUsuario bigint,
	@ConsecutivoProducto bigint,
	@Cantidad	int
AS
BEGIN

	IF NOT EXISTS(	SELECT 1 FROM dbo.tCarrito 
					WHERE	ConsecutivoUsuario = @ConsecutivoUsuario 
					AND		ConsecutivoProducto = @ConsecutivoProducto)
	BEGIN

		INSERT INTO dbo.tCarrito(ConsecutivoUsuario,ConsecutivoProducto,FechaCarrito,Cantidad)
		VALUES (@ConsecutivoUsuario,@ConsecutivoProducto,GETDATE(),@Cantidad)

	END
	ELSE
	BEGIN
		
		UPDATE	dbo.tCarrito
		   SET	FechaCarrito = GETDATE(),
				Cantidad = @Cantidad
		WHERE	ConsecutivoUsuario = @ConsecutivoUsuario 
			AND	ConsecutivoProducto = @ConsecutivoProducto

	END

END
GO

CREATE PROCEDURE [dbo].[ConsultarCarrito]
	@ConsecutivoUsuario BIGINT
AS
BEGIN

	SELECT ConsecutivoCarrito,
		   ConsecutivoUsuario,
		   ConsecutivoProducto,
		   FechaCarrito,
		   Cantidad,
		   Cantidad * Precio 'SubTotal'
	  FROM dbo.tCarrito			C
	  INNER JOIN dbo.tProducto	P	ON C.ConsecutivoProducto = P.Consecutivo
	  WHERE ConsecutivoUsuario = @ConsecutivoUsuario
	
END
GO

CREATE PROCEDURE [dbo].[ConsultarProducto]
	@Consecutivo BIGINT
AS
BEGIN
	SELECT	Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, P.IdCategoria, C.Nombre 'NombreCategoria'
	FROM	tProducto P
	INNER JOIN	tCategoria C ON P.IdCategoria = C.IdCategoria
	WHERE	Consecutivo = @Consecutivo
END
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

create PROCEDURE [dbo].[ConsultarTiposCategoria]

AS
BEGIN

	SELECT	IdCategoria, Nombre 'NombreCategoria'
	FROM	tCategoria

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@Consecutivo BIGINT
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento,U.ConsecutivoRol,R.NombreRol
	FROM	dbo.tUsuario U
	INNER   JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
	WHERE	Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[EliminarProducto]
	@Consecutivo	BIGINT
AS
BEGIN

	UPDATE dbo.tProducto
	SET Estado = 0
	WHERE Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[IniciarSesionUsuario]
	@Identificacion		varchar(20),
    @Contrasenna		varchar(10)
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento,U.ConsecutivoRol,R.NombreRol
	FROM	dbo.tUsuario U
	INNER   JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
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

CREATE PROCEDURE [dbo].[RegistrarProducto]
	@NombreProducto	VARCHAR(200),
	@Precio			DECIMAL(10,2),
	@Inventario		INT,
	@IdCategoria	INT   
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM dbo.tProducto WHERE Nombre = @NombreProducto)
	BEGIN

		INSERT INTO dbo.tProducto(Nombre,Precio,Inventario,Estado,RutaImagen,IdCategoria)
		VALUES (@NombreProducto,@Precio,@Inventario,1,'',@IdCategoria)

		SELECT CONVERT(BIGINT,@@IDENTITY) Consecutivo

	END
	ELSE
	BEGIN
		SELECT CONVERT(BIGINT,-1) Consecutivo
	END

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

		INSERT INTO dbo.tUsuario(Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento,ConsecutivoRol)
		VALUES (@Identificacion,@Contrasenna,@Nombre,@CorreoElectronico,1,0,GETDATE(),2)

	END

END
GO