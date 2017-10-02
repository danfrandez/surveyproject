USE [sp25dev]
GO
/****** Object:  StoredProcedure [dbo].[vts_spMultiLanguageTextUpdate]    Script Date: 8/20/2017 09:13:11 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Survey Project: (c) 2016, Fryslan Webservices TM (http://survey.codeplex.com)

	NSurvey - The web survey and form engine
	Copyright (c) 2004, 2005 Thomas Zumbrunn. (http://www.nsurvey.org)

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

*/
ALTER PROCEDURE [dbo].[vts_spMultiLanguageTextUpdate] 
			@LanguageItemId int,
			@LanguageCode nvarchar(50),
			@LanguageMessageTypeID int,
			@ItemText nvarchar(max)

AS

-- Updates localized text
UPDATE vts_tbMultiLanguageText
SET 	ItemText = @ItemText
WHERE 
	LanguageItemID = @LanguageItemId AND
	LanguageCode = @LanguageCode AND
	LanguageMessageTypeID = @LanguageMessageTypeID
	
-- If localized text doesnt exist, create it
IF @@rowcount = 0 AND @ItemText is not null
BEGIN
	INSERT INTO vts_tbMultiLanguageText (LanguageItemID, LanguageCode, LanguageMessageTypeID, ItemText)
	VALUES (@LanguageItemId, @LanguageCode, @LanguageMessageTypeID, @ItemText)
END



