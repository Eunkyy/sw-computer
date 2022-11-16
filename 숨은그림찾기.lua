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

	local gameTitle = display.newText("숨은그림찾기", display.contentWidth/2, display.contentHeight/2 - 200, "font/NanumYeBbeunMinGyeongCe.ttf", 130)
	gameTitle:setFillColor(0)


	local gBox = display.newRect( display.contentWidth/2, display.contentHeight/2 + 30,370, 80)
	gBox:setFillColor( 0.5, 0.7, 0.7 )
	gBox.alpha = 0.8

	local guide = display.newText("GAME GUIDE", display.contentWidth/2, display.contentHeight/2+30, "font/SunriseInternationalDemo.otf", 70)
	guide:setFillColor(0)
	

	local noteBox = display.newRect( display.contentWidth/2 - 200, display.contentHeight/2 + 150,370, 80)
	noteBox:setFillColor( 0.5, 0.7, 0.7 )
	noteBox.alpha = 0.8

	local noteButton = display.newText("노트북", display.contentWidth/2 - 200, display.contentHeight/2+150, "font/SunriseInternationalDemo.otf", 70)
	noteButton:setFillColor(0)


	local somBox = display.newRect( display.contentWidth/2 + 200, display.contentHeight/2 + 150,370, 80)
	somBox:setFillColor( 0.5, 0.7, 0.7 )
	somBox.alpha = 0.8

	local somButton = display.newText("솜솜이", display.contentWidth/2 + 200, display.contentHeight/2+150, "font/SunriseInternationalDemo.otf", 70)
	somButton:setFillColor(0)


	local penBox = display.newRect( display.contentWidth/2 - 200, display.contentHeight/2 + 245,370, 80)
	penBox:setFillColor( 0.5, 0.7, 0.7 )
	penBox.alpha = 0.8

	local penButton = display.newText("연필", display.contentWidth/2 - 200, display.contentHeight/2+250, "font/SunriseInternationalDemo.otf", 70)
	penButton:setFillColor(0)


	local bookBox = display.newRect( display.contentWidth/2 + 200, display.contentHeight/2 + 245,370, 80)
	bookBox:setFillColor( 0.5, 0.7, 0.7 )
	bookBox.alpha = 0.8

	local bookButton = display.newText("전공책", display.contentWidth/2 + 200, display.contentHeight/2+250, "font/SunriseInternationalDemo.otf", 70)
	bookButton:setFillColor(0)

	local guideExit = display.newImage("image/메인/exit.png")
	guideExit.x = 1220
	guideExit.y = 22

	local function noteGame(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(noteBox)
		sceneGroup:insert(noteButton)
		sceneGroup:insert(somBox)
		sceneGroup:insert(somButton)
		sceneGroup:insert(penBox)
		sceneGroup:insert(penButton)
		sceneGroup:insert(bookBox)
		sceneGroup:insert(bookButton)
		sceneGroup:insert(guideExit)
		composer.removeScene("숨은그림찾기")

		composer.gotoScene("숨은그림찾기_노트북", { time=800, effect="crossFade" })
	end

	local function somGame(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(noteBox)
		sceneGroup:insert(noteButton)
		sceneGroup:insert(somBox)
		sceneGroup:insert(somButton)
		sceneGroup:insert(penBox)
		sceneGroup:insert(penButton)
		sceneGroup:insert(bookBox)
		sceneGroup:insert(bookButton)
		sceneGroup:insert(guideExit)
		composer.removeScene("숨은그림찾기")

		composer.gotoScene("숨은그림찾기_솜솜", { time=800, effect="crossFade" })
	end

	local function penGame(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(noteBox)
		sceneGroup:insert(noteButton)
		sceneGroup:insert(somBox)
		sceneGroup:insert(somButton)
		sceneGroup:insert(penBox)
		sceneGroup:insert(penButton)
		sceneGroup:insert(bookBox)
		sceneGroup:insert(bookButton)
		sceneGroup:insert(guideExit)
		composer.removeScene("숨은그림찾기")

		composer.gotoScene("숨은그림찾기_연필", { time=800, effect="crossFade" })
	end

	local function bookGame(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(noteBox)
		sceneGroup:insert(noteButton)
		sceneGroup:insert(somBox)
		sceneGroup:insert(somButton)
		sceneGroup:insert(penBox)
		sceneGroup:insert(penButton)
		sceneGroup:insert(bookBox)
		sceneGroup:insert(bookButton)
		sceneGroup:insert(guideExit)
		composer.removeScene("숨은그림찾기")

		composer.gotoScene("숨은그림찾기_전공책", { time=800, effect="crossFade" })
	end

	noteBox:addEventListener("tap", noteGame)
	somBox:addEventListener("tap", somGame)
	penBox:addEventListener("tap", penGame)
	bookBox:addEventListener("tap", bookGame)



	local function goToGuide(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(noteBox)
		sceneGroup:insert(noteButton)
		sceneGroup:insert(somBox)
		sceneGroup:insert(somButton)
		sceneGroup:insert(penBox)
		sceneGroup:insert(penButton)
		sceneGroup:insert(bookBox)
		sceneGroup:insert(bookButton)
		sceneGroup:insert(guideExit)
		composer.removeScene("숨은그림찾기")

	   	composer.gotoScene("gameGuide_숨은그림", { time=800, effect="crossFade" })
	end

	gBox:addEventListener("tap", goToGuide)

	local function goToMain(event)
		sceneGroup:insert(background)
		sceneGroup:insert(gameTitle)
		sceneGroup:insert(guide)
		sceneGroup:insert(gBox)
		sceneGroup:insert(noteBox)
		sceneGroup:insert(noteButton)
		sceneGroup:insert(somBox)
		sceneGroup:insert(somButton)
		sceneGroup:insert(penBox)
		sceneGroup:insert(penButton)
		sceneGroup:insert(bookBox)
		sceneGroup:insert(bookButton)
		sceneGroup:insert(guideExit)

		composer.removeScene("숨은그림찾기")
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