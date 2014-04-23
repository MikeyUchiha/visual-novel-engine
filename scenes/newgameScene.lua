local composer = require( "composer" )
local script = require( "scripts.script" )
local dialogue = require( "scripts.dialogue" )
local character = require( "scripts.character" )
local timercontroller = require( "scripts.timer" )
--====================================================================--
-- SCENE: [NEW GAME]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [Starts a new game. Player creates a new character.]

--]]
	
	------------------
	-- Groups
	------------------
	
  local scene = composer.newScene()
	
	------------------
	-- Your code here
	------------------
	
  -- "scene:create()"
  function scene:create( event )

      local sceneGroup = self.view
   
      script.setPlayerName("Mikey")
      
      local hazelimage = character.make("hazel_edited.png", 432, 639)
      local hazelimage2 = character.make("hazel_edited.png", 432, 639)
      
      local hazelhappy = character.make("hazel_happy.png", 432, 639)
      
      local chardisplaygroup = character.entercharacter(hazelimage, "left")
      --chardisplaygroup:addcharacter( hazelimage2, "right" )
      
      
      local dbox = dialogue.drawdbox(1)
      local count = 1
      function dbox.box:tap( event )
            print(count)
            if count == 1 then
              print("Touched dialogue box.")
              dbox:updatetext(2, "Narrator2\n")
              chardisplaygroup:addcharacter( hazelimage2, "right" )
              count = count + 1
            elseif count == 2 then
              chardisplaygroup:removecharacter(1)
              count = count + 1
            elseif count == 3 then
              chardisplaygroup:removecharacter(2)
              count = count + 1
            else
              count = nil
              dbox.isVisible = false
            end
      end
      
      local time = timercontroller
      print(time:getTime())
      
      time:addTime(24,0)
      --time:addTime(23,59) --For some reason
      --time:addTIme(0,3) --these two lines don't work
      time:addTime(0,30)
      time:addTime(0,30)
      time:addTime(23,0)
      
      dbox.box:addEventListener( "tap" )
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
      --dbox:addEventListener( "tap" ) -- If your object has a .touch function, you can just call "touch"
      
      -- Initialize the scene here.
      -- Example: add display objects to "sceneGroup", add touch listeners, etc.
      sceneGroup:insert(chardisplaygroup)
      sceneGroup:insert(dbox)
  end


  -- "scene:show()"
  function scene:show( event )

      local sceneGroup = self.view
      local phase = event.phase

      if ( phase == "will" ) then
          -- Called when the scene is still off screen (but is about to come on screen).
      elseif ( phase == "did" ) then
          -- Called when the scene is now on screen.
          -- Insert code here to make the scene come alive.
          -- Example: start timers, begin animation, play audio, etc.
      end
  end


  -- "scene:hide()"
  function scene:hide( event )

      local sceneGroup = self.view
      local phase = event.phase

      if ( phase == "will" ) then
          -- Called when the scene is on screen (but is about to go off screen).
          -- Insert code here to "pause" the scene.
          -- Example: stop timers, stop animation, stop audio, etc.
      elseif ( phase == "did" ) then
          -- Called immediately after scene goes off screen.
      end
  end


  -- "scene:destroy()"
  function scene:destroy( event )

      local sceneGroup = self.view

      -- Called prior to the removal of scene's view ("sceneGroup").
      -- Insert code here to clean up the scene.
      -- Example: remove display objects, save state, etc.
  end

	
  ------------------
	-- Listener Setup
	------------------
  scene:addEventListener( "create", scene )
  scene:addEventListener( "show", scene )
  scene:addEventListener( "hide", scene )
  scene:addEventListener( "destroy", scene )
	------------------
	-- MUST return a scene
	------------------
  return scene

