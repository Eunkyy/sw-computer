local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
local loadedFood=loadsave.loadTable("food.json")
	local loadedItems= loadsave.loadTable( "items.json" )
local loadedSettings= loadsave.loadTable( "settings.json" )
	
	-- local soundEffect = audio.loadSound( "bgm/store_bg.mp3" )
	-- local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	-- audio.setVolume( 2 )

	item = composer.getVariable("item")
	mn = composer.getVariable("money")
	j=0

	print("item"..item)
	local update = display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)

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

	local bg = display.newImageRect("image/UI/black.png",1280,720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	bg.alpha=0.5
	sceneGroup:insert(bg)

print(item.."---")
	local function alert()
		print("수량이 부족합니다. 상점에서 구매해주세요.")
	end


	i=1
	local function put_apply() 
		if (item == "tteokbokki") then
			if loadedFood.tteokbokki_count > 0 then
					loadedFood.tt_apply = 1
					loadedFood.tteokbokki_count = loadedFood.tteokbokki_count - 1
			end
		elseif (item == "fishCake") then
			if loadedFood.fishCake_count > 0 then
					loadedFood.fs_apply = 1
					loadedFood.fishCake_count = loadedFood.fishCake_count -1
			end
		elseif (item == "sundae") then
			if loadedFood.sundae_count > 0 then
					loadedFood.sd_apply = 1
					loadedFood.sundae_count = loadedFood.sundae_count - 1
			end
		elseif (item == "steak") then
			if loadedFood.steak_count > 0 then
					loadedFood.st_apply = 1
					loadedFood.steak_count = loadedFood.steak_count - 1
			end
		elseif (item == "fried") then
			if loadedFood.fried_count > 0 then
					loadedFood.fr_apply = 1
					loadedFood.fried_count = loadedFood.fried_count - 1
			end
		end
	end


	local function apply_function(event)
		if event.phase == "began" then
			if (j==0) then 
				j=1
			end
			put_apply()

			loadedSettings.eat=1

			loadedSettings.level = loadedSettings.level + 1
			loadsave.saveTable(loadedFood,"food.json")
			loadsave.saveTable(loadedItems,"items.json")
			loadsave.saveTable(loadedSettings,"settings.json")
			audio.pause( backgroundMusicChannel )
			composer.removeScene("가방_음식_popup")
			composer.gotoScene("메인화면")
		end
	end

local function apply_function2(event)
		if event.phase == "began" then
			if (j==0) then 
				j=1
			end
			loadedSettings.eat=0
			loadsave.saveTable(loadedFood,"food.json")
			loadsave.saveTable(loadedItems,"items.json")
			loadsave.saveTable(loadedSettings,"settings.json")
			audio.pause( backgroundMusicChannel )
			composer.removeScene("가방_음식_popup")
			composer.gotoScene("상점")
		end
	end

	local function go_back(event)
		if event.phase == "began" then
			loadedSettings.eat=0
			loadsave.saveTable(loadedFood,"food.json")
			loadsave.saveTable(loadedItems,"items.json")
			loadsave.saveTable(loadedSettings,"settings.json")
			audio.pause( backgroundMusicChannel )
			composer.removeScene("가방_음식_popup")
			composer.gotoScene("가방_음식")
		end
	end

	local popup = display.newImageRect("image/UI/popup.png",600, 400)
	popup.x, popup.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(popup)

	local itemImg = display.newImageRect("image/가방/" .. item .. ".jpeg",300,200)
	itemImg.x, itemImg.y = display.contentWidth*0.5, display.contentHeight*0.45
	sceneGroup:insert(itemImg)


	local exit = display.newImageRect("image/UI/x.png",60,60)
	exit.x = display.contentWidth*0.72

	exit.y = display.contentHeight*0.27
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

		if (item == "tteokbokki") then
			if loadedFood.tteokbokki_count > 0 then
					apply = display.newImageRect("image/UI/bbt.png",190,60)
					apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.65
					sceneGroup:insert(apply)
					apply:addEventListener("touch",apply_function)
					local text = display.newText("솜솜이 주기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
					text:setFillColor(1)
					sceneGroup:insert(text)
			else
				apply2 = display.newImageRect("image/UI/rbt.png",190,60) --적용중
				apply2.x, apply2.y = display.contentWidth*0.5, display.contentHeight*0.65
				sceneGroup:insert(apply2)
				apply2:addEventListener("touch",apply_function2)
				local text = display.newText("상점으로 가기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
				text:setFillColor(1)
				sceneGroup:insert(text)
			end
		elseif (item == "fishCake") then
			if loadedFood.fishCake_count > 0 then
					apply = display.newImageRect("image/UI/bbt.png",190,60)
					apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.65
					sceneGroup:insert(apply)
					apply:addEventListener("touch",apply_function)
					local text = display.newText("솜솜이 주기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
					text:setFillColor(1)
					sceneGroup:insert(text)
			else
				apply2 = display.newImageRect("image/UI/rbt.png",190,60) --적용중
				apply2.x, apply2.y = display.contentWidth*0.5, display.contentHeight*0.65
				sceneGroup:insert(apply2)
				apply2:addEventListener("touch",apply_function2)
				local text = display.newText("상점으로 가기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
				text:setFillColor(1)
				sceneGroup:insert(text)
			end
		elseif (item == "sundae") then
			if loadedFood.sundae_count > 0 then
					apply = display.newImageRect("image/UI/bbt.png",190,60)
					apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.65
					sceneGroup:insert(apply)
					apply:addEventListener("touch",apply_function)
					local text = display.newText("솜솜이 주기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
					text:setFillColor(1)
					sceneGroup:insert(text)
			else
				apply2 = display.newImageRect("image/UI/rbt.png",190,60) --적용중
				apply2.x, apply2.y = display.contentWidth*0.5, display.contentHeight*0.65
				sceneGroup:insert(apply2)
				apply2:addEventListener("touch",apply_function2)
				local text = display.newText("상점으로 가기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
				text:setFillColor(1)
				sceneGroup:insert(text)
			end
		elseif (item == "steak") then
			if loadedFood.steak_count > 0 then
					apply = display.newImageRect("image/UI/bbt.png",190,60)
					apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.65
					sceneGroup:insert(apply)
					apply:addEventListener("touch",apply_function)
					local text = display.newText("솜솜이 주기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
					text:setFillColor(1)
					sceneGroup:insert(text)
			else
				apply2 = display.newImageRect("image/UI/rbt.png",190,60) --적용중
				apply2.x, apply2.y = display.contentWidth*0.5, display.contentHeight*0.65
				sceneGroup:insert(apply2)
				apply2:addEventListener("touch",apply_function2)
				local text = display.newText("상점으로 가기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
				text:setFillColor(1)
				sceneGroup:insert(text)
			end
		elseif (item == "fried") then
			if loadedFood.fried_count > 0 then
					apply = display.newImageRect("image/UI/bbt.png",190,60)
					apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.65
					sceneGroup:insert(apply)
					apply:addEventListener("touch",apply_function)
					local text = display.newText("솜솜이 주기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
					text:setFillColor(1)
					sceneGroup:insert(text)
			else
				apply2 = display.newImageRect("image/UI/rbt.png",190,60) --적용중
				apply2.x, apply2.y = display.contentWidth*0.5, display.contentHeight*0.65
				sceneGroup:insert(apply2)
				apply2:addEventListener("touch",apply_function2)
				local text = display.newText("상점으로 가기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
				text:setFillColor(1)
				sceneGroup:insert(text)
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
