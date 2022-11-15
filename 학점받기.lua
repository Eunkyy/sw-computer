-----------------------------------------------------------------------------------------
--
-- beforeGame.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local soundEffect = audio.loadSound( "bgm/report_bg.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 1 )
	
	local background = display.newImageRect("image/bg3.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local gameTitle = display.newText("솜솜이의\n 성적표", display.contentWidth/2, display.contentHeight/2 - 200, "font/NanumYeBbeunMinGyeongCe.ttf", 130)
	gameTitle:setFillColor(0)

	local gameTitle1 = display.newText("솜솜이의\n 성적표", display.contentWidth/2 - 10, display.contentHeight/2 - 310, "font/NanumYeBbeunMinGyeongCe.ttf", 150)
	gameTitle1:setFillColor(0.5, 0.5, 0.5)
	gameTitle1.alpha =0

	local gBox = display.newRect( display.contentWidth/2, display.contentHeight/2 + 125,370, 80)
	gBox:setFillColor( 0.5, 0.7, 0.7 )
	gBox.alpha = 0.8

	local guide = display.newText("GAME GUIDE", display.contentWidth/2, display.contentHeight/2+130, "font/SunriseInternationalDemo.otf", 70)
	guide:setFillColor(0)
	
	local sBox = display.newRect( display.contentWidth/2, display.contentHeight/2 + 245,370, 80)
	sBox:setFillColor( 0.5, 0.7, 0.7 )
	sBox.alpha = 0.8

	local startButton = display.newText("GAME START", display.contentWidth/2, display.contentHeight/2+250, "font/SunriseInternationalDemo.otf", 70)
	startButton:setFillColor(0)

	local function startGame(event)
	   	sceneGroup:insert(background)
	   	sceneGroup:insert(gameTitle)
	    sceneGroup:insert(gameTitle1)
	   	sceneGroup:insert(guide)
	   	sceneGroup:insert(gBox)
	   	sceneGroup:insert(sBox)
	   	sceneGroup:insert(startButton)
		composer.removeScene("학점받기")

	   	composer.gotoScene("game_main", { time=800, effect="crossFade" })
	end

	sBox:addEventListener("tap", startGame)

	local function goToGuide(event)
	   	sceneGroup:insert(background)
	   	sceneGroup:insert(gameTitle)
	   	sceneGroup:insert(gameTitle1)
	   	sceneGroup:insert(guide)
	   	sceneGroup:insert(gBox)
	   	sceneGroup:insert(sBox)
	   	sceneGroup:insert(startButton)

		composer.removeScene("학점받기")
	   	composer.gotoScene("gameGuide", { time=800, effect="crossFade" })
	end

	gBox:addEventListener("tap", goToGuide)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene