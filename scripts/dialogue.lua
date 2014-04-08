local script = require( "scripts.script" )
local t = {}
local dialoguebox
local text
t.drawdbox = function(scriptNumber,name)
  dialoguebox = display.newImageRect( "images/dialogue.png", 1000, 200)
  dialoguebox.x = display.contentCenterX
  dialoguebox.y = display.contentHeight - dialoguebox.height/2
  text = t.drawtext(dialoguebox)
  if name == nil then
    name = ""
  end
  text.text = name..script.get(scriptNumber)
  return dialoguebox
end

t.drawtext = function(dialoguebox)
  local options =
  {
    text = "This is a test.",
    anchorX = 0,
    anchorY = 1,
    y = dialoguebox.y - dialoguebox.height/2,
    x = display.contentCenterX,
    width = dialoguebox.width,     --required for multi-line and alignment
    font = native.systemFont,
    fontSize = 32
  }
  local text = display.newText(options)
  text.anchorX = 0.5
  text.anchorY = 0
  text:setFillColor(0.2,0.2,0.8)
  return text
end

t.updatetext = function(dialoguebox, scriptNumber, name)
  if name == nil then
    name = ""
  end
  dialoguebox.text = name..script.get(scriptNumber)
  return text
end

return t

