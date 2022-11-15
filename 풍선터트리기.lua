-----------------------------------------------------------------------------------------
--
-- beforeGame.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect("image/bg3.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local gameTitle = display.newText("풍선터트리기", display.contentWidth/2, display.contentHeight/2 - 200, native.systemFont, 130)
	gameTitle:setFillColor(0)

	local gBox = display.newRect( display.contentWidth/2, display.contentHeight/2 + 125,370, 80)
	gBox:setFillColor( 0.5, 0.7, 0.7 )
	gBox.alpha = 0.8

	local guide = display.newText("GAME GUIDE", display.contentWidth/2, display.contentHeight/2+130, native.systemFont, 70)
	guide:setFillColor(0)
	
	local twentyBox = display.newRect( display.contentWidth/2 - 200, display.contentHeight/2 + 245,370, 80)
	twentyBox:setFillColor( 0.5, 0.7, 0.7 )
	twentyBox.alpha = 0.8

	local twentyButton = display.newText("20초", display.contentWidth/2 - 200, display.contentHeight/2+250, native.systemFont, 70)
	twentyButton:setFillColor(0)

    local threeBox = display.newRect( display.contentWidth/2 + 200, display.contentHeight/2 + 245,370, 80)
	threeBox:setFillColor( 0.5, 0.7, 0.7 )
	threeBox.alpha = 0.8

	local threeButton = display.newText("30초", display.contentWidth/2 + 200, display.contentHeight/2+250, native.systemFont, 70)
	threeButton:setFillColor(0)

	local function twentyGame(event)
	   	sceneGroup:insert(background)
	   	sceneGroup:insert(gameTitle)
	   	sceneGroup:insert(guide)
	   	sceneGroup:insert(gBox)
	   	sceneGroup:insert(twentyBox)
	   	sceneGroup:insert(twentyButton)
		sceneGroup:insert(threeBox)
	   	sceneGroup:insert(threeButton)
		composer.removeScene("풍선터트리기")

	   	composer.gotoScene("풍선터트리기_20초", { time=800, effect="crossFade" })
	end

	local function ThirtyGame(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(twentyBox)
		sceneGroup:insert(twentyButton)
	 	sceneGroup:insert(threeBox)
		sceneGroup:insert(threeButton)
	 	composer.removeScene("풍선터트리기")

		composer.gotoScene("풍선터트리기_30초", { time=800, effect="crossFade" })
 	end

	 twentyBox:addEventListener("tap", twentyGame)
	 threeButton:addEventListener("tap", ThirtyGame)

	local function goToGuide(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(twentyBox)
		sceneGroup:insert(twentyButton)
		sceneGroup:insert(threeBox)
		sceneGroup:insert(threeButton)
	 composer.removeScene("풍선터트리기")

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