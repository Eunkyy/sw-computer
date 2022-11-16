local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )

function scene:create( event )
	local sceneGroup = self.view
	local loadedClothes = loadsave.loadTable( "clothes.json" )
	local loadedItems= loadsave.loadTable( "items.json" )
	local loadedSettings= loadsave.loadTable( "settings.json" )

	
	item = composer.getVariable("item")
	j=0

	local update = display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	update.x, update.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(update)

	--아이템 목록--

	local gwajamImage = {}
	local animalImage = {}
	local twopieceImage = {}
	
	gwajamImage[1] = loadedClothes.gwajam1
	gwajamImage[2] = loadedClothes.gwajam2
	gwajamImage[3] = loadedClothes.gwajam3
	gwajamImage[4] = loadedClothes.gwajam4
	gwajamImage[4] = loadedClothes.gwajam5

	animalImage[1] = loadedClothes.animal1
	animalImage[2] = loadedClothes.animal2
	animalImage[3] = loadedClothes.animal3
	animalImage[4] = loadedClothes.animal4
	animalImage[4] = loadedClothes.animal5

	twopieceImage[1] = loadedClothes.twopiece1
	twopieceImage[2] = loadedClothes.twopiece2
	twopieceImage[3] = loadedClothes.twopiece3
	twopieceImage[4] = loadedClothes.twopiece4
	twopieceImage[4] = loadedClothes.twopiece5

	local gwajam = {}
	local animal = {}
	local twopiece = {}

	local gwajamCount=loadedClothes.gwajamCount
	local animalCount=loadedClothes.animalCount
	local twopieceCount=loadedClothes.twopieceCount

	print(gwajamImage[1])


	if gwajamCount>=1 then
		for i=1,gwajamCount do
			print(gwajamImage[i])
			 gwajam[i] = display.newImageRect("image/가방/" .. gwajamImage[i] .. ".png",135,135)
			 gwajam[i].x,gwajam[i].y = display.contentWidth*0.15 + display.contentWidth*0.18*(i-1),display.contentHeight*0.15
			 sceneGroup:insert(gwajam[i])
			 gwajam[i].id = gwajamImage[i]
			 gwajam[i].anchorX,gwajam[i].anchorY = 0,0
		end
	end

	if animalCount>=1 then
		for i=1,animalCount do
			 animal[i] = display.newImageRect("image/가방/" .. animalImage[i] .. ".png",135,135)
			 animal[i].x,animal[i].y = display.contentWidth*0.15 + display.contentWidth*0.18*(i-1),display.contentHeight*0.45
			 sceneGroup:insert(animal[i])
			 animal[i].id = animalImage[i]
			 animal[i].anchorX,animal[i].anchorY = 0,0
		end
	end

	if twopieceCount>=1 then
		for i=1,twopieceCount do
			 twopiece[i] = display.newImageRect("image/가방/" .. twopieceImage[i] .. ".png",135,135)
			 twopiece[i].x,twopiece[i].y = display.contentWidth*0.15 + display.contentWidth*0.18*(i-1),display.contentHeight*0.75
			 sceneGroup:insert(twopiece[i])
			 twopiece[i].id = twopieceImage[i]
			 twopiece[i].anchorX,twopiece[i].anchorY = 0,0
		end
	end
	
