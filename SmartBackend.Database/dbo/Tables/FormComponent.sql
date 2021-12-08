CREATE TABLE [dbo].[FormComponent]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(255) NOT NULL,
	[Description] NVARCHAR( MAX) NULL,
	[Version] INT  NULL,
	[EntityIdentifierId] UNIQUEIDENTIFIER  NULL,
	[GetValuesApiUrl] Nvarchar(500) NULL,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponent_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[TitanUser] ([Id]),
    CONSTRAINT [FK_FormComponent_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[TitanUser] ([Id])

)
