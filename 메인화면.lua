-----------------------------------------------------------------------------------------
--
-- 메인화면.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
local loadsave = require( "loadsave" )
local json = require( "json" )
local widget = require "widget"

local buttonUI = {}
  -- eat = composer.getVariable("eat")
  -- apply = composer.getVariable("apply")

-- print("eat"..eat..",apply"..apply)
function scene:create( event )
	local sceneGroup = self.view
   local loadedClothes = loadsave.loadTable( "clothes.json" )
   local loadedItems= loadsave.loadTable( "items.json" )
   local loadedSettings= loadsave.loadTable( "settings.json" )
	
   eat = loadedSettings.eat
   apply = loadedSettings.apply

   print("eat"..eat.."apply"..apply)
   local soundEffect = audio.loadSound( "bgm/main_bg.mp3" )
   local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
	audio.setVolume( 2 )

	local option1 =
	{ 
		
		width = 230,
		height = 370,
		numFrames = 5,

	}

	local option2 =
	{
		width = 210,
		height = 150,
		numFrames = 4,
	}

	local option3 =
	{
		width = 200,
		height = 320,
		numFrames = 5,
	}


	local option4 =
	{
		width = 180,
		height = 290,
		numFrames = 5,
	}

	
	local sheet1 = graphics.newImageSheet("image/모션/ad2.png", option1)
	local sheet2 = graphics.newImageSheet("image/모션/bb.png", option2)
	local sheet3 = graphics.newImageSheet("image/모션/tn2.png", option3)
	local sheet4 = graphics.newImageSheet("image/모션/kd2.png", option4)
	
	local sq1 = {
		-- consecutive frames sequence
		{
			name="stay",
			start = 1,
			count = 1,
			time = 2000,
			loopCount = 0,
			loopDirection = "forward"
		} ,

		{
			name="ad-eat",
			frames= {4, 1},
			time = 2000,
			loopCount = 3,
		},
		{
			name="ad-click",
			frames= {5, 1},
			time = 1000,
			loopCount = 3,
		},
      {
			name="ad-apply",
			frames= {3, 1},
			time = 1000,
			loopCount = 3,
		},

		{
			name="tn-eat",
			frames= {4, 1},
			time = 2000,
			loopCount = 3,
		},
		{
			name="tn-click",
			frames= {5, 1},
			time = 1000,
			loopCount = 2,
		},

		{
			name="kd-eat",
			frames= {4, 1},
			time = 2000,
			loopCount = 3,
		},
		{
			name="kd-click",
			frames= {5, 1},
			time = 1000,
			loopCount = 2,
		}
	}
	local sq2 = {
		-- consecutive frames sequence
		{
			name="stay",
			start = 2,
			count = 1,
			time = 2000,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name="bb-eat",
			frames= {2, 3},
			time = 2000,
			loopCount = 3,
		},
		{
			name="bb-click",
			frames= {2, 4},
			time = 1000,
			loopCount = 2,
		}
	}


	
	local background = display.newImageRect( "image/메인/main_bg.jpg", 1280, 720 )
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	sceneGroup:insert(background)

	--local som = display.newImageRect("image/som2.png", 635, 635)
	--som.x = display.contentCenterX
	--som.y = 310
	--som.alpha = 1
	--sceneGroup:insert(som)

 --   local ad = display.newSprite(sheet1, sq1)
	-- ad:setSequence("stay")
	-- ad:play()
	-- ad.x = display.contentCenterX - 2
	-- ad.y = 412
	-- ad.name = "adult"
 --   sceneGroup:insert(ad)

   local ad
   local tn
   local kd
   local bb
   function clickSom(event)
      if event.target.name == "adult" then
         ad:setSequence("ad-click")
         ad:play()
      elseif event.target.name == "kid" then
         kd:setSequence("kd-click")
         kd:play()
      elseif event.target.name == "teen" then
         tn:setSequence("tn-click")
         tn:play()
      elseif event.target.name == "baby" then
         bb:setSequence("bb-click")
         bb:play()
      end
   end

   if loadedSettings.level >= 20 then
      ad = display.newSprite(sheet1, sq1)
      ad:setSequence("stay")
      ad:play()
      ad.x = display.contentCenterX - 2
      ad.y = 412
      ad.name = "adult"
      sceneGroup:insert(ad)
      ad:addEventListener("tap", clickSom)

      if apply == 1 then
         ad:setSequence("ad-apply")
         ad:play()
         loadedSettings.apply=0
         loadsave.saveTable(loadedSettings,"settings.json")   
         local ClothesSoundEffect = audio.loadSound("bgm/clothes_change.mp3")
         local ClothesMusicChannel = audio.play( ClothesSoundEffect, {loop=0})
         audio.setVolume( 5 )   
      end
   
      if eat == 1 then
         ad:setSequence("ad-eat")
         ad:play()
         loadedSettings.eat = 0
         loadsave.saveTable(loadedSettings,"settings.json")
         local eatSoundEffect = audio.loadSound("bgm/eat.mp3")
         local EatMusicChannel = audio.play( eatSoundEffect, {loop=0})
         audio.setVolume( 5 )
      end
   elseif  loadedSettings.level >= 10 then
      tn = display.newSprite(sheet3, sq1)
      tn:setSequence("stay")
      tn:play()
      tn.x = display.contentCenterX 
      tn.y = display.contentCenterY + 80
      tn.name = "teen"
      sceneGroup:insert(tn)
      tn:addEventListener("tap", clickSom)

      if apply == 1 then
         tn:setSequence("tn-apply")
         tn:play()
         loadedSettings.apply=0
         loadsave.saveTable(loadedSettings,"settings.json")      
      end

      if eat == 1 then
         tn:setSequence("tn-eat")
         tn:play()
         loadedSettings.eat = 0
         loadsave.saveTable(loadedSettings,"settings.json")
         local eatSoundEffect = audio.loadSound("bgm/eat.mp3")
         local EatMusicChannel = audio.play( eatSoundEffect, {loop=0})
         audio.setVolume( 5 )
      end
   elseif loadedSettings.level >= 5 then
      kd = display.newSprite(sheet4, sq1)
      kd:setSequence("stay")
      kd:play()
      kd.x = display.contentCenterX 
      kd.y = display.contentCenterY + 95
      kd.name = "kid"
      sceneGroup:insert(kd)
      kd:addEventListener("tap", clickSom)

      if apply == 1 then
         kd:setSequence("kd-apply")
         kd:play()
         loadedSettings.apply=0
         loadsave.saveTable(loadedSettings,"settings.json")      
      end
   
      if eat == 1 then
         kd:setSequence("kd-eat")
         kd:play()
         loadedSettings.eat = 0
         loadsave.saveTable(loadedSettings,"settings.json")
         local eatSoundEffect = audio.loadSound("bgm/eat.mp3")
         local EatMusicChannel = audio.play( eatSoundEffect, {loop=0})
         audio.setVolume( 5 )
      end
   else
      bb = display.newSprite(sheet2, sq2)
      bb:setSequence("stay")
      bb:play()
      bb.x = display.contentCenterX 
      bb.y = display.contentCenterY + 180
      bb.name = "baby"
      sceneGroup:insert(bb)
      bb:addEventListener("tap", clickSom)

      if apply == 1 then
         bb:setSequence("bb-apply")
         bb:play()
         loadedSettings.apply=0
         loadsave.saveTable(loadedSettings,"settings.json")      
      end
   
      if eat == 1 then
         bb:setSequence("bb-eat")
         bb:play()
         loadedSettings.eat = 0
         loadsave.saveTable(loadedSettings,"settings.json")
         local eatSoundEffect = audio.loadSound("bgm/eat.mp3")
         local EatMusicChannel = audio.play( eatSoundEffect, {loop=0})
         audio.setVolume( 5 )
      end
   end

	-- bb:addEventListener("tap", clickSom)
	-- tn:addEventListener("tap", clickSom)
	-- kd:addEventListener("tap", clickSom)

 local clo1 = display.newImageRect("image/옷/과잠_1.png", 600, 355)
    clo1.x, clo1.y = display.contentWidth/2 - 37, 405
    clo1:scale( -1, 1 )
    if loadedClothes.clo1_apply == 1 then 
       clo1.alpha=1
    else
       clo1.alpha=0
    end

    local clo2 = display.newImageRect("image/옷/과잠_2.png", 605, 355)
    clo2.x, clo2.y = display.contentWidth/2 - 41, 405
    clo2:scale( -1, 1 )
    if loadedClothes.clo2_apply == 1 then 
       clo2.alpha=1
    else
       clo2.alpha = 0
    end

    local clo3 = display.newImageRect("image/옷/과잠_3.png", 605, 355)
    clo3.x, clo3.y = display.contentWidth/2 - 41, 405
    clo3:scale( -1, 1 )
    if loadedClothes.clo3_apply == 1 then 
       clo3.alpha=1
    else
       clo3.alpha = 0
    end

    local clo4 = display.newImageRect("image/옷/과잠_4.png", 605, 355)
    clo4.x, clo4.y = display.contentWidth/2 - 41, 405
    clo4:scale( -1, 1 )
    if loadedClothes.clo4_apply == 1 then 
       clo4.alpha=1
    else
       clo4.alpha = 0
    end

    local clo5 = display.newImageRect("image/옷/과잠_5.png", 605, 355)
    clo5.x, clo5.y = display.contentWidth/2 - 41, 405
    clo5:scale( -1, 1 )
    if loadedClothes.clo5_apply == 1 then 
       clo5.alpha=1
    else
       clo5.alpha = 0
    end

   local anm1 = display.newImageRect("image/옷/동물_1.png", 208, 178)
    anm1.x, anm1.y = display.contentWidth/2, 504
    anm1:scale( -1, 1 )    
    if loadedClothes.clo6_apply == 1 then 
       anm1.alpha=1
    else
       anm1.alpha = 0
    end

   local anm2 = display.newImageRect("image/옷/동물_2.png", 208, 178)
    anm2.x, anm2.y = display.contentWidth/2, 504
    anm2:scale( -1, 1 )      
    if loadedClothes.clo7_apply == 1 then 
       anm2.alpha=1
    else
       anm2.alpha = 0
    end 

   local anm3 = display.newImageRect("image/옷/동물_3.png", 208, 178)
    anm3.x, anm3.y = display.contentWidth/2, 504
    anm3:scale( -1, 1 )  
    if loadedClothes.clo8_apply == 1 then 
       anm3.alpha=1
    else
       anm3.alpha = 0
    end   

   local anm4 = display.newImageRect("image/옷/동물_4.png", 208, 165)
    anm4.x, anm4.y = display.contentWidth/2, 514
    anm4:scale( -1, 1 )    
    if loadedClothes.clo9_apply == 1 then 
       anm4.alpha=1
    else
       anm4.alpha = 0
    end 

   local anm5 = display.newImageRect("image/옷/동물_5.png", 208, 178)
    anm5.x, anm5.y = display.contentWidth/2, 504
    anm5:scale( -1, 1 )   
    if loadedClothes.clo10_apply == 1 then 
       anm5.alpha=1
    else
       anm5.alpha = 0
    end  

    local opc1 = display.newImageRect("image/옷/투피스_1.png", 435, 373)
    opc1.x, opc1.y = display.contentWidth/2 -77, 390
    opc1:scale( -1, 1 ) 
    if loadedClothes.clo11_apply == 1 then 
       opc1.alpha=1
    else
       opc1.alpha = 0
    end  

    local opc2 = display.newImageRect("image/옷/투피스_2.png", 435, 373)
    opc2.x, opc2.y = display.contentWidth/2 -77, 390
    opc2:scale( -1, 1 ) 
    if loadedClothes.clo12_apply == 1 then 
       opc2.alpha=1
    else
       opc2.alpha = 0
    end  

    local opc3 = display.newImageRect("image/옷/투피스_3.png", 435, 373)
    opc3.x, opc3.y = display.contentWidth/2 -77, 390
    opc3:scale( -1, 1 ) 
    if loadedClothes.clo13_apply == 1 then 
       opc3.alpha=1
    else
       opc3.alpha = 0
    end  

    local opc4 = display.newImageRect("image/옷/투피스_4.png", 435, 373)
    opc4.x, opc4.y = display.contentWidth/2 -77, 390
    opc4:scale( -1, 1 ) 
    if loadedClothes.clo14_apply == 1 then 
       opc4.alpha=1
    else
       opc4.alpha = 0
    end  

    local opc5 = display.newImageRect("image/옷/투피스_5.png", 435, 373)
    opc5.x, opc5.y = display.contentWidth/2 -77, 390
    opc5:scale( -1, 1 ) 
    if loadedClothes.clo15_apply == 1 then 
       opc5.alpha=1
    else
       opc5.alpha = 0
    end  
  
  sceneGroup:insert(clo1)
  sceneGroup:insert(clo2)
  sceneGroup:insert(clo3)
  sceneGroup:insert(clo4)
  sceneGroup:insert(clo5)
  sceneGroup:insert(anm1)
  sceneGroup:insert(anm2)
  sceneGroup:insert(anm3)
  sceneGroup:insert(anm4)
  sceneGroup:insert(anm5)
  sceneGroup:insert(opc1)
  sceneGroup:insert(opc2)
  sceneGroup:insert(opc3)
  sceneGroup:insert(opc4)
  sceneGroup:insert(opc5)
   -- local rb1 = display.newImageRect("image/아이템/리본_1.png", 160, 120)
   -- rb1.x, rb1.y = display.contentWidth/2 + 50, 270
   -- rb1.rotation = 10
   --  if loadedItems.item1_apply == 1 then 
   --     rb1.alpha=1
   --  else
   --     rb1.alpha = 0
   --  end  

   -- local rb2 = display.newImageRect("image/아이템/리본_2.png", 160, 120)
   -- rb2.x, rb2.y = display.contentWidth/2 + 50, 270
   -- rb2.rotation = 10
   --  if loadedItems.item2_apply == 1 then 
   --     rb2.alpha=1
   --  else
   --     rb2.alpha = 0
   --  end  

   --  local gl = display.newImageRect("image/아이템/안경_1.png", 73, 35)
   --  gl.x, gl.y = display.contentWidth/2-1.2, 337.5
   --   gl:scale( -1, 1 ) 
   --   gl.rotation = 357
   --  if loadedItems.item9_apply == 1 then 
   --     gl.alpha=1
   --  else
   --     gl.alpha = 0
   --  end  

   --  local gl2 = display.newImageRect("image/아이템/안경_2.png", 73, 35)
   --  gl2.x, gl2.y = display.contentWidth/2-1.2, 337.5
   --  gl2:scale( -1, 1 ) 
   --  gl2.rotation = 357
   --  if loadedItems.item10_apply == 1 then 
   --     gl2.alpha=1
   --  else
   --     gl2.alpha = 0
   --  end  

   --  local gl3 = display.newImageRect("image/아이템/안경_3.png", 73, 35)
   --  gl3.x, gl3.y = display.contentWidth/2-1.2, 337.5
   --   gl3:scale( -1, 1 ) 
   --   gl3.rotation = 357
   --  if loadedItems.item11_apply == 1 then 
   --     gl3.alpha=1
   --  else
   --     gl3.alpha = 0
   --  end  

   --  local h1 = display.newImageRect("image/아이템/모자_1.png", 180, 90)
   --  h1.x, h1.y = display.contentWidth/2 - 70, 260
   --   h1.rotation = 320
   --  if loadedItems.item3_apply == 1 then 
   --     h1.alpha=1
   --  else
   --     h1.alpha = 0
   --  end  

   --   local h2 = display.newImageRect("image/아이템/모자_2.png", 170, 115)
   --  h2.x, h2.y = display.contentWidth/2 - 70, 270
   --   h2.rotation = 290
   --  if loadedItems.item4_apply == 1 then 
   --     h2.alpha=1
   --  else
   --     h2.alpha = 0
   --  end  

   --  local h3 = display.newImageRect("image/아이템/모자_3.png", 140, 75)
   -- h3.x, h3.y = display.contentWidth/2+30, 245
   --  h3:scale( -1, 1 ) 
   --  h3.rotation = 10
   --  if loadedItems.item5_apply == 1 then 
   --     h3.alpha=1
   --  else
   --     h3.alpha = 0
   --  end  
 
   --  local h4 = display.newImageRect("image/아이템/모자_4.png", 140, 75)
   -- h4.x, h4.y = display.contentWidth/2+30, 245
   --  h4:scale( -1, 1 ) 
   --  h4.rotation = 10
   --  if loadedItems.item6_apply == 1 then 
   --     h4.alpha=1
   --  else
   --     h4.alpha = 0
   --  end  
 
   --  local h5 = display.newImageRect("image/아이템/모자_5.png", 140, 75)
   -- h5.x, h5.y = display.contentWidth/2+30, 245
   --  h5:scale( -1, 1 ) 
   --  h5.rotation = 10
   --  if loadedItems.item7_apply == 1 then 
   --     h5.alpha=1
   --  else
   --     h5.alpha = 0
   --  end  
 
   --  local h6 = display.newImageRect("image/아이템/모자_6.png", 140, 75)
   -- h6.x, h6.y = display.contentWidth/2+30, 245
   --  h6:scale( -1, 1 ) 
   --  h6.rotation = 10
   --  if loadedItems.item8_apply == 1 then 
   --     h6.alpha=1
   --  else
   --     h6.alpha = 0
   --  end  
 
   --  local crn= display.newImageRect("image/아이템/왕관_1.png", 70, 55)
   --  crn.x, crn.y = display.contentWidth/2 + 30, 245
   --  crn.rotation = 20
   --  if loadedItems.item12_apply == 1 then 
   --     crn.alpha=1
   --  else
   --     crn.alpha = 0
   --  end  

   --  local crn2= display.newImageRect("image/아이템/왕관_2.png", 70, 55)
   --  crn2.x, crn2.y = display.contentWidth/2 + 30, 245
   --  crn2.rotation = 20
   --  if loadedItems.item13_apply == 1 then 
   --     crn2.alpha=1
   --  else
   --     crn2.alpha = 0
   --  end  

   --  local lf= display.newImageRect("image/아이템/잎_1.png", 60, 60)
   --  lf.x, lf.y = display.contentWidth/2 + 85, 255
   --  if loadedItems.item14_apply == 1 then 
   --     lf.alpha=1
   --  else
   --     lf.alpha = 0
   --  end  

   --  local lf2= display.newImageRect("image/아이템/잎_2.png", 60, 60)
   --  lf2.x, lf2.y = display.contentWidth/2 + 85, 255
   --  if loadedItems.item15_apply == 1 then 
   --     lf2.alpha=1
   --  else
   --     lf2.alpha = 0
   --  end  

   --  local hd= display.newImageRect("image/아이템/헤드셋_1.png", 245, 140)
   --  hd.x, hd.y = display.contentWidth/2, 300
   --  if loadedItems.item16_apply == 1 then 
   --     hd.alpha=1
   --  else
   --     hd.alpha = 0
   --  end  

   --  local hd2= display.newImageRect("image/아이템/헤드셋_2.png", 245, 140)
   --  hd2.x, hd2.y = display.contentWidth/2, 300
   --  if loadedItems.item17_apply == 1 then 
   --     hd2.alpha=1
   --  else
   --     hd2.alpha = 0
   --  end  


	local cloud = display.newImageRect("image/메인/cloud.png", 200, 200)
	cloud.x = 150
	cloud.y = 150
	sceneGroup:insert(cloud)

	local cloud2 = display.newImageRect("image/메인/cloud.png", 200, 200)
	cloud2.x = 500
	cloud2.y = 100
	sceneGroup:insert(cloud2)

	local cloud3 = display.newImageRect("image/메인/cloud.png", 200, 200)
	cloud3.x = 340
	cloud3.y = 270
	sceneGroup:insert(cloud3)

	local cloud4 = display.newImageRect("image/메인/cloud.png", 200, 200)
	cloud4.x = 780
	cloud4.y = 145
	sceneGroup:insert(cloud4)

	local cloud5 = display.newImageRect("image/메인/cloud.png", 200, 200)
	cloud5.x = 980
	cloud5.y = 285
	sceneGroup:insert(cloud5)

   --레벨&돈
   local text = display.newText("| LV.".. loadedSettings.level.." | money:"..loadedSettings.money.." |", display.contentWidth * 0.2, display.contentHeight*0.058, "font/NanumJangMiCe.ttf", 50)
   text:setFillColor(0)
   sceneGroup:insert(text)

