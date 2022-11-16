-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local json = require( "json" )
local scene = composer.newScene()
local loadedSettings= loadsave.loadTable( "settings.json" )
local loadedClothes= loadsave.loadTable( "clothes.json" )

function scene:create( event )
	local sceneGroup = self.view


	local background= display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	local background2= display.newImageRect("image/상점/옷_배경.jpg",1280,720)
	background2.alpha=0.6
	background2.x,background2.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background2)



	

	--옷
	local gwajam1 = display.newImageRect("image/상점/과잠_1.png",160,135)
	gwajam1.x,gwajam1.y = display.contentWidth*0.15,display.contentHeight*0.15
	sceneGroup:insert(gwajam1)
	gwajam1.name="gwajam1"
	gwajam1.alpha=loadedClothes.g1Sold+0.5
	gwajam1.id=500

	local gwajam2 = display.newImageRect("image/상점/과잠_2.png",160,135)
	gwajam2.x,gwajam2.y = display.contentWidth*0.33,display.contentHeight*0.15
	sceneGroup:insert(gwajam2)
	gwajam2.name="gwajam2"
	gwajam2.alpha=loadedClothes.g2Sold+0.5
	gwajam2.id=500

	local gwajam3 = display.newImageRect("image/상점/과잠_3.png",160,135)
	gwajam3.x,gwajam3.y = display.contentWidth*0.5,display.contentHeight*0.15
	sceneGroup:insert(gwajam3)
	gwajam3.name="gwajam3"
	gwajam3.alpha=loadedClothes.g3Sold+0.5
	gwajam3.id=500

	local gwajam4 = display.newImageRect("image/상점/과잠_4.png",160,135)
	gwajam4.x,gwajam4.y = display.contentWidth*0.67,display.contentHeight*0.15
	sceneGroup:insert(gwajam4)
	gwajam4.name="gwajam4"
	gwajam4.alpha=loadedClothes.g4Sold+0.5
	gwajam4.id=500

	local gwajam5 = display.newImageRect("image/상점/과잠_5.png",160,135)
	gwajam5.x,gwajam5.y = display.contentWidth*0.85,display.contentHeight*0.15
	sceneGroup:insert(gwajam5)
	gwajam5.name="gwajam5"
	gwajam5.alpha=loadedClothes.g5Sold+0.5
	gwajam5.id=500


	local animal1 = display.newImageRect("image/상점/동물_1.png",135,135)
	animal1.x,animal1.y = display.contentWidth*0.15,display.contentHeight*0.45
	sceneGroup:insert(animal1)
	animal1.name="animal1"
	animal1.alpha=loadedClothes.a1Sold+0.5
	animal1.id=1000

	local animal2 = display.newImageRect("image/상점/동물_2.png",135,135)
	animal2.x,animal2.y = display.contentWidth*0.33,display.contentHeight*0.45
	sceneGroup:insert(animal2)
	animal2.name="animal2"
	animal2.alpha=loadedClothes.a2Sold+0.5
	animal2.id=1000

	local animal3 = display.newImageRect("image/상점/동물_3.png",135,135)
	animal3.x,animal3.y = display.contentWidth*0.5,display.contentHeight*0.45
	sceneGroup:insert(animal3)
	animal3.name="animal3"
	animal3.alpha=loadedClothes.a3Sold+0.5
	animal3.id=1000

	local animal4 = display.newImageRect("image/상점/동물_4.png",135,135)
	animal4.x,animal4.y = display.contentWidth*0.67,display.contentHeight*0.45
	sceneGroup:insert(animal4)
	animal4.name="animal4"
	   animal4.alpha=loadedClothes.a4Sold+0.5
	animal4.id=1000

	local animal5 = display.newImageRect("image/상점/동물_5.png",135,135)
	animal5.x,animal5.y = display.contentWidth*0.85,display.contentHeight*0.45
	sceneGroup:insert(animal5)
	animal5.name="animal5"
	   animal5.alpha=loadedClothes.a5Sold+0.5
	animal5.id=1000


	local twopiece1 = display.newImageRect("image/상점/투피스_1.png",135,135)
	twopiece1.x,twopiece1.y = display.contentWidth*0.15,display.contentHeight*0.75
	sceneGroup:insert(twopiece1)
	twopiece1.name="twopiece1"
	   twopiece1.alpha=loadedClothes.t1Sold+0.5
	twopiece1.id=2000

	local twopiece2 = display.newImageRect("image/상점/투피스_2.png",135,135)
	twopiece2.x,twopiece2.y = display.contentWidth*0.33,display.contentHeight*0.75
	sceneGroup:insert(twopiece2)
	twopiece2.name="twopiece2"
	   twopiece2.alpha=loadedClothes.t2Sold+0.5
	twopiece2.id=2000

	local twopiece3 = display.newImageRect("image/상점/투피스_3.png",135,135)
	twopiece3.x,twopiece3.y = display.contentWidth*0.5,display.contentHeight*0.75
	sceneGroup:insert(twopiece3)
	twopiece3.name="twopiece3"
	   twopiece3.alpha=loadedClothes.t3Sold+0.5
	twopiece3.id=2000

	local twopiece4 = display.newImageRect("image/상점/투피스_4.png",135,135)
	twopiece4.x,twopiece4.y = display.contentWidth*0.67,display.contentHeight*0.75
	sceneGroup:insert(twopiece4)
	twopiece4.name="twopiece4"
	   twopiece4.alpha=loadedClothes.t4Sold+0.5
	twopiece4.id=2000

	local twopiece5 = display.newImageRect("image/상점/투피스_5.png",135,135)
	twopiece5.x,twopiece5.y = display.contentWidth*0.85,display.contentHeight*0.75
	sceneGroup:insert(twopiece5)
	twopiece5.name="twopiece5"
	   twopiece5.alpha=loadedClothes.t5Sold+0.5
	twopiece5.id=2000

	local next = display.newImageRect("image/상점/화살표_왼.png",80,140)
	next.x,next.y = display.contentWidth*0.04,display.contentHeight*0.5
	sceneGroup:insert(next)


	--구매함수

	local item
	local function buy(event)
		item=event.target.name
		money = event.target.id
		composer.setVariable("item", item)
		composer.setVariable("money", money)
		composer.removeScene("상점_옷")
	   	composer.gotoScene("상점_옷_popup")

	end



	local function nextStore(event)
		audio.pause( backgroundMusicChannel )
		composer.removeScene("상점_옷")
	   	composer.gotoScene("상점")
	end
	next:addEventListener("touch",nextStore)



