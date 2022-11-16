-----------------------------------------------------------------------------------------
--
-- result.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

local loadedSettings = loadsave.loadTable( "settings.json" )
local loadedItems= loadsave.loadTable( "items.json" )

-- 2) 전달한 변수값 불러오기
local resultScore = composer.getVariable("score")

function scene:create( event )
	local sceneGroup = self.view

	local bg2 = display.newImageRect( "image/bg3.jpg", display.contentWidth, display.contentHeight )
	bg2.x, bg2.y = display.contentWidth/2, display.contentHeight/2
	bg2.alpha = 1

	local mainGroup = display.newGroup()

	local endText = display.newText("Clear", display.contentWidth/2, display.contentHeight/2 - 50, "font/NanumYeBbeunMinGyeongCe.ttf", 200)
	endText:setFillColor(0)

	local retry = display.newText("RETRY", display.contentWidth/2, display.contentHeight/2 + 10, "font/NanumYeBbeunMinGyeongCe.ttf", 120)
	retry:setFillColor(0)
	retry.alpha = 0

	local quit = display.newText(" ", display.contentWidth/2, display.contentHeight/2 + 130, "font/NanumYeBbeunMinGyeongCe.ttf", 120)
	quit:setFillColor(0)

	local quit2 = display.newText("게임 나가기", display.contentWidth/2, display.contentHeight/2 + 120, "font/NanumYeBbeunMinGyeongCe.ttf", 100)
	quit2:setFillColor(0)
	quit2.alpha = 0

	local function flashing_text(textToFlash)
	    local r = math.random(0,100)
	    local g = math.random(0,100)
	    local b = math.random(0, 100)

	    if(textToFlash.alpha < 1) then
	        --textToFlash:setFillColor(r/100,g/100,b/100)
	        transition.to( textToFlash, {time=490, alpha=1})
	    else 
	        transition.to( textToFlash, {time=490, alpha=0.1})
	    end
    end

		sceneGroup:insert(bg2)
		sceneGroup:insert(endText)
		sceneGroup:insert(mainGroup)
	    sceneGroup:insert(retry)
	   	sceneGroup:insert(quit)
	   	sceneGroup:insert(quit2)
	local function reGame(event)
		composer.removeScene("result")
	   	composer.gotoScene("game_main", { time=800, effect="crossFade" })
	end

	local function exitGame(event)
		loadedSettings.money = loadedSettings.money + 500
		loadsave.saveTable(loadedSettings,"settings.json")
		composer.removeScene("result")
	   	composer.gotoScene("메인화면", { time=800, effect="crossFade" })
	end

	local function exitGame2(event)
		loadedSettings.money = loadedSettings.money + 100
		loadsave.saveTable(loadedSettings,"settings.json")
		composer.removeScene("result")
	   	composer.gotoScene("메인화면", { time=800, effect="crossFade" })
	end
	if resultScore >= 1200 then
		endText.text = "CLEAR"
		quit.text = "quit"
		quit:addEventListener("tap", exitGame)

	elseif resultScore <= 0 then
		endText.text = "GAME OVER"
		endText.size = 170
		endText.y = display.contentHeight/2 - 150

		retry.alpha = 1
		retry:addEventListener("tap", reGame)
		quit2.alpha = 1		
		quit2:addEventListener("tap", exitGame2)
	end	
if resultScore >= 1200 then
		local pn= display.newImageRect("image/UI/pannel.png",420,180)
		pn.x,pn.y = display.contentWidth/2,display.contentHeight*0.13
		sceneGroup:insert(pn)

		local coin = display.newText("+ 500 coin!",display.contentWidth*0.47, display.contentHeight*0.18,"font/NanumJangMiCe.ttf")
		coin:setFillColor(0.8,0.2,0.2)
		coin.size = 68
		sceneGroup:insert(coin)
	elseif resultScore <= 0 then
		local pn= display.newImageRect("image/UI/pannel.png",420,180)
		pn.x,pn.y = display.contentWidth/2,display.contentHeight*0.13
		sceneGroup:insert(pn)

		local coin = display.newText("+ 100 coin!",display.contentWidth*0.47, display.contentHeight*0.18,"font/NanumJangMiCe.ttf")
		coin:setFillColor(0.8,0.2,0.2)
		coin.size = 68
		sceneGroup:insert(coin)
	end	
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