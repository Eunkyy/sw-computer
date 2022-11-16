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

	
	local sheet1 = graphics.newImageSheet("모션/ad3.png", option1)
	local sheet2 = graphics.newImageSheet("모션/bb2.png", option2)
	local sheet3 = graphics.newImageSheet("모션/tn3.png", option3)
	local sheet4 = graphics.newImageSheet("모션/kd3.png", option4)
	
	local sq1 = {
		-- consecutive frames sequence
		{
			name="total",
			start = 1,
			count = 4,
			time = 2000,
			loopCount = 0,
			loopDirection = "forward"
		} ,

		{
			name="ad-eat",
			frames= {4, 1},
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
			name="md-eat",
			frames= {4, 1},
			time = 1500,
			loopCount = 3,
		},
		{
			name="md-click",
			frames= {3, 1},
			time = 1000,
			loopCount = 3,
		},

		{
			name="kd-eat",
			frames= {4, 1},
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
			name="total",
			start = 1,
			count = 5,
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
	ad:setSequence("ad-eat")
	ad:play()
	ad.x = display.contentCenterX + 300
	ad.y = display.contentCenterY - 50
	
	local bb = display.newSprite(sheet2, sq2)
	bb:setSequence("bb-eat")
	bb:play()
	bb.x = display.contentCenterX - 450
	bb.y = display.contentCenterY + 150

	local md = display.newSprite(sheet3, sq1)
	md:setSequence("md-eat")
	md:play()
	md.x = display.contentCenterX 
	md.y = display.contentCenterY - 60

	local kd = display.newSprite(sheet4, sq1)
	kd:setSequence("kd-eat")
	kd:play()
	kd.x = display.contentCenterX - 240
	kd.y = display.contentCenterY + 35

	
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
