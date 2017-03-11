------------------------------------------Overview------------------------------------------
-- Name:             Calculation Functions
-- Notes:            Copyright (c) 2017 Jeremy Gulickson
-- Version:          1.0.03112017
-- Usage:            Functions to simplify common calculation operations.
--
-- Requirements:     FXTS (FXCM Trading Station)
-- Download Link:    http://download.fxcorporate.com/FXCM/FXTS2Install.EXE
-- Documentation:    http://www.fxcodebase.com/bin/products/IndicoreSDK/3.3.0/help/Lua/web-content.htm
--
---------------------------------------Version History--------------------------------------
-- v1.0.11062014:    Initial release
--
--------------------------------------------------------------------------------------------


function Convert_To_USD(aBase_Currency, aAmount)
	-- Only accurate for USD denominated accounts.
	local zOffers_Table = core.host:findTable("offers");
	local zSize_In_USD = 0;
	
	if aBase_Currency == "EUR" then zSize_In_USD = aAmount * zOffers_Table:find("Instrument", "EUR/USD").Bid;
	elseif aBase_Currency == "USD" then zSize_In_USD = aAmount;
	elseif aBase_Currency == "GBP" then zSize_In_USD = aAmount * zOffers_Table:find("Instrument", "GBP/USD").Bid;
	elseif aBase_Currency == "AUD" then zSize_In_USD = aAmount * zOffers_Table:find("Instrument", "AUD/USD").Bid;
	elseif aBase_Currency == "NZD" then zSize_In_USD = aAmount * zOffers_Table:find("Instrument", "NZD/USD").Bid;
	elseif aBase_Currency == "CAD" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/CAD").Bid);
	elseif aBase_Currency == "CHF" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/CHF").Bid);
	elseif aBase_Currency == "HKD" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/HKD").Bid);
	elseif aBase_Currency == "JPY" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/JPY").Bid);
	elseif aBase_Currency == "NOK" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/NOK").Bid);
	elseif aBase_Currency == "SEK" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/SEK").Bid);
	elseif aBase_Currency == "SGD" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/SGD").Bid);
	elseif aBase_Currency == "TRY" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/TRY").Bid);
	elseif aBase_Currency == "ZAR" then zSize_In_USD = aAmount * (1 / zOffers_Table:find("Instrument", "USD/ZAR").Bid);
	else core.host:trace("Convert_To_USD Failed | In Else Clause");
	end
	return zSize_In_USD;
end