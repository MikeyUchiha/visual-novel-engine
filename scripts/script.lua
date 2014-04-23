local en = require( "localization.en" )
--====================================================================--
-- PROGRAM: [Script Controller]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [Script Controller handles reading the correct localization file depending
  on the correct language setting.]

--]]

local language = string.sub(system.getPreference("locale","language"),1,2):lower()

local PlayerName = ""

local script = {}
script.get = function(script)
  if language == "en" then
    local text = string.gsub( en[script], "NAME", PlayerName )
    return text
  end
end

script.setPlayerName = function(playerName)
  if language == "en" then
    PlayerName = playerName
  end
end

return script