local bg = display.newImageRect("image/UI/black.png",1280,720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	bg.alpha=0.5
	sceneGroup:insert(bg)

print(item.."---")
		print("!!!!"..loadedClothes.clo4_apply);
	if (item == "gwajam1") then
		apply_count =loadedClothes.clo1_apply
	elseif (item == "gwajam2") then
		apply_count =loadedClothes.clo2_apply
	elseif (item == "gwajam3") then
		apply_count =loadedClothes.clo3_apply
	elseif (item == "gwajam4") then
		apply_count =loadedClothes.clo4_apply
	elseif (item == "gwajam5") then
		apply_count =loadedClothes.clo5_apply
	elseif (item == "animal1") then
		apply_count =loadedClothes.clo6_apply
	elseif (item == "animal2") then
		apply_count =loadedClothes.clo7_apply
	elseif (item == "animal3") then
		apply_count =loadedClothes.clo8_apply
	elseif (item == "animal4") then
		apply_count =loadedClothes.clo9_apply
	elseif (item == "animal5") then
		apply_count =loadedClothes.clo10_apply
	elseif (item == "twopiece1") then
		apply_count =loadedClothes.clo11_apply
	elseif (item == "twopiece2") then
		apply_count =loadedClothes.clo12_apply
	elseif (item == "twopiece3") then
		apply_count =loadedClothes.clo13_apply
	elseif (item == "twopiece4") then
		apply_count =loadedClothes.clo14_apply
	elseif (item == "twopiece5") then
		apply_count =loadedClothes.clo15_apply
	-- elseif (item == "리본_1") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "리본_2") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "모자_1") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "모자_2") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "모자_3") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "모자_4") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "모자_5") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "모자_6") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "안경_1") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "안경_2") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "안경_3") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "왕관_1") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "왕관_2") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "잎_1") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "잎_2") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "헤드셋_1") then
	-- 	apply_count =loadedItems.clo15_apply
	-- elseif (item == "헤드셋_2") then
	-- 	apply_count =loadedItems.clo15_apply
	end

	if (apply_count==0) then
		i=0
	else
		i=1
	end

	-- local function head_clear()
	-- 	loadedItems.item1_apply=0
	-- 	loadedItems.item2_apply=0
	-- 	loadedItems.item3_apply=0
	-- 	loadedItems.item4_apply=0
	-- 	loadedItems.item5_apply=0
	-- 	loadedItems.item6_apply=0
	-- 	loadedItems.item7_apply=0
	-- 	loadedItems.item8_apply=0
	-- 	loadedItems.item12_apply=0
	-- 	loadedItems.item13_apply=0
	-- 	loadedItems.item14_apply=0
	-- 	loadedItems.item15_apply=0
	-- end

	-- local function eye_clear()
	-- 	loadedItems.item9_apply=0
	-- 	loadedItems.item10_apply=0
	-- 	loadedItems.item11_apply=0
	-- end

	-- local function ear_clear()
	-- 	loadedItems.item16_apply=0
	-- 	loadedItems.item17_apply=0
	-- end
	
