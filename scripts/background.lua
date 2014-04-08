local widget = require( "widget" )
--====================================================================--
-- PROGRAM: [Background Controller]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [Background Controller handles how backgrounds are displayed.]

--]]

local t = {}

t.createbg = function(filename)
    local background = display.newImageRect( "backgrounds/"..filename, 1425, 900)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    return background
end

t.createbutton = function(defaultFile, overFile, width, height, label, font, fontSize, onEvent)
  local tempLabel = label or false
  if ( tempLabel ) then
      label = tempLabel
  end
  local tempEvent = onEvent or false
  if ( tempEvent ) then
      onEvent = tempEvent
  end
  local tempFont = font or false
  if ( tempFont ) then
      font = tempFont
  end
  local tempFontSize = fontSize or false
  if ( tempFontSize ) then
      fontSize = tempFontSize
  end
  local options =
  {
    id = id,
    defaultFile = "images/"..defaultFile,
    overFile = "images/"..overFile,
    label = label,
    onEvent = onEvent,
    font = font,
    fontSize = fontSize
  }
  local button = widget.newButton(options)
  return button
end

t.createdialoguebox = function ()
  
end

return t
