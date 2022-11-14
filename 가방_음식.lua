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
	local loadedItems= loadsave.loadTable( "items.json" )



	local function go_back(event)
		if event.phase == "began" then
			composer.removeScene("가방_음식")
			composer.gotoScene("메인화면")
		end
	end
	
	local function go_popup(event)
		if event.phase == "began" then
			composer.removeScene("가방_음식")
			composer.gotoScene("가방_음식_popup")
		end
	end


	local update = display.newImage("image/숨은그림찾기/white.png")
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)

	local basic_button= display.newImage("image/상점/화살표.png")
	basic_button.x, basic_button.y = display.contentWidth*0.3066, display.contentHeight*0.0774
	basic_button.anchorX,basic_button.anchorY=0,0

	sceneGroup:insert(basic_button)

	local pretty_button= display.newImage("image/상점/화살표.png")
	pretty_button.x, pretty_button.y = display.contentWidth*0.5, display.contentHeight*0.0774
	sceneGroup:insert(pretty_button)
	pretty_button.anchorX,pretty_button.anchorY=0,0
	pretty_button:addEventListener("touch",go_popup)


	local exit = display.newImage("image/상점/화살표.png")
	exit.x, exit.y = display.contentWidth*0.9207, display.contentHeight*0.0438
	exit.anchorX, exit.anchorY = 0,0
	
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	local function click( event )
		composer.setVariable("item",event.target.id)
		composer.showOverlay( "가방_음식_popup",options)
	end

	--반복문 정리--
	local function image( num )
		if num == 1 then
			local item1 = display.newImage("image/가방/" .. loadedItems.food1 .. ".png")
			item1.x, item1.y =  display.contentWidth*0.0516, display.contentHeight*0.2818
			item1.id = loadedItems.food1
			item1.anchorX, item1.anchorY = 0,0
			sceneGroup:insert(item1)
			item1:addEventListener("touch", click)
			if(loadedItems.item1Count > 1) then
				--중복
				local jungbok1 = display.newRect(30,30)
				S1:setFillColor(1)
				jungbok1.x, jungbok1.y =  display.contentWidth*0.1313, display.contentHeight*0.3019
				sceneGroup:insert(jungbok1)
				--중복 몇개?
				local jungbok1Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.3037)
				jungbok1Count:setFillColor(0.9, 0.76, 0.83)
				jungbok1Count.text = loadedItems.item1Count
				jungbok1Count.size = 30
				sceneGroup:insert(jungbok1Count)
			end
		elseif num == 2 then
			local item2 = display.newImage("image/가방/" .. loadedItems.food2 .. ".png")
			item2.x, item2.y =  display.contentWidth*0.1670, display.contentHeight*0.2818
			item2.id = loadedItems.food2
			item2.anchorX, item2.anchorY = 0,0
			sceneGroup:insert(item2)
			item2:addEventListener("touch", click)
			if(loadedItems.item2Count > 1) then
				--중복
				local jungbok1 = display.newRect(30,30)
				S1:setFillColor(1)
				jungbok1.x, jungbok1.y =  display.contentWidth*0.1313, display.contentHeight*0.3019
				sceneGroup:insert(jungbok1)
				--중복 몇개?
				local jungbok1Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.3037)
				jungbok1Count:setFillColor(0.9, 0.76, 0.83)
				jungbok1Count.text = loadedItems.item1Count
				jungbok1Count.size = 30
				sceneGroup:insert(jungbok1Count)
			end
		elseif num == 3 then
			local item3 = display.newImage("image/가방/" .. loadedItems.food3 .. ".png")
			item3.x, item3.y =  display.contentWidth*0.2823, display.contentHeight*0.2818
			sceneGroup:insert(item3)
			item3.id = loadedItems.food3
			item3.anchorX, item3.anchorY = 0,0
			item3:addEventListener("touch", click)
			if(loadedItems.item3Count > 1) then
				--중복
				local jungbok1 = display.newRect(30,30)
				S1:setFillColor(1)
				jungbok1.x, jungbok1.y =  display.contentWidth*0.1313, display.contentHeight*0.3019
				sceneGroup:insert(jungbok1)
				--중복 몇개?
				local jungbok1Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.3037)
				jungbok1Count:setFillColor(0.9, 0.76, 0.83)
				jungbok1Count.text = loadedItems.item1Count
				jungbok1Count.size = 30
				sceneGroup:insert(jungbok1Count)
			end
		elseif num == 4 then
			local item4 = display.newImage("image/가방/" .. loadedItems.food4 .. ".png")
			item4.x, item4.y =  display.contentWidth*0.3977, display.contentHeight*0.2818
			sceneGroup:insert(item4)
			item4.id = loadedItems.food4
			item4.anchorX, item4.anchorY = 0,0
			item4:addEventListener("touch", click)
			if(loadedItems.item4Count > 1) then
				--중복
				local jungbok1 = display.newRect(30,30)
				S1:setFillColor(1)
				jungbok1.x, jungbok1.y =  display.contentWidth*0.1313, display.contentHeight*0.3019
				sceneGroup:insert(jungbok1)
				--중복 몇개?
				local jungbok1Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.3037)
				jungbok1Count:setFillColor(0.9, 0.76, 0.83)
				jungbok1Count.text = loadedItems.item1Count
				jungbok1Count.size = 30
				sceneGroup:insert(jungbok1Count)
			end
		elseif num == 5 then
			local item5 = display.newImage("image/가방/" .. loadedItems.food5 .. ".png")
			item5.x, item5.y =  display.contentWidth*0.5130, display.contentHeight*0.2818
			sceneGroup:insert(item5)
			item5.id = loadedItems.food5
			item5.anchorX, item5.anchorY = 0,0
			item5:addEventListener("touch", click)
			if(loadedItems.item5Count > 1) then
				--중복
				local jungbok1 = display.newRect(30,30)
				S1:setFillColor(1)
				jungbok1.x, jungbok1.y =  display.contentWidth*0.1313, display.contentHeight*0.3019
				sceneGroup:insert(jungbok1)
				--중복 몇개?
				local jungbok1Count = display.newText("",display.contentWidth*0.1307, display.contentHeight*0.3037)
				jungbok1Count:setFillColor(0.9, 0.76, 0.83)
				jungbok1Count.text = loadedItems.item1Count
				jungbok1Count.size = 30
				sceneGroup:insert(jungbok1Count)
			end
		end
	end

	local count = loadedItems.foodCount

	for i=1,count do 
		image(i)
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
