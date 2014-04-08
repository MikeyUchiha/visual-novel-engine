local composer = require( "composer" )
--====================================================================--
-- SCENE: [LOAD GAME]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [Displays the load game menu.]

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

      -- Initialize the scene here.
      -- Example: add display objects to "sceneGroup", add touch listeners, etc.
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