--soldout

	local g1_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	g1_soldOut.x,g1_soldOut.y = display.contentWidth*0.15,display.contentHeight*0.15
	sceneGroup:insert(g1_soldOut)
	if loadedClothes.g1Sold==0 then 
		g1_soldOut.alpha=1
		gwajam1:removeEventListener(touch,buy)
	else 
		gwajam1:addEventListener("touch",buy)
		g1_soldOut.alpha=0
	end

	local g2_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	g2_soldOut.x,g2_soldOut.y = display.contentWidth*0.33,display.contentHeight*0.15
	sceneGroup:insert(g2_soldOut)
	if loadedClothes.g2Sold==0 then 
		g2_soldOut.alpha=1
		gwajam2:removeEventListener(touch,buy)
	else 
		gwajam2:addEventListener("touch",buy)
		g2_soldOut.alpha=0
	end

	local g3_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	g3_soldOut.x,g3_soldOut.y = display.contentWidth*0.5,display.contentHeight*0.15
	sceneGroup:insert(g3_soldOut)
	if loadedClothes.g3Sold==0 then 
		g3_soldOut.alpha=1
		gwajam3:removeEventListener(touch,buy)
	else 
		gwajam3:addEventListener("touch",buy)
		g3_soldOut.alpha=0
	end

	local g4_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	g4_soldOut.x,g4_soldOut.y = display.contentWidth*0.67,display.contentHeight*0.15
	sceneGroup:insert(g4_soldOut)
	if loadedClothes.g4Sold==0 then 
		g4_soldOut.alpha=1
		gwajam4:removeEventListener(touch,buy)
	else 
		gwajam4:addEventListener("touch",buy)
		g4_soldOut.alpha=0
	end

	local g5_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	g5_soldOut.x,g5_soldOut.y = display.contentWidth*0.85,display.contentHeight*0.15
	sceneGroup:insert(g5_soldOut)
	if loadedClothes.g5Sold==0 then 
		g5_soldOut.alpha=1
		gwajam5:removeEventListener(touch,buy)
	else 
		gwajam5:addEventListener("touch",buy)
		g5_soldOut.alpha=0
	end


	local a1_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	a1_soldOut.x,a1_soldOut.y = display.contentWidth*0.15,display.contentHeight*0.45
	sceneGroup:insert(a1_soldOut)
	if loadedClothes.a1Sold==0 then 
		a1_soldOut.alpha=1
		animal1:removeEventListener(touch,buy)
	else 
		animal1:addEventListener("touch",buy)
		a1_soldOut.alpha=0
	end

	local a2_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	a2_soldOut.x,a2_soldOut.y = display.contentWidth*0.33,display.contentHeight*0.45
	sceneGroup:insert(a2_soldOut)
	if loadedClothes.a2Sold==0 then 
		a2_soldOut.alpha=1
		animal2:removeEventListener(touch,buy)
	else 
		animal2:addEventListener("touch",buy)
		a2_soldOut.alpha=0
	end

	local a3_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	a3_soldOut.x,a3_soldOut.y = display.contentWidth*0.5,display.contentHeight*0.45
	sceneGroup:insert(a3_soldOut)
	if loadedClothes.a3Sold==0 then 
		a3_soldOut.alpha=1
		animal3:removeEventListener(touch,buy)
	else 
		animal3:addEventListener("touch",buy)
		a3_soldOut.alpha=0
	end

	local a4_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	a4_soldOut.x,a4_soldOut.y = display.contentWidth*0.67,display.contentHeight*0.45
	sceneGroup:insert(a4_soldOut)
	if loadedClothes.a4Sold==0 then 
		a4_soldOut.alpha=1
		animal4:removeEventListener(touch,buy)
	else 
		animal4:addEventListener("touch",buy)
		a4_soldOut.alpha=0
	end

	local a5_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	a5_soldOut.x,a5_soldOut.y = display.contentWidth*0.85,display.contentHeight*0.45
	sceneGroup:insert(a5_soldOut)
	if loadedClothes.a5Sold==0 then 
		a5_soldOut.alpha=1
		animal5:removeEventListener(touch,buy)
	else 
		animal5:addEventListener("touch",buy)
		a5_soldOut.alpha=0
	end


	local t1_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	t1_soldOut.x,t1_soldOut.y = display.contentWidth*0.15,display.contentHeight*0.75
	sceneGroup:insert(t1_soldOut)
	if loadedClothes.t1Sold==0 then 
		t1_soldOut.alpha=1
		twopiece1:removeEventListener(touch,buy)
	else 
		twopiece1:addEventListener("touch",buy)
		t1_soldOut.alpha=0
	end

	local t2_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	t2_soldOut.x,t2_soldOut.y = display.contentWidth*0.33,display.contentHeight*0.75
	sceneGroup:insert(t2_soldOut)
	if loadedClothes.t2Sold==0 then 
		t2_soldOut.alpha=1
		twopiece2:removeEventListener(touch,buy)
	else 
		twopiece2:addEventListener("touch",buy)
		t2_soldOut.alpha=0
	end

	local t3_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	t3_soldOut.x,t3_soldOut.y = display.contentWidth*0.5,display.contentHeight*0.75
	sceneGroup:insert(t3_soldOut)
	if loadedClothes.t3Sold==0 then 
		t3_soldOut.alpha=1
		twopiece3:removeEventListener(touch,buy)
	else 
		twopiece3:addEventListener("touch",buy)
		t3_soldOut.alpha=0
	end

	local t4_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	t4_soldOut.x,t4_soldOut.y = display.contentWidth*0.67,display.contentHeight*0.75
	sceneGroup:insert(t4_soldOut)
	if loadedClothes.t4Sold==0 then 
		t4_soldOut.alpha=1
		twopiece4:removeEventListener(touch,buy)
	else 
		twopiece4:addEventListener("touch",buy)
		t4_soldOut.alpha=0
	end

	local t5_soldOut = display.newImageRect("image/상점/soldout.png",135,135)
	t5_soldOut.x,t5_soldOut.y = display.contentWidth*0.85,display.contentHeight*0.75
	sceneGroup:insert(t5_soldOut)
	if loadedClothes.t5Sold==0 then 
		t5_soldOut.alpha=1
		twopiece5:removeEventListener(touch,buy)
	else 
		twopiece5:addEventListener("touch",buy)
		t5_soldOut.alpha=0
	end




	local next = display.newImageRect("image/상점/화살표_왼.png",80,140)
	next.x,next.y = display.contentWidth*0.04,display.contentHeight*0.5
	sceneGroup:insert(next)
	--가격

	local g1 = 500
	local showLimit = display.newText(g1,display.contentWidth*0.15,display.contentHeight*0.3)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local g2 = 500
	local showLimit = display.newText(g2,display.contentWidth*0.33,display.contentHeight*0.3)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local g3 = 500
	local showLimit = display.newText(g3,display.contentWidth*0.5,display.contentHeight*0.3)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local g4 = 500
	local showLimit = display.newText(g4,display.contentWidth*0.67,display.contentHeight*0.3)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local g5 = 500
	local showLimit = display.newText(g5,display.contentWidth*0.85,display.contentHeight*0.3)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)


	local a1 = 1000
	local showLimit = display.newText(a1,display.contentWidth*0.15,display.contentHeight*0.6)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local a2 = 1000
	local showLimit = display.newText(a2,display.contentWidth*0.33,display.contentHeight*0.6)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local a3 = 1000
	local showLimit = display.newText(a3,display.contentWidth*0.5,display.contentHeight*0.6)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local a4 = 1000
	local showLimit = display.newText(a4,display.contentWidth*0.67,display.contentHeight*0.6)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local a5 = 1000
	local showLimit = display.newText(a5,display.contentWidth*0.85,display.contentHeight*0.6)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)


	local t1 = 2000
	local showLimit = display.newText(t1,display.contentWidth*0.15,display.contentHeight*0.89)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local t2 = 2000
	local showLimit = display.newText(t2,display.contentWidth*0.33,display.contentHeight*0.89)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local t3 = 2000
	local showLimit = display.newText(t3,display.contentWidth*0.5,display.contentHeight*0.89)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local t4 = 2000
	local showLimit = display.newText(t4,display.contentWidth*0.67,display.contentHeight*0.89)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	local t5 = 2000
	local showLimit = display.newText(t5,display.contentWidth*0.85,display.contentHeight*0.89)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	
	


	
	








	
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