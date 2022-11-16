-----------------------------------------------------------------------------------------
--
-- intro.lua
--
-----------------------------------------------------------------------------------------
local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 
local widget = require( "widget" )
local buttonUI = {}

function scene:create( event )
	local sceneGroup = self.view

	local soundEffect = audio.loadSound( "bgm/intro_bg.mp3" )
	local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 1 )
	local background = display.newImageRect( "image/시작화면/intro.jpg", display.contentWidth, display.contentHeight )
		background.x = display.contentWidth/2
		background.y = display.contentHeight/2

	 --기본설정 DB

	    local path = system.pathForFile( "settings.json", system.DocumentsDirectory)
	    print(path)
	 
	    local file, errorString = io.open( path, "r" )
	    if not file then
	        print("make an item file")
	        --엔딩관련 데이터 파일 생성
	    end
	        local settings = {
				money = 2000
	        }
	        loadsave.saveTable( settings, "settings.json" )

	    --음식 DB

	    local path = system.pathForFile( "food.json", system.DocumentsDirectory)
	    print(path)
	    local file, errorString = io.open( path, "r" )
	    if not file then
	        print("make an item file")
	        --엔딩관련 데이터 파일 생성
	    end
	        local food ={
	            foodCount=0,

	            food1="",
	            food2="",
	            food3="",
	            food4="",
	            food5="",

	            tteokbokki_count=0,
	            fishCake_count=0,
	            sundae_count=0,
	            steak_count=0,
	            fried_count=0,
	        }

	        loadsave.saveTable( food, "food.json" )

	    --옷DB

	    local path = system.pathForFile( "clothes.json", system.DocumentsDirectory)
	    print(path)
	    local file, errorString = io.open( path, "r" )
	    if not file then
	        print("make an item file")
	        --엔딩관련 데이터 파일 생성
	    end
	        local clothes ={
	            clo1_apply= 0,
	            clo2_apply= 0,
	            clo3_apply= 0,
	            clo4_apply= 0,
	            clo5_apply= 0,
	            clo6_apply= 0,
	            clo7_apply= 0,
	            clo8_apply= 0,
	            clo9_apply= 0,
	            clo10_apply= 0,
	            clo11_apply= 0,
	            clo12_apply= 0,
	            clo13_apply= 0,
	            clo14_apply= 0,
	            clo15_apply= 0,

	            gwajamCount=0,
	            animalCount=0,
	            twopieceCount=0,

	            g1Sold=1,
	            g2Sold=1,
	            g3Sold=1,
	            g4Sold=1,
	            g5Sold=1,
	            a1Sold=1,
	            a2Sold=1,
	            a3Sold=1,
	            a4Sold=1,
	            a5Sold=1,
	            t1Sold=1,
	            t2Sold=1,
	            t3Sold=1,
	            t4Sold=1,
	            t5Sold=1,

	            clo1="과잠_1",
	            clo2="과잠_2",
	            clo3="과잠_3",
	            clo4="과잠_4",
	            clo5="과잠_5",
	            clo6="동물_1",
	            clo7="동물_2",
	            clo8="동물_3",
	            clo9="동물_4",
	            clo10="동물_5",
	            clo11="투피스_1",
	            clo12="투피스_2",
	            clo13="투피스_3",
	            clo14="투피스_4",
	            clo15="투피스_5",

	            cloCount=0,

	            gwajam1="",
	            gwajam2="",
	            gwajam3="",
	            gwajam4="",
	            gwajam5="",

	            animal1="",
	            animal2="",
	            animal3="",
	            animal4="",
	            animal5="",

	            twopiece1="",
	            twopiece2="",
	            twopiece3="",
	            twopiece4="",
	            twopiece5="",

	            clothes1="",
	            clothes2="",
	            clothes3="",
	            clothes4="",
	            clothes5="",
	            clothes6="",
	            clothes7="",
	            clothes8="",
	            clothes9="",
	            clothes10="",
	            clothes11="",
	            clothes12="",
	            clothes13="",
	            clothes14="",
	            clothes15=""
	        }

	        loadsave.saveTable( clothes, "clothes.json" )

	    --아이템DB

	    local path = system.pathForFile( "items.json", system.DocumentsDirectory)
	    print(path)
	    local file, errorString = io.open( path, "r" )
	    if not file then
	        print("make an item file")
	        --엔딩관련 데이터 파일 생성
	    end
	        local items = {
	            item1_apply= 0,
	            item2_apply= 0,
	            item3_apply= 0,
	            item4_apply= 0,
	            item5_apply= 0,
	            item6_apply= 0,
	            item7_apply= 0,
	            item8_apply= 0,
	            item9_apply= 0,
	            item10_apply= 0,
	            item11_apply= 0,
	            item12_apply= 0,
	            item13_apply= 0,
	            item14_apply= 0,
	            item15_apply= 0,
	            item16_apply= 0,
	            item17_apply= 0,

	        	itemCount=0,

	            item1="리본_1",
	            item2="리본_2",
	            item3="모자_1",
	            item4="모자_2",
	            item5="모자_3",
	            item6="모자_4",
	            item7="모자_5",
	            item8="모자_6",
	            item9="안경_1",
	            item10="안경_2",
	            item11="안경_3",
	            item12="왕관_1",
	            item13="왕관_2",
	            item14="잎_1",
	            item15="잎_2",
	            item16="헤드셋_1",
	            item17="헤드셋_2",

	            decoCount = 0,
				deco1 = "없음",
				deco2 = "없음",
				deco3 = "없음",
				deco4 = "없음",
				deco5 = "없음",
				deco6 = "없음",
				deco7 = "없음",
				deco8 = "없음",
				deco9 = "없음",
				deco10 = "없음",
				deco11 = "없음",
				deco12 = "없음",
				deco13 = "없음",
				deco14 = "없음",
				deco15 = "없음",
				deco16 = "없음",
				deco17 = "없음",

				d1Sold=1,
				d2Sold=1,
				d3Sold=1,
				d4Sold=1,
				d5Sold=1,
				d6Sold=1,
				d7Sold=1,
				d8Sold=1,
				d9Sold=1,
				d10Sold=1,
				d11Sold=1,
				d12Sold=1,
				d13Sold=1,
				d14Sold=1,
				d15Sold=1,
				d16Sold=1,
				d17Sold=1
	        }
	        loadsave.saveTable( items, "items.json" )


	function gotoMain( event )
		audio.pause( backgroundMusicChannel )
		composer.removeScene("intro")
		composer.gotoScene( "메인화면" )
	end

	function inputEvent( event )
		if event.target.name == "start" then
			local t = timer.performWithDelay(1000, gotoMain, 1)
		end
	end

	buttonUI[1] = widget.newButton(
		{ defaultFile = "image/시작화면/start_button.png", overFile = "image/시작화면/start_button.png",
		width = 980, height = 550, onPress = inputEvent }
	)
	buttonUI[1].x = 700
	buttonUI[1].y = 360
	buttonUI[1].name = "start"

	sceneGroup:insert(background)
	sceneGroup:insert(buttonUI[1])
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
		composer.removeScene("intro")
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