local function clo_clear()
			loadedClothes.clo1_apply= 0
            loadedClothes.clo2_apply= 0
            loadedClothes.clo3_apply= 0
            loadedClothes.clo4_apply= 0
            loadedClothes.clo5_apply= 0
            loadedClothes.clo6_apply= 0
            loadedClothes.clo7_apply= 0
            loadedClothes.clo8_apply= 0
            loadedClothes.clo9_apply= 0
            loadedClothes.clo10_apply= 0
            loadedClothes.clo11_apply= 0
            loadedClothes.clo12_apply= 0
            loadedClothes.clo13_apply= 0
            loadedClothes.clo14_apply= 0
            loadedClothes.clo15_apply= 0
	end

	i=1
	local function put_apply() 
		if (item == "gwajam1") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo1_apply = i
		elseif (item == "gwajam2") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo2_apply= i
		elseif (item == "gwajam3") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo3_apply= i
		elseif (item == "gwajam4") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo4_apply= i
		elseif (item == "gwajam5") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo5_apply= i
		elseif (item == "animal1") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo6_apply= i
		elseif (item == "animal2") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo7_apply= i
		elseif (item == "animal3") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo8_apply= i
		elseif (item == "animal4") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo9_apply= i
		elseif (item == "animal5") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo10_apply= i
		elseif (item == "twopiece1") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo11_apply= i
		elseif (item == "twopiece2") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo12_apply= i
		elseif (item == "twopiece3") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo13_apply= i
		elseif (item == "twopiece4") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo14_apply= i
		elseif (item == "twopiece5") then
			if (j==1) then
				clo_clear()
			end
			loadedClothes.clo15_apply= i
		-- elseif (item == "리본_1") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item1_apply= i
		-- elseif (item == "리본_2") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item2_apply= i
		-- elseif (item == "모자_1") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item3_apply= i
		-- elseif (item == "모자_2") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item4_apply= i
		-- elseif (item == "모자_3") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item5_apply= i
		-- elseif (item == "모자_4") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item6_apply= i
		-- elseif (item == "모자_5") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item7_apply= i
		-- elseif (item == "모자_6") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item8_apply= i
		-- elseif (item == "안경_1") then
		-- 	if (j==1) then
		-- 		eye_clear()
		-- 	end
		-- 	loadedItems.item9_apply= i
		-- elseif (item == "안경_2") then
		-- 	if (j==1) then
		-- 		eye_clear()
		-- 	end
		-- 	loadedItems.item10_apply= i
		-- elseif (item == "안경_3") then
		-- 	if (j==1) then
		-- 		eye_clear()
		-- 	end
		-- 	loadedItems.item11_apply= i
		-- elseif (item == "왕관_1") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item12_apply= i
		-- elseif (item == "왕관_2") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item13_apply= i
		-- elseif (item == "잎_1") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item14_apply= i
		-- elseif (item == "잎_2") then
		-- 	if (j==1) then
		-- 		head_clear()
		-- 	end
		-- 	loadedItems.item15_apply= i
		-- elseif (item == "헤드셋_1") then
		-- 	if (j==1) then
		-- 		ear_clear()
		-- 	end
		-- 	loadedItems.item16_apply= i
		-- elseif (item == "헤드셋_2") then
		-- 	if (j==1) then
		-- 		ear_clear()
		-- 	end
		-- 	loadedItems.item17_apply= i
		 end
	end
	
	local function go_back(event)
		if event.phase == "began" then
			loadsave.saveTable(loadedClothes,"clothes.json")
			loadsave.saveTable(loadedItems,"items.json")
			loadsave.saveTable(loadedSettings,"settings.json")
			audio.pause( backgroundMusicChannel )
			composer.removeScene("가방_옷_popup")
			composer.gotoScene("메인화면")
		end
	end

	-- local function apply_function(event)
	-- 	if event.phase == "began" then
	-- 		if (j==0) then 
	-- 			j=1
	-- 		end

	-- 		if (i==0) then 
	-- 			event.target.fill = {type="image",filename="image/UI/rbt.png"}
	-- 			i=i+1
	-- 		else
	-- 			event.target.fill = {type="image",filename="image/UI/bbt.png"}
	-- 			i=i-1
	-- 		end
	-- 	end
	-- end
	local function apply_function(event)
		if event.phase == "began" then
			if (j==0) then 
				j=1
			end
			put_apply()
			loadedSettings.apply=1
		end
	end

local function apply_function2(event)
		if event.phase == "began" then
			if (j==0) then 
				j=1
			end
				clo_clear()
			loadedSettings.apply=0
		end
	end

	local popup = display.newImageRect("image/UI/popup.png",600, 400)
	popup.x, popup.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(popup)

	local itemImg = display.newImageRect("image/가방/" .. item .. ".png",300,200)
	itemImg.x, itemImg.y = display.contentWidth*0.5, display.contentHeight*0.45
	sceneGroup:insert(itemImg)


	local exit = display.newImageRect("image/UI/x.png",60,60)
	exit.x = display.contentWidth*0.72

	exit.y = display.contentHeight*0.27
	sceneGroup:insert(exit)
	exit:addEventListener("touch",go_back)

	if (apply_count==0) then
		apply = display.newImageRect("image/UI/bbt.png",130,50)

		apply.x, apply.y = display.contentWidth*0.5, display.contentHeight*0.65
		sceneGroup:insert(apply)
		apply:addEventListener("touch",apply_function)
		local text = display.newText("적용하기", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
			text:setFillColor(1)
			sceneGroup:insert(text)
	else
		apply2 = display.newImageRect("image/UI/rbt.png",130,50) --적용중
		apply2.x, apply2.y = display.contentWidth*0.5, display.contentHeight*0.65
		sceneGroup:insert(apply2)
		apply2:addEventListener("touch",apply_function2)
		local text = display.newText("적용중", display.contentWidth/2, display.contentHeight*0.65, "font/NanumSquareRoundB.ttf", 30)
		text:setFillColor(1)
			sceneGroup:insert(text)
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
