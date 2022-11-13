-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local json = require( "json" )
local scene = composer.newScene()
local loadedSettings = loadsave.loadTable( "setting.json" )


function scene:create( event )
	local sceneGroup = self.view


	local item=composer.getVariable("item", item)
	local money=composer.getVariable("money", money)



	local background= display.newImageRect("image/숨은그림찾기/white.png",1280,720)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	sceneGroup:insert(background)

	--돈
	local m = loadedSettings.money
	local showLimit = display.newText(m,display.contentWidth*0.85,display.contentHeight*0.2)
	showLimit:setFillColor(0)
	showLimit.size =40
	sceneGroup:insert(showLimit)

	--음식
	local tteokbokki = display.newImageRect("image/상점/떡볶이.jpeg",150,150)
	tteokbokki.x,tteokbokki.y = display.contentWidth*0.15,display.contentHeight*0.4
	sceneGroup:insert(tteokbokki)
	tteokbokki.name="tteokbokki"
	tteokbokki.id=500

	local fishCake = display.newImageRect("image/상점/어묵.jpeg",150,150)
	fishCake.x,fishCake.y = display.contentWidth*0.33,display.contentHeight*0.4
	sceneGroup:insert(fishCake)
	fishCake.name="fishCake"
	fishCake.id=500

	local sundae = display.newImageRect("image/상점/순대.jpeg",150,150)
	sundae.x,sundae.y = display.contentWidth*0.5,display.contentHeight*0.4
	sceneGroup:insert(sundae)
	sundae.name="sundae"
	sundae.id=500

	local steak = display.newImageRect("image/상점/스테이크.jpeg",150,150)
	steak.x,steak.y = display.contentWidth*0.67,display.contentHeight*0.4
	sceneGroup:insert(steak)
	steak.name="steak"
	steak.id=500

	local fried = display.newImageRect("image/상점/튀김.jpeg",150,150)
	fried.x,fried.y = display.contentWidth*0.85,display.contentHeight*0.4
	sceneGroup:insert(fried)
	fried.name="fried"
	fried.id=500




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


		local selectItem1 = display.newImageRect("image/상점/떡볶이.jpeg",150,150)
		selectItem1.x,selectItem1.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem1)
		local selectItem2 = display.newImageRect("image/상점/어묵.jpeg",150,150)
		selectItem2.x,selectItem2.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem2)
		local selectItem3 = display.newImageRect("image/상점/순대.jpeg",150,150)
		selectItem3.x,selectItem3.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem3)
		local selectItem4 = display.newImageRect("image/상점/스테이크.jpeg",150,150)
		selectItem4.x,selectItem4.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem4)
		local selectItem5 = display.newImageRect("image/상점/튀김.jpeg",150,150)
		selectItem5.x,selectItem5.y = display.contentWidth*0.5,display.contentHeight*0.36
		sceneGroup:insert(selectItem5)
		selectItem1.alpha=0
		selectItem2.alpha=0
		selectItem3.alpha=0
		selectItem4.alpha=0
		selectItem5.alpha=0

	if item=="tteokbokki" then 
		selectItem1.alpha=1
	elseif item=="fishCake" then 
		selectItem2.alpha=1
	elseif item=="sundae" then 
		selectItem3.alpha=1
	elseif item=="steak" then 
		selectItem4.alpha=1
	elseif item=="fried" then
		selectItem5.alpha=1
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
	        if loadedSettings.money-money>=0 then
            if item=="tteokbokki" then
               loadedSettings.tteokbokki_count=loadedSettings.tteokbokki_count+1            
            end

            if item=="fishCake" then
               loadedSettings.fishCake_count=loadedSettings.fishCake_count+1            
            end

            if item=="sundae" then
               loadedSettings.sundae_count=loadedSettings.sundae_count+1            
            end

            if item=="steak" then
               loadedSettings.steak_count=loadedSettings.steak_count+1            
            end

            if item=="fried" then
               loadedSettings.fried_count=loadedSettings.fried_count+1            
            end
			S1.alpha=0
			S2text.alpha=0
			buyText.text="구매가 완료되었습니다"
			S2.alpha=0
			S3.alpha=1
			S3text.text="나가기"

            loadedSettings.money=loadedSettings.money-money
			loadsave.saveTable(loadedSettings,"setting.json")
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
      	composer.removeScene("상점_popup")
        composer.gotoScene("상점")
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