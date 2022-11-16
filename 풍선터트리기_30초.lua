-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------
math.randomseed( os.time() )

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local num = {}	
for i = 0, 5, 1 do
	local x = math.random(1, 20)
	if x ~= num[i-1] and x ~= num[i-2]then
		num[i] = x
	end
	if #num == 3 then
		break
	end
end

print(num[0],num[1], num[2])


local ok = {}
local count = 1
for i=1,20,1 do
	if num[0] ~= i and num[1] ~= i and num[2] ~= i then
		ok[count] = i
		count = count+1
	end
end 
for i=0, #num do
	ok[count] = num[i]
	count = count+1
end

function scene:create( event )
	local sceneGroup = self.view

	local soundEffect = audio.loadSound( "bgm/balloon_bg.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 2 )
	
	local background = display.newImageRect("image/풍선터트리기/bg.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2
	sceneGroup:insert(background)

	local som = display.newImageRect("image/풍선터트리기/som.png", 450, 450)
	som.x = display.contentCenterX+450
	som.y = display.contentCenterY+100
	sceneGroup:insert(som)	

	local function gotoResult(flag)
		timer.cancelAll() 
		composer.removeScene("풍선터트리기_30초")
		audio.pause( backgroundMusicChannel )
		if flag == 1 then
			composer.gotoScene("풍선_success")
		elseif flag == -1 then
			composer.gotoScene("풍선_over")
		end
	end

	--timer
	local  time = 30
	local  cText = display.newText("30", background.x + 450, background.y-300, "font/꽃소금체.ttf", 80)
	cText:setFillColor(1, 0.2, 0.2) -- 빨간 색
	sceneGroup:insert(cText)

	local function Timer( event )
		time = time - 1
		local tLeft = string.format("%02d", time)
		cText.text = tLeft

		if time < 1 then
			flag = -1
			gotoResult(flag)
		end
	end


	-- 풍선 or 폭탄 누르면 점수 처리하는 함수
	local image = {} -- 풍선과 폭탄
	function tapEvent(event)
		if event.phase == "began" then
			print("tapEvent() called")
			local flag = 0

			if event.target.name == "b1" then -- balloon	
				transition.fadeOut(image[ok[1]], {time=40})
			elseif event.target.name == "b2" then
				transition.fadeOut(image[ok[2]], {time=40})
			elseif event.target.name == "b3" then
				transition.fadeOut(image[ok[3]], {time=40})
			elseif event.target.name == "b4" then
				transition.fadeOut(image[ok[4]], {time=40})
			elseif event.target.name == "b5" then
				transition.fadeOut(image[ok[5]], {time=40})
			elseif event.target.name == "b6" then 
				transition.fadeOut(image[ok[6]], {time=40})
			elseif event.target.name == "b7" then
				transition.fadeOut(image[ok[7]], {time=40})
			elseif event.target.name == "b8" then
				transition.fadeOut(image[ok[8]], {time=40})
			elseif event.target.name == "b9" then
				transition.fadeOut(image[ok[9]], {time=40})
			elseif event.target.name == "b10" then
				transition.fadeOut(image[ok[10]], {time=40})
			elseif event.target.name == "b11" then
				transition.fadeOut(image[ok[11]], {time=40})
			elseif event.target.name == "b12" then
				transition.fadeOut(image[ok[12]], {time=40})
			elseif event.target.name == "b13" then
				transition.fadeOut(image[ok[13]], {time=40})
			elseif event.target.name == "b14" then
				transition.fadeOut(image[ok[14]], {time=40})		
			elseif event.target.name == "b15" then
				transition.fadeOut(image[ok[15]], {time=40})
			elseif event.target.name == "b16" then -- bomb
				transition.fadeOut(image[ok[16]], {time=40})
			elseif event.target.name == "b17" then
				transition.fadeOut(image[ok[17]], {time=40})
			elseif event.target.name == "b18" then
				transition.fadeOut(image[ok[18]], {time=40})
				time = time-3
				print("시간")
			elseif event.target.name == "b19" then
				transition.fadeOut(image[ok[19]], {time=40})
				time = time-3
				print("시간")
			elseif event.target.name == "b20" then
				transition.fadeOut(image[ok[20]], {time=40})
				time = time-3
				print("시간")
			end

		end

		----- 종료 조건 -----
		function checkSom()	
			-- 풍선을 다 캐치했을 때
			if image[ok[1]].alpha == 0 and image[ok[2]].alpha == 0 and image[ok[3]].alpha == 0 and image[ok[4]].alpha == 0 and image[ok[5]].alpha == 0 and
					image[ok[6]].alpha == 0 and image[ok[7]].alpha == 0 and image[ok[8]].alpha == 0 and image[ok[9]].alpha == 0 and
					image[ok[10]].alpha == 0 and image[ok[11]].alpha == 0 and image[ok[12]].alpha == 0 and image[ok[13]].alpha == 0 and
					image[ok[14]].alpha == 0 and image[ok[15]].alpha == 0 and image[ok[16]].alpha == 0 and image[ok[17]].alpha == 0 then
				flag = 1
				gotoResult(flag)
			end
		end

		function checkBomb()
			-- 폭탄이 다 터졌을 때	
			if image[num[0]].alpha == 0 and image[num[1]].alpha == 0 and image[num[2]].alpha == 0 then
				flag = 0
			end
		end

		-- 풍선과 폭탄이 시간을 두고 fadeOut 하기 때문에 체크 함수는 100ms 후에 돌아가도록 설정
		
		timer.performWithDelay(100, checkSom)
		timer.performWithDelay(100, checkBomb)

	end
	-- create image button
	image[ok[1]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent}) -- gold x 2
	image[ok[2]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[3]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent}) -- silver x 3
	image[ok[4]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent}) 
	image[ok[5]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[6]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent}) -- bronse x 10
	image[ok[7]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[8]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[9]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[10]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[11]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[12]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[13]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[14]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[15]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[16]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent}) -- bomb x 5
	image[ok[17]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/balloon.png", width=150, height=180, onEvent = tapEvent})
	image[ok[18]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/bomb.png", width=150, height=180, onEvent = tapEvent})
	image[ok[19]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/bomb.png", width=150, height=180, onEvent = tapEvent})
	image[ok[20]] = widget.newButton({defaultFile="image/풍선터트리기/balloon.png", overFile="image/풍선터트리기/bomb.png", width=150, height=180, onEvent = tapEvent})
	
	-- image naming
	image[ok[1]].name = "b1"
	image[ok[2]].name = "b2"
	image[ok[3]].name = "b3"
	image[ok[4]].name = "b4"
	image[ok[5]].name = "b5"
	image[ok[6]].name = "b6"
	image[ok[7]].name = "b7"
	image[ok[8]].name = "b8"
	image[ok[9]].name = "b9"
	image[ok[10]].name = "b10"
	image[ok[11]].name = "b11"
	image[ok[12]].name = "b12"
	image[ok[13]].name = "b13"
	image[ok[14]].name = "b14"
	image[ok[15]].name = "b15"
	image[ok[16]].name = "b16"
	image[ok[17]].name = "b17"
	image[ok[18]].name = "b18"
	image[ok[19]].name = "b19"
	image[ok[20]].name = "b20"

	-- 처음 위치 조정
	for i = 1, 20, 1 do 
		if (i <= 4) then
			image[i].x, image[i].y = -50 + (i*230), display.contentCenterY-220
		elseif (i <= 8) then
			image[i].x, image[i].y = -50 + ((i-4)*230), display.contentCenterY-100
		elseif (i <= 12) then
			image[i].x, image[i].y = -50 + ((i-8)*230), display.contentCenterY+20
		elseif (i <= 16) then
			image[i].x, image[i].y = -50 + ((i-12)*230), display.contentCenterY+140
		elseif (i <= 20) then
			image[i].x, image[i].y = -50 + ((i-16)*230), display.contentCenterY+260
		end
		sceneGroup:insert(image[i])
	end
	local tmr1 = timer.performWithDelay(1000, Timer, time) --1초마다 Timer를 불러와줌
	local tmr2 = timer.performWithDelay(20*1000, gotoResult, time)

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