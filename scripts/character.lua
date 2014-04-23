--====================================================================--
-- PROGRAM: [Character Controller]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [Character Controller handles displaying the portrait sized characters and
  avatar characters as well as their appropriate alignments.]

--]]

local character = {}

local orientation = { "center", "left", "right" }

function character.make( filename, width, height )
  local characterimage = display.newImageRect( "images/"..filename, width, height )
  characterimage.x = display.contentCenterX
  characterimage.y = display.contentCenterY
  characterimage.alpha = 0
  return characterimage
end

function character:addcharacter(characterimage, orientation )
  if self.character1 == nil then
    print("self.character1 is nil")
    self.character1 = characterimage
    self.character1:toBack()
  else
    print("In the else statement of addchar")
    character:setOrientation(characterimage, orientation)
    self.character2 = characterimage
    transition.to( self.character2, { time=500, alpha=1.0 } )
    self.character2:toBack()
  end
end

function character:removecharacter(number)
  if number == 1 then
    self.character1:removeSelf()
  end
  if number == 2 then
    if self.character2 == nil then
      print("there's no self.character2")
    else
      self.character2:removeSelf()
      print("showing self.character2")
      print(self.character2)
    end
  end
end

function character:changecharacter(characterimage, number, orientation)
  --This function does not currently work correctly. Try getting some help to fix.
  character:removecharacter(number)
  character:addcharacter(characterimage , orientation)
end

function character.entercharacter( characterimage, orientation )
  local group = display.newGroup()
  group.anchorChildren = true
  
  transition.to( characterimage, { time=500, delay = 1000, alpha=1.0 } )
  character:setOrientation(characterimage, orientation)
  
  group.character1 = characterimage
  group.character1:toBack()
  
  group.addcharacter = character.addcharacter
  group.removecharacter = character.removecharacter
  group.changecharacter = character.changecharacter
  group.setOrientation = character.setOrientation
  
  return group
end

local function getOrientation( orientation )
  if orientation == "left" or 2 then
    return character.orientation[2]
  elseif orientation == "right" or 3 then
    return character.orientation[3]
  else
    return character.orientation[1]
  end
end

function character:setOrientation(character, orientation )
  print(character)
  print(orientation)
  if orientation == "left" then
    character.anchorX = 0
    character.x = 0
  elseif orientation == "right" then
    character.anchorX = 0
    character.xScale = -1
    character.x = display.contentWidth
  end
end

return character
