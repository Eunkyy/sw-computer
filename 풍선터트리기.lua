-----------------------------------------------------------------------------------------
--
-- beforeGame.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local soundEffect = audio.loadSound( "bgm/game_main.mp3" )
    local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
    audio.setVolume( 1 )
	
	
	local background = display.newImageRect("image/풍선터트리기/back.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local gameTitle = display.newText("솜 수집하기", display.contentWidth/2, display.contentHeight/2 - 200, "font/NanumYeBbeunMinGyeongCe.ttf", 130)
	gameTitle:setFillColor(1)

	local gBox = display.newRect( display.contentWidth/2, display.contentHeight/2 + 125,370, 80)
	gBox:setFillColor(1 )
	gBox.alpha = 0.8

	local guide = display.newText("GAME GUIDE", display.contentWidth/2, display.contentHeight/2+130, "font/SunriseInternationalDemo.otf", 70)
	guide:setFillColor(0)
	
	local twentyBox = display.newRect( display.contentWidth/2, display.contentHeight/2+250,370, 80)
	twentyBox:setFillColor(1)
	twentyBox.alpha = 0.8

	local twentyButton = display.newText("GAME START", display.contentWidth/2, display.contentHeight/2+250, "font/SunriseInternationalDemo.otf", 70)
	twentyButton:setFillColor(0)

	local guideExit = display.newImage("image/miniExit.png")
	guideExit.x = 1150
	guideExit.y = 60

	local function twentyGame(event)
	   	sceneGroup:insert(background)
	   	sceneGroup:insert(gameTitle)
	   	sceneGroup:insert(guide)
	   	sceneGroup:insert(gBox)
	   	sceneGroup:insert(twentyBox)
	   	sceneGroup:insert(twentyButton)
		sceneGroup:insert(guideExit)
		audio.pause( backgroundMusicChannel )
		composer.removeScene("풍선터트리기")

	   	composer.gotoScene("풍선터트리기_20초", { time=800, effect="crossFade" })
	end

	 twentyBox:addEventListener("tap", twentyGame)

	local function goToGuide(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(twentyBox)
		sceneGroup:insert(twentyButton)
		sceneGroup:insert(guideExit)
		audio.pause( backgroundMusicChannel )
		composer.removeScene("풍선터트리기")

	   	composer.gotoScene("gameGuide_풍선", { time=800, effect="crossFade" })
	end

	gBox:addEventListener("tap", goToGuide)

	local function goToMain(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(twentyBox)
		sceneGroup:insert(twentyButton)
		sceneGroup:insert(guideExit)
		audio.pause( backgroundMusicChannel )
		composer.removeScene("풍선터트리기")
		composer.gotoScene("메인화면", { time=800, effect="crossFade" })
 	end

 	guideExit:addEventListener("tap", goToMain)

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