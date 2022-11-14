-----------------------------------------------------------------------------------------
--
-- beforeGame.lua
--
-----------------------------------------------------------------------------------------

local loadsave = require( "loadsave" )
local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" ) 

function scene:create( event )
	local sceneGroup = self.view

	-- Path for the file to read
-- local path = system.pathForFile( "settings.json", system.DocumentsDirectory )
--  print("path = " .. path)

-- -- Open the file handle
-- local file, errorString = io.open( path, "r" )
 
-- if not file then
--     -- Error occurred; output the cause
--     print( "File error: " .. errorString )
-- else
--     -- Read data from file
--     local contents = file:read( "*a" )
--     -- Output the file contents
--     print( "Contents of " .. path .. "\n" .. contents )
--     -- Close the file handle
--     io.close( file )
-- end
 
--file = nil
	
	local background = display.newImageRect("image/bg3.jpg", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	
	 local gBox = display.newRect( display.contentWidth/2, display.contentHeight/2 + 125,370, 80)
	gBox:setFillColor( 0.5, 0.7, 0.7 )
	gBox.alpha = 0.8

	local guide = display.newText("GAME GUIDE", display.contentWidth/2, display.contentHeight/2+130, "font/SunriseInternationalDemo.otf", 70)
	guide:setFillColor(0)
	

	local function goToGuide(event)
		composer.removeScene("title")

	   	sceneGroup:insert(background)
	   	sceneGroup:insert(guide)
	   	sceneGroup:insert(gBox)

	   	composer.gotoScene("메인화면", { time=800, effect="crossFade" })
	end

	gBox:addEventListener("tap", goToGuide)

    local path = system.pathForFile( "setting.json", system.DocumentsDirectory)
 
    local file, errorString = io.open( path, "r" )
    if not file then
        print("make an item file")
        --엔딩관련 데이터 파일 생성
        local setting = {
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

			money = 2000,

			tteokbokki_count=0,
            fishCake_count=0,
            sundae_count=0,
            steak_count=0,
            fried_count=0,

            gwajam1_count=0,
            gwajam2_count=0,
            gwajam3_count=0,
            gwajam4_count=0,
            gwajam5_count=0,
            animal1_count=0,
            animal2_count=0,
            animal3_count=0,
            animal4_count=0,
            animal5_count=0,
            twopiece1_count=0,
            twopiece2_count=0,
            twopiece3_count=0,
            twopiece4_count=0,
            twopiece5_count=0
        }
        loadsave.saveTable( setting, "setting.json" )

    local path = system.pathForFile( "items.json", system.DocumentsDirectory)
 
    local file, errorString = io.open( path, "r" )
    if not file then
        print("make an item file")
        --엔딩관련 데이터 파일 생성
        local items = {
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