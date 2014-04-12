-- dialogue.lua
local script = require( "scripts.script" )
local dialogue = {}

-- Create the text object for the dialogue box
local function drawtext(group, box, scriptNumber, name)

  local name = name or ""

  local options = {
    parent  = group,
    text    = "This is a test.",
    width   = box.width,
    font    = native.systemFont,
    fontSize = 32,
  }

  local text = display.newText(options)
  text.anchorX = 0
  text.anchorY = 0
  text.x = box.x
  text.y = box.y
  text:setFillColor(0.2,0.2,0.8)
  
  text.text = name..script.get(scriptNumber)

  return text
end

-- Update the text of a dialogue box
local function updatetext(box, scriptNumber, name)
  local name = name or ""
  box.text.text = name..script.get(scriptNumber)
end

-- Create the text dialogue box
function dialogue.drawdbox(scriptNumber, name)

  local group = display.newGroup()
  group.anchorChildren = true

  local box = display.newImageRect(group, "images/dialogue.png", 1000, 200)
  box.anchorX = 0
  box.anchorY = 0

  local name = name or ""

  local text = drawtext(group, box, scriptNumber, name)

  -- Shortcuts
  group.box = box -- this way you never have to look for group[1], etc.
  group.text = text
  group.updatetext = updatetext -- to call, use object:updatetext()

  -- Set position
  group.anchorX = 0.5
  group.anchorY = 1
  group.x = display.contentCenterX
  group.y = display.contentHeight
  return group
end

return dialogue