local gage = display.newImageRect( "image/UI/gage.png", 550, 200 )
  gage.x = display.contentWidth/2 + 100
  gage.y = display.contentHeight*0.17
  sceneGroup:insert(gage)

local ht = display.newImageRect( "image/UI/ht.png", 100, 100 )
  if loadedSettings.level < 29 then
      ht.x = 340+ loadedSettings.level * 18 + 100
  else
      ht.x = 340+ 640
  end
   ht.y = display.contentHeight*0.065
  sceneGroup:insert(ht)

	function gotoPic( event )
		audio.pause( backgroundMusicChannel )
		composer.gotoScene( "숨은그림찾기")
	end

	function gotoBal( event )
		audio.pause( backgroundMusicChannel )
		composer.gotoScene( "풍선터트리기" ) 
	end

	function gotoRepo( event )
		audio.pause( backgroundMusicChannel )
		composer.gotoScene( "학점받기" ) 
	end

	function gotoStore( event )
		audio.pause( backgroundMusicChannel )
      composer.removeScene("메인화면")
		composer.gotoScene("상점")
	end

   function gotoBag( event )
      audio.pause( backgroundMusicChannel )
      composer.gotoScene("가방_음식")
   end

	function inputEvent( event )
        if event.target.name == "picture" then
            --transition.to(buttonUI[1], {time = 300, alpha = 0})
            local t = timer.performWithDelay(1000, gotoPic, 1)
        elseif event.target.name == "balloon" then
            --transition.to(buttonUI[2], {time = 500, alpha = 0})
            local t2 = timer.performWithDelay(1000, gotoBal, 1)
        elseif event.target.name == "report" then
            --transition.to(buttonUI[3], {time = 500, alpha = 0})
            local t3 = timer.performWithDelay(1000, gotoRepo, 1)
        --elseif event.target.name == "store" then
            --transition.to(buttonUI[4], {time = 500, alpha = 0})
            --local t4 = timer.performWithDelay(1000, gotoStore, 1)
        elseif event.target.name == "question" then
   			local guideBg = display.newRect(display.contentCenterX, display.contentCenterY, 600, 400)
   			local guideText = display.newText(" ", display.contentWidth/2, display.contentHeight/ 2, "font/NanumJangMiCe.ttf", 30)
   			guideText:setFillColor(0)
   			guideText.text = "솜솜이 키우기\n\n오른쪽에 있는 미니게임으로 코인을 모으세요\n모은 코인으로 상점에서 음식을 구매해 솜솜이를 키워보세요!\n\n돋보기-숨은그림찾기\n솜-솜수집하기\n시험지-학점받기 "
   			local guideExit = display.newImage("image/메인/exit.png")
   			guideExit.x = guideBg.x + 260
   			guideExit.y = guideBg.y - 170

   			function exitGuide(event)
   				display.remove(guideBg)
   				display.remove(guideText)
   				display.remove(guideExit)
   			end

			   guideExit:addEventListener("tap", exitGuide)
         end
         --elseif event.target.name == "bag" then
           -- --transition.to(buttonUI[4], {time = 500, alpha = 0})
            --local t5 = timer.performWithDelay(1000, gotoBag, 1)
         --end
    end

	
	local minigame = display.newImageRect("image/메인/minigame_logo.png", 120, 100)
	minigame.x = 1150
	minigame.y = 60
	sceneGroup:insert(minigame)


	buttonUI[1] = widget.newButton(
		{ defaultFile = "image/메인/picture.png", overFile = "image/메인/picture.png",
		width = 150 , height = 150, onPress = inputEvent })
	buttonUI[1].x = 1155
	buttonUI[1].y = 150
	buttonUI[1].name = "picture"
	sceneGroup:insert(buttonUI[1])

	buttonUI[2] = widget.newButton(
		{ defaultFile = "image/메인/balloon.png", overFile = "image/메인/balloon.png",
		width = 150 , height = 180, onPress = inputEvent })
	buttonUI[2].x = 1160
	buttonUI[2].y = 270
	buttonUI[2].name = "balloon"
	sceneGroup:insert(buttonUI[2])

	buttonUI[3] = widget.newButton(
		{ defaultFile = "image/메인/report.png", overFile = "image/메인/report.png",
		width = 100 , height = 100 , onPress = inputEvent})
	buttonUI[3].x = 1168
	buttonUI[3].y = 355
	buttonUI[3].name = "report"
	sceneGroup:insert(buttonUI[3])

   function tapListener( event )
      local clicksoundEffect = audio.loadSound( "bgm/Door Open.mp3" )
      local CilckMusicChannel = audio.play( clicksoundEffect, {loops=0} )
      audio.setVolume( 5 )
   end

   local store = display.newImageRect("image/메인/store.png", 300, 310)
   store.x = 180
   store.y = 450
	--buttonUI[4] = widget.newButton(
		--{	defaultFile = "image/메인/store.png", overFile = "image/메인/store.png",
		--	width = 300, height = 310, onPress = inputEvent})
	--buttonUI[4].x = 180
	--buttonUI[4].y = 450
	--buttonUI[4].name = "store"
	sceneGroup:insert(store)

   store:addEventListener("tap", tapListener)
   store:addEventListener("tap", gotoStore)

	buttonUI[5] = widget.newButton(
		{	defaultFile = "image/메인/question3.png", overFile = "image/메인/question3.png",
			 onPress = inputEvent})
	buttonUI[5].x = 30
	buttonUI[5].y = 40
	buttonUI[5].name = "question"
   sceneGroup:insert(buttonUI[5])
	
   
   function tapListener2( event )
      local bagclickSound = audio.loadSound( "bgm/bag_click.mp3" )
      local bagCilckChannel = audio.play( bagclickSound, {loops=0} )
      audio.setVolume( 5 )
   end

   local bag = display.newImageRect("image/메인/bag.png", 110, 110)
   bag.x = 380
   bag.y = 500
   sceneGroup:insert(bag)
   bag:addEventListener("tap", tapListener2)
   bag:addEventListener("tap", gotoBag)

   --buttonUI[6] = widget.newButton( 
     -- { defaultFile = "image/메인/bag.png", overFile = "image/메인/bag.png",
      --width = 110, height = 110, onPress = inputEvent})
   --buttonUI[6].x = 380
   --buttonUI[6].y = 500
   --buttonUI[6].name = "bag"
   --sceneGroup:insert(buttonUI[6])
   	
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
		composer.removeScene("메인화면")
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