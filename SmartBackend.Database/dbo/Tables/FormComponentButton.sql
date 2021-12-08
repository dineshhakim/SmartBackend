﻿CREATE TABLE [dbo].[FormComponentButton]
(
	[Id] UniqueIdentifier NOT NULL PRIMARY KEY,
	[FormComponentId] uniqueIdentifier NULL,
	[ClassName] nvarchar(255) NULL,
	[ToolTipText] nvarchar(255) NULL,
	[ToolTipPosition] nvarchar(255) NULL,
	[Icon] nvarchar(255) NULL,
	[Label] nvarchar(255) NULL,
	[Name] nvarchar(255) NULL,
	[Show] BIT NULL,
	[RedirectUrl] nvarchar(500) NULL,
	[Fragment] nvarchar(500) NULL,
	[Params] nvarchar(500) NULL,
	[PostUrl] nvarchar(500) NULL,
	[ToShowUrl] nvarchar(500) NULL,
	[DisplayOrder] INT NULL,
	[IsShowOnCreate] BIT NULL DEFAULT 0,
	[IsShowOnUpdate] BIT NULL DEFAULT 0,
	[IsDeleted]        BIT              NOT NULL DEFAULT 0,
	[UserCreatedById]  UNIQUEIDENTIFIER NOT NULL,
    [CreatedOn]        DATETIME2 (7)    NOT NULL,
    [UserModifiedById] UNIQUEIDENTIFIER NULL,
    [ModifiedOn]       DATETIME2 (7)    NULL,
	CONSTRAINT [FK_FormComponentButton_TitanUser] FOREIGN KEY ([UserCreatedById]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_FormComponentButton_TitanUser1] FOREIGN KEY ([UserModifiedById]) REFERENCES [dbo].[User] ([Id])
)
