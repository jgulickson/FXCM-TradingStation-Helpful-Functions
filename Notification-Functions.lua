------------------------------------------Overview------------------------------------------
-- Name:             Notification Functions
-- Notes:            Copyright (c) 2017 Jeremy Gulickson
-- Version:          1.0.03112017
-- Usage:            Functions to simplify common notification operations.
--
-- Requirements:     FXTS (FXCM Trading Station)
-- Download Link:    http://download.fxcorporate.com/FXCM/FXTS2Install.EXE
-- Documentation:    http://www.fxcodebase.com/bin/products/IndicoreSDK/3.3.0/help/Lua/web-content.htm
--
---------------------------------------Version History--------------------------------------
-- v1.0.11062014:    Initial release
--
--------------------------------------------------------------------------------------------


function Send_Notification(aType, aSymbol, aOpen, aMessage, aTime, aEmailAddress)
	if aType == "Alert" then
		terminal:alertMessage(aSymbol, aOpen, aMessage, aTime);
	elseif aType == "Trace" then
		core.host:trace(aMessage);
	elseif aType == "Email" then
		local zTime_In_Table = core.dateToTable(aTime);
		local zDate = string.format("%02i/%02i/%02i", zTime_In_Table.month, zTime_In_Table.day, zTime_In_Table.year);
		local zTime =string.format("%02i:%02i", zTime_In_Table.hour, zTime_In_Table.min);
		terminal:alertEmail(aEmailAddress, "ADD TEXT HERE " .. zDate .. " at " .. zTime, aMessage);
	else
		core.host:trace("Send_Notification() Failed | In Else Clause");
	end
end