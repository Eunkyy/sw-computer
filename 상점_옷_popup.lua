-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local json = require( "json" )
local scene = composer.newScene()
local loadedItem= loadsave.loadTable( "setting.json" )


function scene:create( event )
	local sceneGroup = self.view


	item=composer.getVariable("item", item)
	money=composer.getVariable("money", money)

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

	local gwajam2 = display.newImageRect("image/상점/과잠_2.png",160,135)
	gwajam2.x,gwajam2.y = display.contentWidth*0.33,display.contentHeight*0.15
	sceneGroup:insert(gwajam2)

	local gwajam3 = display.newImageRect("image/상점/과잠_3.png",160,135)
	gwajam3.x,gwajam3.y = display.contentWidth*0.5,display.contentHeight*0.15
	sceneGroup:insert(gwajam3)

	local gwajam4 = display.newImageRect("image/상점/과잠_4.png",160,135)
	gwajam4.x,gwajam4.y = display.contentWidth*0.67,display.contentHeight*0.15
	sceneGroup:insert(gwajam4)

	local gwajam5 = display.newImageRect("image/상점/과잠_5.png",160,135)
	gwajam5.x,gwajam5.y = display.contentWidth*0.85,display.contentHeight*0.15
	sceneGroup:insert(gwajam5)


	local animal1 = display.newImageRect("image/상점/동물_1.png",135,135)
	animal1.x,animal1.y = display.contentWidth*0.15,display.contentHeight*0.45
	sceneGroup:insert(animal1)

	local animal2 = display.newImageRect("image/상점/동물_2.png",135,135)
	animal2.x,animal2.y = display.contentWidth*0.33,display.contentHeight*0.45
	sceneGroup:insert(animal2)

	local animal3 = display.newImageRect("image/상점/동물_3.png",135,135)
	animal3.x,animal3.y = display.contentWidth*0.5,display.contentHeight*0.45
	sceneGroup:insert(animal3)

	local animal4 = display.newImageRect("image/상점/동물_4.png",135,135)
	animal4.x,animal4.y = display.contentWidth*0.67,display.contentHeight*0.45
	sceneGroup:insert(animal4)

	local animal5 = display.newImageRect("image/상점/동물_5.png",135,135)
	animal5.x,animal5.y = display.contentWidth*0.85,display.contentHeight*0.45
	sceneGroup:insert(animal5)


	local twopiece1 = display.newImageRect("image/상점/투피스_1.png",135,135)
	twopiece1.x,twopiece1.y = display.contentWidth*0.15,display.contentHeight*0.75
	sceneGroup:insert(twopiece1)

	local twopiece2 = display.newImageRect("image/상점/투피스_2.png",135,135)
	twopiece2.x,twopiece2.y = display.contentWidth*0.33,display.contentHeight*0.75
	sceneGroup:insert(twopiece2)

	local twopiece3 = display.newImageRect("image/상점/투피스_3.png",135,135)
	twopiece3.x,twopiece3.y = display.contentWidth*0.5,display.contentHeight*0.75
	sceneGroup:insert(twopiece3)

	local twopiece4 = display.newImageRect("image/상점/투피스_4.png",135,135)
	twopiece4.x,twopiece4.y = display.contentWidth*0.67,display.contentHeight*0.75
	sceneGroup:insert(twopiece4)

	local twopiece5 = display.newImageRect("image/상점/투피스_5.png",135,135)
	twopiece5.x,twopiece5.y = display.contentWidth*0.85,display.contentHeight*0.75
	sceneGroup:insert(twopiece5)




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

	--팝업창

	local p=display.newRect(display.contentWidth*0.5, display.contentHeight*0.5,500,400)
	p:setFillColor(1)
	sceneGroup:insert(p)

	local p_edge = display.newImageRect("image/상점/테두리_꽃.png",570,480)
	p_edge.x,p_edge.y = display.contentWidth*0.5,display.contentHeight*0.5
	sceneGroup:insert(p_edge)


	local buyText = display.newText("        상품을\n구매하시겠습니까?",display.contentWidth*0.5,display.contentHeight*0.54)
	buyText:setFillColor(0)
	buyText.size =40
	sceneGroup:insert(buyText)


		local selectItem1 = display.newImageRect("image/상점/과잠_1.png",150,150)
		selectItem1.x,selectItem1.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem1)
		local selectItem2 = display.newImageRect("image/상점/과잠_2.png",150,150)
		selectItem2.x,selectItem2.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem2)
		local selectItem3 = display.newImageRect("image/상점/과잠_3.png",150,150)
		selectItem3.x,selectItem3.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem3)
		local selectItem4 = display.newImageRect("image/상점/과잠_4.png",150,150)
		selectItem4.x,selectItem4.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem4)
		local selectItem5 = display.newImageRect("image/상점/과잠_5.png",150,150)
		selectItem5.x,selectItem5.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem5)
		local selectItem6 = display.newImageRect("image/상점/동물_1.png",150,150)
		selectItem6.x,selectItem6.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem6)
		local selectItem7 = display.newImageRect("image/상점/동물_2.png",150,150)
		selectItem7.x,selectItem7.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem7)
		local selectItem8 = display.newImageRect("image/상점/동물_3.png",150,150)
		selectItem8.x,selectItem8.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem8)
		local selectItem9 = display.newImageRect("image/상점/동물_4.png",150,150)
		selectItem9.x,selectItem9.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem9)
		local selectItem10 = display.newImageRect("image/상점/동물_5.png",150,150)
		selectItem10.x,selectItem10.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem10)
		local selectItem11 = display.newImageRect("image/상점/투피스_1.png",150,150)
		selectItem11.x,selectItem11.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem11)
		local selectItem12 = display.newImageRect("image/상점/투피스_2.png",150,150)
		selectItem12.x,selectItem12.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem12)
		local selectItem13 = display.newImageRect("image/상점/투피스_3.png",150,150)
		selectItem13.x,selectItem13.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem13)
		local selectItem14 = display.newImageRect("image/상점/투피스_4.png",150,150)
		selectItem14.x,selectItem14.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem14)
		local selectItem15 = display.newImageRect("image/상점/투피스_5.png",150,150)
		selectItem15.x,selectItem15.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem15)
		selectItem1.alpha=0   
		selectItem2.alpha=0   
		selectItem3.alpha=0  
		selectItem4.alpha=0   
		selectItem5.alpha=0   
		selectItem6.alpha=0
		selectItem7.alpha=0
		selectItem8.alpha=0
		selectItem9.alpha=0
		selectItem10.alpha=0
		selectItem11.alpha=0
		selectItem12.alpha=0
		selectItem13.alpha=0
		selectItem14.alpha=0
		selectItem15.alpha=0

	if item=="gwajam1" then 
		selectItem1.alpha=1
	elseif item=="gwajam2" then 
		selectItem2.alpha=1
	elseif item=="gwajam3" then 
		selectItem3.alpha=1
	elseif item=="gwajam4" then 
		selectItem4.alpha=1
	elseif item=="gwajam5" then
		selectItem5.alpha=1
	elseif item=="animal1" then 
		selectItem6.alpha=1
	elseif item=="animal2" then 
		selectItem7.alpha=1
	elseif item=="animal3" then 
		selectItem8.alpha=1
	elseif item=="animal4" then 
		selectItem9.alpha=1
	elseif item=="animal5" then
		selectItem10.alpha=1
	elseif item=="twopiece1" then 
		selectItem11.alpha=1
	elseif item=="twopiece2" then 
		selectItem12.alpha=1
	elseif item=="twopiece3" then 
		selectItem13.alpha=1
	elseif item=="twopiece4" then 
		selectItem14.alpha=1
	elseif item=="twopiece5" then
		selectItem15.alpha=1
	else
		selectItem1.alpha=1
	end



	local S1=display.newRect(display.contentWidth*0.41, display.contentHeight*0.69,150,70)
	S1:setFillColor(0)
	sceneGroup:insert(S1)

	local S1text = display.newText("예",display.contentWidth*0.41,display.contentHeight*0.69)
	S1text:setFillColor(1)
	S1text.size =40
	sceneGroup:insert(S1text)

	local S2=display.newRect(display.contentWidth*0.59, display.contentHeight*0.69,150,70)
	S2:setFillColor(0)
	sceneGroup:insert(S2)

	local S2text = display.newText("아니오",display.contentWidth*0.59,display.contentHeight*0.69)
	S2text:setFillColor(1)
	S2text.size =40
	sceneGroup:insert(S2text)

	local S3=display.newRect(display.contentWidth*0.5, display.contentHeight*0.69,150,70)
	S3:setFillColor(0)
	sceneGroup:insert(S3)

	local S3text = display.newText("",display.contentWidth*0.5,display.contentHeight*0.69)
	S3text:setFillColor(1)
	S3text.size =40
	sceneGroup:insert(S3text)
	S3.alpha=0

	 local function buy_popup(event)
	 		if loadedItem.money-money>=0 then
	         if item=="gwajam1" then
	            loadedItem.gwajam1_count=loadedItem.gwajam1_count+1            
	         end
	         if item=="gwajam2" then
	            loadedItem.gwajam2_count=loadedItem.gwajam2_count+1            
	         end
	         if item=="gwajam3" then
	            loadedItem.gwajam3_count=loadedItem.gwajam3_count+1            
	         end
	         if item=="gwajam4" then
	            loadedItem.gwajam4_count=loadedItem.gwajam4_count+1            
	         end
	         if item=="gwajam5" then
	            loadedItem.gwajam5_count=loadedItem.gwajam5_count+1            
	         end

	         if item=="animal1" then
	            loadedItem.animal1_count=loadedItem.animal1_count+1            
	         end
	         if item=="animal2" then
	            loadedItem.animal2_count=loadedItem.animal2_count+1            
	         end
	         if item=="animal3" then
	            loadedItem.animal3_count=loadedItem.animal3_count+1            
	         end
	         if item=="animal4" then
	            loadedItem.animal4_count=loadedItem.animal4_count+1            
	         end
	         if item=="animal5" then
	            loadedItem.animal5_count=loadedItem.animal5_count+1            
	         end

	         if item=="twopiece1" then
	            loadedItem.twopiece1_count=loadedItem.twopiece1_count+1            
	         end
	         if item=="twopiece2" then
	            loadedItem.twopiece2_count=loadedItem.twopiece2_count+1            
	         end
	         if item=="twopiece3" then
	            loadedItem.twopiece3_count=loadedItem.twopiece3_count+1            
	         end
	         if item=="twopiece4" then
	            loadedItem.twopiece4_count=loadedItem.twopiece4_count+1            
	         end
	         if item=="twopiece5" then
	            loadedItem.twopiece5_count=loadedItem.twopiece5_count+1            
	         end
			 S1.alpha=0
			 S2text.alpha=0
			 buyText.text="구매가 완료되었습니다"
			 S2.alpha=0
			 S3.alpha=1
			 S3text.text="나가기"
 
			 loadedItem.money=loadedItem.money-money
			 loadsave.saveTable(loadedItem,"setting.json")
				else
				 S1.alpha=0
				 S2text.alpha=0
				 buyText.text="잔액이 부족합니다."
				 S2.alpha=0
				 S3.alpha=1
				 S3text.text="나가기"
				 
					
				end

       		



         
      end
      S1:addEventListener("tap",buy_popup)

      local function popup_down(event)
      	composer.removeScene("상점_옷_popup")
        composer.gotoScene("상점_옷")
       end
       S2:addEventListener("tap",popup_down)
	   S3:addEventListener("tap",popup_down)
	   



	
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