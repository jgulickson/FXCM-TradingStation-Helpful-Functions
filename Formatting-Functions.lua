------------------------------------------Overview------------------------------------------
-- Name:             Formatting Functions
-- Notes:            Copyright (c) 2017 Jeremy Gulickson
-- Version:          1.1.04122017
-- Usage:            Functions to simplify common formatting operations.
--
-- Requirements:     FXTS (FXCM Trading Station)
-- Download Link:    http://download.fxcorporate.com/FXCM/FXTS2Install.EXE
-- Documentation:    http://www.fxcodebase.com/bin/products/IndicoreSDK/3.3.0/help/Lua/web-content.htm
--
---------------------------------------Version History--------------------------------------
-- v1.0.11062014:    -> Initial release
--
-- v1.1.04122017:    -> Added Format_Thousands()
--------------------------------------------------------------------------------------------


function Format_Precision(aInput, aDecimals)
	return string.format("%." .. aDecimals .. "f", aInput);
end


function Format_Percentage(aInput, aDecimals)
	return string.format("%." .. aDecimals .. "f", aInput) .. "%";
end


function Format_Pips(aInput, aDecimals)
	return  string.format("%." .. aDecimals .. "f", aInput) .. " pips";
end


function Format_AmountK(aInput, aDecimals)
	return string.format("%." .. aDecimals .. "f", aInput) .. "K";
end


function Format_Leverage(aInput, aDecimals)
	return string.format("%." .. aDecimals .. "f", aInput) .. ":1";
end


function Format_Financial(aInput, aDecimals)
	-- Sourced from http://www.gammon.com.au/forum/?id=7805
	aInput = string.format("%." .. aDecimals .. "f", aInput);
	
	local zResult = "";
	local zSign, zBefore, zAfter = string.match(tostring(aInput), "^([%+%-]?)(%d*)(%.?.*)$")
	while string.len(zBefore) > 3 do
		zResult = "," .. string.sub(zBefore, -3, -1) .. zResult;
		zBefore = string.sub(zBefore, 1, -4);
	end
	
	return "$" .. zSign .. zBefore .. zResult .. zAfter;
end


function Format_Thousands(aInput, aDecimals)
	-- Sourced from http://www.gammon.com.au/forum/?id=7805
	aInput = string.format("%." .. aDecimals .. "f", aInput);
	
	local zResult = "";
	local zSign, zBefore, zAfter = string.match(tostring(aInput), "^([%+%-]?)(%d*)(%.?.*)$")
	while string.len(zBefore) > 3 do
		zResult = "," .. string.sub(zBefore, -3, -1) .. zResult;
		zBefore = string.sub(zBefore, 1, -4);
	end
	
	return zSign .. zBefore .. zResult .. zAfter;
end


function Format_Instrument(aInstrument, aInvalid_Character, aValid_Character)
	if string.match(aInstrument, aInvalid_Character) ~= nil then
		aInstrument = string.gsub(oInstrument, aInvalid_Character, aValid_Character);
	else
		core.host:trace("Format_Instrument() Failed | In Else Clause");
	end
	return aInstrument;
end


function Format_Direction(aCode)
	local zDirecton = nil;
	
	if aCode == "B" then zDirecton = "Buy";
	elseif aCode == "S" then zDirecton = "Sell";
	else
		zDirecton = "-";
		core.host:trace("Format_Direction() Failed | In Else Clause");
	end
	return zDirecton;
end


function Format_Margin_Call_Status(aCode)
	local zStatus = nil;
	
	if aCode == "Y" then zStatus = "Yes";
	elseif aCode == "W" then zStatus = "Warning";
	elseif aCode == "Q" then zStatus = "Equity Stop";
	elseif aCode == "A" then zStatus = "Equity Alert";
	elseif aCode == "N" then zStatus = "No";
	else
		zStatus = "-";
		core.host:trace("Format_Margin_Call_Status() Failed | In Else Clause");
	end
	return zStatus;
end