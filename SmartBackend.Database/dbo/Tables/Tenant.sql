CREATE TABLE [dbo].[Tenant] (
    [Id]              UNIQUEIDENTIFIER NOT NULL,
    [Name]            NVARCHAR (255)   NULL,
    [HostAddress]     NVARCHAR (255)   NULL,
    [DefaultLocale]   NVARCHAR (10)    NULL,
    [FavIconUrl]      NVARCHAR (255)   NULL,
    [DefaultTimeZone] NVARCHAR (100)       NULL,
    [DefaultTestReservationIntervalTypeId] int  NULL DEFAULT (1),
	[LookupKey]       NVARCHAR (25)    NULL,
	[UserCreatedById]  UNIQUEIDENTIFIER NULL,
    [CreatedOn]        DATETIME2 (7)    NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	[IsDeleted] BIT NOT NULL DEFAULT ((0)),
    CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Tenant_User] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_Tenant_User1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
    
);







