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

function scene:create( event )
	local sceneGroup = self.view
	

	local background= display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	--돈
	local m = loadedItem.money
	local showLimit = display.newText(m,display.contentWidth*0.85,display.contentHeight*0.2)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	

	--옷
	local gwajam1 = display.newImageRect("image/상점/과잠_1.png",160,135)
	gwajam1.x,gwajam1.y = display.contentWidth*0.15,display.contentHeight*0.15
	sceneGroup:insert(gwajam1)
	gwajam1.name="gwajam1"
	gwajam1.id=500

	local gwajam2 = display.newImageRect("image/상점/과잠_2.png",160,135)
	gwajam2.x,gwajam2.y = display.contentWidth*0.33,display.contentHeight*0.15
	sceneGroup:insert(gwajam2)
	gwajam2.name="gwajam2"
	gwajam2.id=500

	local gwajam3 = display.newImageRect("image/상점/과잠_3.png",160,135)
	gwajam3.x,gwajam3.y = display.contentWidth*0.5,display.contentHeight*0.15
	sceneGroup:insert(gwajam3)
	gwajam3.name="gwajam3"
	gwajam3.id=500

	local gwajam4 = display.newImageRect("image/상점/과잠_4.png",160,135)
	gwajam4.x,gwajam4.y = display.contentWidth*0.67,display.contentHeight*0.15
	sceneGroup:insert(gwajam4)
	gwajam4.name="gwajam4"
	gwajam4.id=500

	local gwajam5 = display.newImageRect("image/상점/과잠_5.png",160,135)
	gwajam5.x,gwajam5.y = display.contentWidth*0.85,display.contentHeight*0.15
	sceneGroup:insert(gwajam5)
	gwajam5.name="gwajam5"
	gwajam5.id=500


	local animal1 = display.newImageRect("image/상점/동물_1.png",135,135)
	animal1.x,animal1.y = display.contentWidth*0.15,display.contentHeight*0.45
	sceneGroup:insert(animal1)
	animal1.name="animal1"
	animal1.id=1000

	local animal2 = display.newImageRect("image/상점/동물_2.png",135,135)
	animal2.x,animal2.y = display.contentWidth*0.33,display.contentHeight*0.45
	sceneGroup:insert(animal2)
	animal2.name="animal2"
	animal2.id=1000

	local animal3 = display.newImageRect("image/상점/동물_3.png",135,135)
	animal3.x,animal3.y = display.contentWidth*0.5,display.contentHeight*0.45
	sceneGroup:insert(animal3)
	animal3.name="animal3"
	animal3.id=1000

	local animal4 = display.newImageRect("image/상점/동물_4.png",135,135)
	animal4.x,animal4.y = display.contentWidth*0.67,display.contentHeight*0.45
	sceneGroup:insert(animal4)
	animal4.name="animal4"
	animal4.id=1000

	local animal5 = display.newImageRect("image/상점/동물_5.png",135,135)
	animal5.x,animal5.y = display.contentWidth*0.85,display.contentHeight*0.45
	sceneGroup:insert(animal5)
	animal5.name="animal5"
	animal5.id=1000


	local twopiece1 = display.newImageRect("image/상점/투피스_1.png",135,135)
	twopiece1.x,twopiece1.y = display.contentWidth*0.15,display.contentHeight*0.75
	sceneGroup:insert(twopiece1)
	twopiece1.name="twopiece1"
	twopiece1.id=2000

	local twopiece2 = display.newImageRect("image/상점/투피스_2.png",135,135)
	twopiece2.x,twopiece2.y = display.contentWidth*0.33,display.contentHeight*0.75
	sceneGroup:insert(twopiece2)
	twopiece2.name="twopiece2"
	twopiece2.id=2000

	local twopiece3 = display.newImageRect("image/상점/투피스_3.png",135,135)
	twopiece3.x,twopiece3.y = display.contentWidth*0.5,display.contentHeight*0.75
	sceneGroup:insert(twopiece3)
	twopiece3.name="twopiece3"
	twopiece3.id=2000

	local twopiece4 = display.newImageRect("image/상점/투피스_4.png",135,135)
	twopiece4.x,twopiece4.y = display.contentWidth*0.67,display.contentHeight*0.75
	sceneGroup:insert(twopiece4)
	twopiece4.name="twopiece4"
	twopiece4.id=2000

	local twopiece5 = display.newImageRect("image/상점/투피스_5.png",135,135)
	twopiece5.x,twopiece5.y = display.contentWidth*0.85,display.contentHeight*0.75
	sceneGroup:insert(twopiece5)
	twopiece5.name="twopiece5"
	twopiece5.id=2000







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
	gwajam1:addEventListener("touch",buy)
	gwajam2:addEventListener("touch",buy)
	gwajam3:addEventListener("touch",buy)
	gwajam4:addEventListener("touch",buy)
	gwajam5:addEventListener("touch",buy)

	animal1:addEventListener("touch",buy)
	animal2:addEventListener("touch",buy)
	animal3:addEventListener("touch",buy)
	animal4:addEventListener("touch",buy)
	animal5:addEventListener("touch",buy)

	twopiece1:addEventListener("touch",buy)
	twopiece2:addEventListener("touch",buy)
	twopiece3:addEventListener("touch",buy)
	twopiece4:addEventListener("touch",buy)
	twopiece5:addEventListener("touch",buy)

	local function nextStore(event)
		composer.removeScene("상점_옷")
	   	composer.gotoScene("상점")
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