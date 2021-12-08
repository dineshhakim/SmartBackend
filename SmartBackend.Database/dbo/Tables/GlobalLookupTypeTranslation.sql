CREATE TABLE [dbo].[GlobalLookupTypeTranslation]
(
	[Id]               UNIQUEIDENTIFIER NOT NULL,
    [GlobalLookupTypeId]     UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (250)    NOT NULL,
    [Description]      NVARCHAR (500)   NULL,
    [Locale]           NVARCHAR (10)    NOT NULL,
    [UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	[IsDeleted] BIT NOT NULL DEFAULT 0, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GlobalLookupTypeTranslation_GlobalLookupType] FOREIGN KEY ([GlobalLookupTypeId]) REFERENCES [dbo].[GlobalLookupType] ([Id]),
    CONSTRAINT [FK_GlobalLookupTypeTranslation_User] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_GlobalLookupTypeTranslation_User1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
