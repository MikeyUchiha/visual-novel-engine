local composer = require( "composer" )
local backgroundcontroller = require( "scripts.background" )
--====================================================================--
-- SCENE: [MENU]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [Malik Gray]
 - Website: [www.starfantasygames.com]
 - Mail: [mikey@starfantasygames.com]

******************
 - INFORMATION
******************

  - [The Menu scene is the first scene that is brought onto the screen.]

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
      
      local function openNewGame( event )
        if ( "ended" == event.phase ) then
          local options = 
          {
            effect = "fade",
            time = 500
          }
          
          composer.gotoScene( "scenes.newgameScene", options )
        end
      end
      
      local function openLoadGame( event )
        if ( "ended" == event.phase ) then
          local options = 
          {
            effect = "fade",
            time = 500,
            isModal = true
          }
          --composer.showOverlay( "scenes.loadgameScene", options )
          print( "You opened the Load Game Screen." )
        end
      end
      
      local function openCredits( event )
        if ( "ended" == event.phase ) then
          local options = 
          {
            effect = "fade",
            time = 500,
            isModal = true
          }
          composer.showOverlay( "scenes.creditsScene", options )
        end
      end
      
      local function openInstructions( event )
        if ( "ended" == event.phase ) then
          local options = 
          {
            effect = "fade",
            time = 500,
            isModal = true
          }
          composer.showOverlay( "scenes.instructionsScene", options )
        end
      end
      
      local bg = backgroundcontroller.createbg("bg.jpg")
      local buttonFontSize = 36
      
      local newgameButton = backgroundcontroller.createbutton("buttonup.png", "buttondown.png", 264, 74, "New Game", false, buttonFontSize, openNewGame)
      newgameButton.x = display.contentWidth/10 * 8.5
      newgameButton.y = display.contentHeight/10 * 9 - newgameButton.height * 3.3
      
      local loadgameButton = backgroundcontroller.createbutton("buttonup.png", "buttondown.png", 264, 74, "Load Game", false, buttonFontSize, openLoadGame)
      loadgameButton.x = display.contentWidth/10 * 8.5
      loadgameButton.y = display.contentHeight/10 * 9 - loadgameButton.height * 2.2
      
      local instructionsButton = backgroundcontroller.createbutton("buttonup.png", "buttondown.png", 264, 74, "Instructions", false, buttonFontSize, openInstructions)
      instructionsButton.x = display.contentWidth/10 * 8.5
      instructionsButton.y = (display.contentHeight/10 * 9) - instructionsButton.height * 1.1
      
      local creditsButton = backgroundcontroller.createbutton("buttonup.png", "buttondown.png", 264, 74, "Credits", false, buttonFontSize, openCredits)
      creditsButton.x = display.contentWidth/10 * 8.5
      creditsButton.y = display.contentHeight/10 * 9
      
      -- Initialize the scene here.
      -- Example: add display objects to "sceneGroup", add touch listeners, etc.
      sceneGroup:insert(bg)
      sceneGroup:insert(newgameButton)
      sceneGroup:insert(loadgameButton)
      sceneGroup:insert(instructionsButton)
      sceneGroup:insert(creditsButton)
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