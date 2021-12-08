CREATE TABLE [dbo].[GlobalLookupTranslation]
(
	[Id]               UNIQUEIDENTIFIER NOT NULL,
    [GlobalLookupId]     UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (250)    NOT NULL,
    [Description]      NVARCHAR (500)   NULL,
    [Locale]           NVARCHAR (10)    NOT NULL,
    [UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	[IsDeleted] BIT NOT NULL DEFAULT 0, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GlobalLookupTranslation_GlobalLookup] FOREIGN KEY ([GlobalLookupId]) REFERENCES [dbo].[GlobalLookup] ([Id]),
    CONSTRAINT [FK_GlobalLookupTranslation_User] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_GlobalLookupTranslation_User1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
