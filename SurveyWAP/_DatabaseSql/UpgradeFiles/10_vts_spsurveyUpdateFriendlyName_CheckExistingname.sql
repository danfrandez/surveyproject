USE [sp25dev]
GO
/****** Object:  StoredProcedure [dbo].[vts_spSurveyUpdateFriendlyName]    Script Date: 8/21/2017 21:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[vts_spSurveyUpdateFriendlyName]
	@SurveyId int,
	@FriendlyName varchar(200)
AS

DECLARE @test int;
SET @test = 
(select count(*) 
from vts_Tbsurvey 
where friendlyname is not null 
and friendlyname = @FriendlyName)  ;

BEGIN
	--SET NOCOUNT ON;
	
	if (@test = 0)	
	BEGIN
    Update vts_tbSurvey
	set friendlyname=@friendlyname
	where SurveyID = @SurveyId
	END
	
END


