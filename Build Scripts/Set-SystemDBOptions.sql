--  Copyright FineBuild Team © 2011 - 2020.  Distributed under Ms-Pl License

USE MSDB
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[backupset]') AND name = N'IX_backupset_checkpoint_lsn_type_database_name#FB')
	CREATE INDEX [IX_backupset_checkpoint_lsn_type_database_name#FB]	ON [dbo].[backupset] ([checkpoint_lsn], [type],[database_name]) INCLUDE([backup_set_id]);
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[backupset]') AND name = N'IX_backupset_is_damaged_database_name#FB')
	CREATE INDEX [IX_backupset_is_damaged_database_name#FB]			ON [dbo].[backupset] ([is_damaged],[database_name]) INCLUDE ([backup_set_id],[database_backup_lsn], [backup_start_date], [backup_finish_date], [type]);
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[backupset]') AND name = N'IX_backupset_media_set_id#FB')
	CREATE INDEX [IX_backupset_media_set_id#FB]				ON [dbo].[backupset]([media_set_id]) INCLUDE([backup_set_id]);
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[backupset]') AND name = N'IX_restorefile_Restore_history_id#FB')
	CREATE INDEX [IX_restorefile_Restore_history_id#FB]			ON [dbo].[restorefile]([restore_history_id]);
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[backupset]') AND name = N'IX_restorefilegroup_Restore_history_id#FB')
	CREATE INDEX [IX_restorefilegroup_Restore_history_id#FB]		ON [dbo].[restorefilegroup]([restore_history_id]);
GO