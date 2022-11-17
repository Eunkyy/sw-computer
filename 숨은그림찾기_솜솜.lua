-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local soundEffect = audio.loadSound( "bgm/picture_bg.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 2 )

	local S1=display.newRect(display.contentWidth*0.6, display.contentHeight*0.35,30,30)
	S1:setFillColor(0)
	sceneGroup:insert(S1)

	local background= display.newImageRect("image/숨은그림찾기/배경.jpg",1280,720)
	background.x,background.y = display.contentWidth/2,display.contentHeight/2
	background.alpha=1
	sceneGroup:insert(background)

	local map = display.newImageRect("image/숨은그림찾기/캠퍼스.jpg",941,529)
	map.x,map.y = display.contentWidth*0.38,display.contentHeight*0.55
	map.alpha=1
	sceneGroup:insert(map)

	local correct = display.newImageRect("image/숨은그림찾기/체크.png",100,70)
	correct.x,correct.y = display.contentWidth*0.603,display.contentHeight*0.354
	correct.alpha=0
	sceneGroup:insert(correct)

	local somsom = display.newImageRect("image/숨은그림찾기/솜솜이.png",450,450)
	somsom.x,somsom.y = display.contentWidth*0.82,display.contentHeight*0.7
	sceneGroup:insert(somsom)

	local hint = display.newImageRect("image/숨은그림찾기/말풍선3.png",270,270)
	hint.x,hint.y = display.contentWidth*0.86,display.contentHeight*0.458
	sceneGroup:insert(hint)

	local somText = display.newText("숨어있는 나를 찾아봐!",display.contentWidth*0.855, display.contentHeight*0.47,"font/NanumSquare_acB.ttf")
	somText:setFillColor(0)
	somText.size = 18
	sceneGroup:insert(somText)

	local hintText = display.newText("힌트를 보고 싶으면 말풍선 클릭!",display.contentWidth*0.12, display.contentHeight*0.15,"font/NanumSquare_acB.ttf")
	hintText:setFillColor(0)
	hintText.size = 25
	sceneGroup:insert(hintText)



	local time = display.newImageRect("image/숨은그림찾기/타이머.png", 80,80)
	time.x,time.y = display.contentWidth*0.79, display.contentHeight*0.25
	sceneGroup:insert(time)
	

	local limit = 30
	local showLimit = display.newText(limit,display.contentWidth*0.88,display.contentHeight*0.25,"font/잘풀리는오늘 Medium.ttf")
	showLimit:setFillColor(1,0,0)
	showLimit.size =70
	sceneGroup:insert(showLimit)

	local function timeAttack( event )

		limit = limit - 1
		showLimit.text = limit

		if limit == 0 then
			local options={
				effect ="fade",
				time=1000
				}
			timer.cancelAll()
			audio.pause( backgroundMusicChannel )
			composer.removeScene("숨은그림찾기_솜솜")
			composer.gotoScene("숨은그림찾기_실패",options)
		end
	end
	
	timer.performWithDelay( 1000, timeAttack, 0 )

	local function find(event)
		correct.alpha=1
		timer.cancelAll()  
		audio.pause( backgroundMusicChannel )    
		composer.removeScene( "숨은그림찾기_솜솜" )
      local options={
			effect ="fade",
			time=1000
		}
		
	  composer.gotoScene("숨은그림찾기_성공",options) 
  	end
  	S1:addEventListener("tap",find)

  	local function clickHint(event)
		somText.text="이 곳에서 들리는\n피아노 소리는\n늘 아름다워!"
  	end
  	hint:addEventListener("tap",clickHint)
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