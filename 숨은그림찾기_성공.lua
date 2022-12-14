-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

local loadedSettings = loadsave.loadTable( "settings.json" )
local loadedItems= loadsave.loadTable( "items.json" )

function scene:create( event )
	local sceneGroup = self.view

	local soundEffect = audio.loadSound( "bgm/game_win.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=0} )
	audio.setVolume( 2 )

	local background= display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local hintText = display.newText("성공!",display.contentWidth*0.5, display.contentHeight*0.5,"font/NanumSquare_acB.ttf")
	hintText:setFillColor(0)
	hintText.size = 100
	sceneGroup:insert(hintText)

	local somsom = display.newImageRect("image/숨은그림찾기/솜솜이_성공.png",700,700)
	somsom.x,somsom.y = display.contentWidth*0.84,display.contentHeight*0.6
	sceneGroup:insert(somsom)

	local exit = display.newImageRect("image/상점/화살표_왼.png",80,140)
	exit.x,exit.y = display.contentWidth*0.05,display.contentHeight*0.1
	sceneGroup:insert(exit)

	local exitText = display.newText("나가기",display.contentWidth*0.05,display.contentHeight*0.2)
	exitText:setFillColor(0)
	exitText.size =40
	sceneGroup:insert(exitText)

	local function exitFunc(event)
		composer.removeScene("상점")
	   	composer.gotoScene("메인화면")
	end
	exit:addEventListener("tap",exitFunc)

	local t= display.newImageRect("image/숨은그림찾기/테두리.png",750,750)
	t.x,t.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(t)
	
	loadedSettings.money = loadedSettings.money + 100
	loadsave.saveTable(loadedSettings,"setting.json")
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
