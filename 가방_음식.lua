-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local json = require( "json" )
local scene = composer.newScene()
local loadedItem= loadsave.loadTable( "settings.json" )
local loadedFood=loadsave.loadTable("food.json")

function scene:create( event )
	local sceneGroup = self.view
	
	local soundEffect = audio.loadSound( "bgm/store_bg.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 2 )


	local background= display.newImageRect("image/상점/음식_배경.jpg",1280,720)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)


	

	--음식
	local tteokbokki = display.newImageRect("image/상점/떡볶이.jpeg",150,150)
	tteokbokki.x,tteokbokki.y = display.contentWidth*0.15,display.contentHeight*0.4
	sceneGroup:insert(tteokbokki)
	tteokbokki.name="tteokbokki"
	tteokbokki.id=500

	local tCount = loadedFood.tteokbokki_count
	local tCount = display.newText(tCount,display.contentWidth*0.21,display.contentHeight*0.3)
	tCount:setFillColor(0)
	tCount.size =30
	sceneGroup:insert(tCount)

	local fishCake = display.newImageRect("image/상점/어묵.jpeg",150,150)
	fishCake.x,fishCake.y = display.contentWidth*0.33,display.contentHeight*0.4
	sceneGroup:insert(fishCake)
	fishCake.name="fishCake"
	fishCake.id=500

	local fcCount = loadedFood.fishCake_count
	local fcCount = display.newText(fcCount,display.contentWidth*0.39,display.contentHeight*0.3)
	fcCount:setFillColor(0)
	fcCount.size =30
	sceneGroup:insert(fcCount)

	local sundae = display.newImageRect("image/상점/순대.jpeg",150,150)
	sundae.x,sundae.y = display.contentWidth*0.5,display.contentHeight*0.4
	sceneGroup:insert(sundae)
	sundae.name="sundae"
	sundae.id=500

	local sdCount = loadedFood.sundae_count
	local sdCount = display.newText(sdCount,display.contentWidth*0.56,display.contentHeight*0.3)
	sdCount:setFillColor(0)
	sdCount.size =30
	sceneGroup:insert(sdCount)

	local steak = display.newImageRect("image/상점/스테이크.jpeg",150,150)
	steak.x,steak.y = display.contentWidth*0.67,display.contentHeight*0.4
	sceneGroup:insert(steak)
	steak.name="steak"
	steak.id=500

	local sCount = loadedFood.steak_count
	local sCount = display.newText(sCount,display.contentWidth*0.73,display.contentHeight*0.3)
	sCount:setFillColor(0)
	sCount.size =30
	sceneGroup:insert(sCount)

	local fried = display.newImageRect("image/상점/튀김.jpeg",150,150)
	fried.x,fried.y = display.contentWidth*0.85,display.contentHeight*0.4
	sceneGroup:insert(fried)
	fried.name="fried"
	fried.id=500

	local fCount = loadedFood.fried_count
	local fCount = display.newText(fCount,display.contentWidth*0.91,display.contentHeight*0.3)
	fCount:setFillColor(0)
	fCount.size =30
	sceneGroup:insert(fCount)




	--가격

	local tbk = 500
	local showLimit = display.newText(tbk,display.contentWidth*0.15,display.contentHeight*0.55)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local fc = 500
	local showLimit = display.newText(fc,display.contentWidth*0.33,display.contentHeight*0.55)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local sd = 500
	local showLimit = display.newText(sd,display.contentWidth*0.5,display.contentHeight*0.55)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local stk = 500
	local showLimit = display.newText(stk,display.contentWidth*0.67,display.contentHeight*0.55)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local fry = 500
	local showLimit = display.newText(fry,display.contentWidth*0.85,display.contentHeight*0.55)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)


	local next = display.newImageRect("image/상점/화살표.png",80,140)
	next.x,next.y = display.contentWidth*0.96,display.contentHeight*0.5
	sceneGroup:insert(next)

	local exit = display.newImageRect("image/상점/화살표_왼.png",80,140)
	exit.x,exit.y = display.contentWidth*0.05,display.contentHeight*0.1
	sceneGroup:insert(exit)

	local exitText = display.newText("나가기",display.contentWidth*0.05,display.contentHeight*0.2,"font/NanumJangMiCe.ttf")
	exitText:setFillColor(0)
	exitText.size =40
	sceneGroup:insert(exitText)

	local function exitFunc(event)
		audio.pause( backgroundMusicChannel )
		composer.removeScene("가방_음식")
	   	composer.gotoScene("메인화면")
	end
	exit:addEventListener("tap",exitFunc)

	--구매함수

	local item
	local function buy(event)
		item=event.target.name
		money = event.target.id
		composer.setVariable("item", item)
		composer.setVariable("money", money)
		--audio.pause( backgroundMusicChannel )
		composer.removeScene("가방_음식")
	   	composer.gotoScene("가방_음식_popup")

	end
	tteokbokki:addEventListener("touch",buy)
	fishCake:addEventListener("touch",buy)
	sundae:addEventListener("touch",buy)
	steak:addEventListener("touch",buy)
	fried:addEventListener("touch",buy)


	local function nextStore(event)
		composer.removeScene("가방_음식")
	   	composer.gotoScene("가방_옷")
	end
	next:addEventListener("touch",nextStore)
	
	








	
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