local en = require( "localization.en" )

local language = string.sub(system.getPreference("locale","language"),1,2):lower()

local PlayerName = ""

local t = {}
t.get = function(script)
  if language == "en" then
    local text = string.gsub( en[script], "NAME", PlayerName )
    return text
  end
end

t.setPlayerName = function(playerName)
  if language == "en" then
    PlayerName = playerName
  end
end

return t