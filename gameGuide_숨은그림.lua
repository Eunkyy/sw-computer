-----------------------------------------------------------------------------------------
--
-- result.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- 2) 전달한 변수값 불러오기
local resultScore = composer.getVariable("score")
local lives = composer.getVariable("live")

function scene:create( event )
	local sceneGroup = self.view
	local soundEffect = audio.loadSound( "bgm/game_guide.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 1 )

	local background = display.newImageRect("image/bg2_.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local guide = display.newRect( display.contentWidth/2, display.contentHeight/ 2, display.contentWidth - 400, display.contentHeight - 200 )
	guide:setFillColor( 0.9, 0.7, 0.7 )
	guide.alpha = 0.5
	guide.y = display.contentCenterY

	local guideBox = display.newRect( display.contentWidth/2, display.contentHeight/ 2, display.contentWidth - 400, display.contentHeight - 250 )
	guideBox:setFillColor( 0.5)
	guideBox.alpha = 0.7
	guideBox.y = display.contentCenterY

	local box = display.newRect( display.contentWidth/2, display.contentHeight/ 2+200, 200, 70 )
	box:setFillColor( 0.2 )
	box.alpha = 1

	local guideText = display.newText(" ", display.contentWidth/2, display.contentHeight/ 2 - 70, "font/NanumJangMiCe.ttf", 30)
	guideText:setFillColor(0)
	guideText.text = "[게임방법]\n\n"
	

	local button = display.newText("돌아가기", display.contentWidth/2, display.contentHeight/ 2 +200, "font/NanumJangMiCe.ttf", 40)
	button:setFillColor(0.9, 0.5, 0.5)

	local function buttonClick()
		audio.pause( backgroundMusicChannel )
		composer.removeScene("gameGuide_숨은그림")

		sceneGroup:insert(background)
		sceneGroup:insert(guide)
		sceneGroup:insert(guideBox)
		sceneGroup:insert(box)
		sceneGroup:insert(guideText)
		sceneGroup:insert(button)

	   	composer.gotoScene("숨은그림찾기", { time=800, effect="crossFade" })
	end

	button:addEventListener( "tap", buttonClick )
	box:addEventListener( "tap", buttonClick )

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