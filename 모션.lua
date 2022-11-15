-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )

	local space = display.newRect( display.contentCenterX, display.contentCenterY, 1280, 720 )
	space.strokeWidth = 3
	space:setFillColor( 0.5 )
	space:setStrokeColor( 1, 0, 0 )

    local option1 =
	{ 
		
		width = 240,
		height = 380,
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
	local sheet2 = graphics.newImageSheet("image/모션/bb2.png", option2)
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
			frames= {5, 1},
			time = 1500,
			loopCount = 3,
		},
		{
			name="ad-click",
			frames= {3, 1},
			time = 1000,
			loopCount = 3,
		},

		{
			name="tn-eat",
			frames= {5, 1},
			time = 1500,
			loopCount = 3,
		},
		{
			name="tn-click",
			frames= {3, 1},
			time = 1000,
			loopCount = 3,
		},

		{
			name="kd-eat",
			frames= {5, 1},
			time = 1500,
			loopCount = 3,
		},
		{
			name="kd-click",
			frames= {3, 1},
			time = 1000,
			loopCount = 3,
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
			time = 1500,
			loopCount = 3,
		},
		{
			name="bb-click",
			frames= {2, 4},
			time = 1000,
			loopCount = 3,
		}
	}


	local ad = display.newSprite(sheet1, sq1)
	ad:setSequence("stay")
	ad:play()
	ad.x = display.contentCenterX + 300
	ad.y = display.contentCenterY - 50
	ad.name = "adult"

	local bb = display.newSprite(sheet2, sq2)
	bb:setSequence("stayt")
	bb:play()
	bb.x = display.contentCenterX - 450
	bb.y = display.contentCenterY + 150
	bb.name = "baby"
	
	local tn = display.newSprite(sheet3, sq1)
	tn:setSequence("stay")
	tn:play()
	tn.x = display.contentCenterX 
	tn.y = display.contentCenterY - 60
	tn.name = "teen"
	
	local kd = display.newSprite(sheet4, sq1)
	kd:setSequence("stay")
	kd:play()
	kd.x = display.contentCenterX - 240
	kd.y = display.contentCenterY + 35
	kd.name = "kid"
	
	function clickSom(event)
		if event.target.name == "adult" then
			ad:setSequence("ad-click")
			ad:play()
		elseif event.target.name == "teen" then
			tn:setSequence("tn-click")
			tn:play()
		elseif event.target.name == "kid" then
			kd:setSequence("kd-click")
			kd:play()
		elseif event.target.name == "baby" then
			bb:setSequence("bb-click")
			bb:play()
		end

	end
	ad:addEventListener("tap", clickSom)
	tn:addEventListener("tap", clickSom)
	kd:addEventListener("tap", clickSom)
	bb:addEventListener("tap", clickSom)


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
		composer.removeScene("view2")
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
