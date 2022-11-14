-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedSettings = loadsave.loadTable( "settings.json" )
	local loadedItems= loadsave.loadTable( "clothes.json" )

	--버튼 함수--

	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("가방_옷")
			composer.gotoScene("메인화면")
		end
	end
	



	local update = display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)





	--메인화면 나가기 버튼--
	local exit = display.newImageRect("image/상점/화살표.png",30,30)
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	m="나가기"
	local showLimit = display.newText(m,display.contentWidth*0.9,display.contentHeight*0.0438)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)


	--아이템 목록--

	local gwajamImage = {}
	local animalImage = {}
	local twopieceImage = {}
	
	gwajamImage[1] = loadedItems.gwajam1
	gwajamImage[2] = loadedItems.gwajam2
	gwajamImage[3] = loadedItems.gwajam3
	gwajamImage[4] = loadedItems.gwajam4
	gwajamImage[4] = loadedItems.gwajam5

	animalImage[1] = loadedItems.animal1
	animalImage[2] = loadedItems.animal2
	animalImage[3] = loadedItems.animal3
	animalImage[4] = loadedItems.animal4
	animalImage[4] = loadedItems.animal5

	twopieceImage[1] = loadedItems.twopiece1
	twopieceImage[2] = loadedItems.twopiece2
	twopieceImage[3] = loadedItems.twopiece3
	twopieceImage[4] = loadedItems.twopiece4
	twopieceImage[4] = loadedItems.twopiece5

	local gwajam = {}
	local animal = {}
	local twopiece = {}

	local gwajamCount=loadedItems.gwajamCount
	local animalCount=loadedItems.animalCount
	local twopieceCount=loadedItems.twopieceCount

	print(gwajamImage[1])


	
	--아이템 함수--
	local function popup(event)
		if event.phase == "began" then
			composer.setVariable("item",event.target.id)
			composer.removeScene("가방_옷")
			composer.gotoScene("가방_옷_popup")
		end
	end
	if gwajamCount>=1 then
		for i=1,gwajamCount do
			print(gwajamImage[i])
			 gwajam[i] = display.newImageRect("image/가방/" .. gwajamImage[i] .. ".png",135,135)
			 gwajam[i].x,gwajam[i].y = display.contentWidth*0.15 + display.contentWidth*0.18*(i-1),display.contentHeight*0.15
			 sceneGroup:insert(gwajam[i])
			 gwajam[i].id = gwajamImage[i]
			 gwajam[i]:addEventListener("touch",popup)
			 gwajam[i].anchorX,gwajam[i].anchorY = 0,0
		end
	end

	if animalCount>=1 then
		for i=1,animalCount do
			 animal[i] = display.newImageRect("image/가방/" .. animalImage[i] .. ".png",135,135)
			 animal[i].x,animal[i].y = display.contentWidth*0.15 + display.contentWidth*0.18*(i-1),display.contentHeight*0.45
			 sceneGroup:insert(animal[i])
			 animal[i].id = animalImage[i]
			 animal[i]:addEventListener("touch",popup)
			 animal[i].anchorX,animal[i].anchorY = 0,0
		end
	end

	if twopieceCount>=1 then
		for i=1,twopieceCount do
			 twopiece[i] = display.newImageRect("image/가방/" .. twopieceImage[i] .. ".png",135,135)
			 twopiece[i].x,twopiece[i].y = display.contentWidth*0.15 + display.contentWidth*0.18*(i-1),display.contentHeight*0.75
			 sceneGroup:insert(twopiece[i])
			 twopiece[i].id = twopieceImage[i]
			 twopiece[i]:addEventListener("touch",popup)
			 twopiece[i].anchorX,twopiece[i].anchorY = 0,0
		end
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
