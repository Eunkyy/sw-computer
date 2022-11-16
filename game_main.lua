-----------------------------------------------------------------------------------------
--
-- beforeGame.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

math.randomseed(os.time())

local widget=require("widget")
 -- Set up display groups
   
function scene:create( event )
    local sceneGroup = self.view
    local soundEffect = audio.loadSound( "bgm/report_bg.mp3" )
    local backgroundMusicChannel = audio.play( soundEffect, {loops=-1} )
    audio.setVolume( 1 )
-- Seed the random number generator
    math.randomseed( os.time() )

    local backGroup = display.newGroup()  
    local mainGroup = display.newGroup()  
    local uiGroup = display.newGroup()    

    local a1 = "image/A+.png"
    local a2 = "image/A.png"
    local b1 = "image/B+.png"
    local c = "image/C.png"
    local f = "image/F.png"
    local gGrades = {"image/A+.png", "image/A.png"}-- Initialize variables
    local aGrades = {"image/B+.png", "image/B.png"}
    local bGrades = {"image/c.png", "image/f.png"}
    local goodGrade = {}
    local averGrade = {}
    local badGrade = {}
    local livesText
    local gameLoopTimer
    local remainLives

    local physics = require( "physics" )
    physics.start()
    physics.setGravity( 0, 7)

    local background = display.newImageRect(backGroup,"image/bg3.jpg", display.contentWidth, display.contentHeight)
    background.x, background.y = display.contentWidth/2, display.contentHeight/2

    local player=display.newImageRect("image/som1.png",170, 250)
    player.x,player.y= display.contentWidth/2, 550
    physics.addBody( player, "static", { radius = 40, isSensor=true } )
    player.myName = "player"

    local ground = display.newImageRect("image/ground2.png", display.contentWidth, 100)
    ground.x, ground.y = display.contentWidth/2, 650

    local k = 1
    local score = 500
    local scoreText = display.newText( "Score=" .. score, 150, 50, "font/NanumJangMiCe.ttf", 70 )
    scoreText:setFillColor(0.2)

     print(score.."-score 점수")

    local function getGood()
      local i = math.random(2)
       local grade1 = gGrades[i]
       local good = display.newImageRect(mainGroup, grade1, 70, 70)
       table.insert( goodGrade, good )

       physics.addBody( good, "dynamic", { radius=15, bounce=0 } )
       good.myName = "good"
 
        good.x = math.random( display.contentWidth -100 ) + 50
        good.y = -30
    end

    local function getAver()
      local i = math.random(2)
       local grade1 = aGrades[i]
       local aver = display.newImageRect(mainGroup, grade1, 70, 70)
       table.insert( averGrade, aver )

       physics.addBody( aver, "dynamic", { radius=15, bounce=0 } )
       aver.myName = "aver"
 
        aver.x = math.random( display.contentWidth -100 ) + 50
        aver.y = -30
    end

    local function getBad()
      local i = math.random(2)
       local grade1 = bGrades[i]
       local bad = display.newImageRect(mainGroup, grade1, 70, 70)
       table.insert( badGrade, bad )
       physics.addBody( bad, "dynamic", { radius=15, bounce=0 } )
       bad.myName = "bad"
 
        bad.x = math.random( display.contentWidth -100 ) + 50
        bad.y = -30
    end

    local i = 0
    local function gameLoop()
      i = math.random(4)
      if i == 1 then
         getBad()
      elseif i == 2 then
        getGood()
      else 
        getAver()
      end
    end

    gameLoopTimer = timer.performWithDelay( 700, gameLoop, 0 )

    --gameLoop()

    local option = {
    effect="crossFade",
    time = 2000
  }

    local function endGame(event)
        for i = #goodGrade,1,-1 do
             sceneGroup:insert(goodGrade[i])
             table.remove(goodGrade, i)
        end
        for i = #badGrade,1,-1 do
             sceneGroup:insert(badGrade[i])
             table.remove(badGrade, i)
        end

        composer.setVariable("score", score)
        audio.pause( backgroundMusicChannel )
        composer.removeScene("game_main")
        composer.gotoScene("result", option)

    end

    local function onCollision(event )
    if ( event.phase == "began" ) then
 
        local obj1 = event.object1
        local obj2 = event.object2
        if ( ( obj1.myName == "good" and obj2.myName == "player") or ( obj1.myName == "player" and obj2.myName == "good") or ( obj1.myName == "player" and obj2.myName == "bad" ) or 
                 ( obj1.myName == "bad" and obj2.myName == "player" ) or ( obj1.myName == "aver" and obj2.myName == "player" ) or ( obj1.myName == "player" and obj2.myName == "aver") ) 
        then  
                local name
                if obj1.myName =="good" or obj1.myName =="bad" or obj1.myName =="aver" then
                   obj1.alpha = 0
                   name = obj1.myName
                elseif obj2.myName =="good" or obj2.myName == "bad" or obj2.myName =="aver"then
                   obj2.alpha = 0
                   name = obj2.myName
                end
                if name == "good" then 
                    for i = #goodGrade, 1, -1 do
                    if ( goodGrade[i] == obj1 or goodGrade[i] == obj2 ) then
                        display.remove( goodGrade[i] )
                        goodGrade[i] = nil
                        table.remove( goodGrade, i )
                        print("player와 충돌해서 사라짐")
                        break
                    end
                    end
                    score = score + 60
                    scoreText.text = "Score: " .. score

                    print(score.."-score 점수 1")
                 elseif name == "aver" then
                    for i = #averGrade, 1, -1 do
                      if ( averGrade[i] == obj1 or averGrade[i] == obj2 ) then
                          display.remove( averGrade[i] )
                          averGrade[i] = nil
                          table.remove( averGrade, i )
                          print("aver/player와 충돌해서 사라짐")
                          break
                      end
                    end
                    score = score +30
                   scoreText.text = "Score: " .. score

                    print(score.."-score 점수 1")
                elseif name == "bad" then
                    for i = #badGrade, 1, -1 do
                      if ( badGrade[i] == obj1 or badGrade[i] == obj2 ) then
                          display.remove( badGrade[i] )
                          badGrade[i] = nil
                          table.remove( badGrade, i )
                          print("bad/player와 충돌해서 사라짐")
                          break
                      end
                    end
                    score = score - 100
                   scoreText.text = "Score: " .. score

                    print(score.."-score 점수 1")
                end
                 if ( score >= 1200 ) then
                        for i = #goodGrade,1,-1 do
                            table.remove(goodGrade, i)
                        end
                        for i = #badGrade,1,-1 do
                            table.remove(badGrade, i)
                        end
                        Runtime:removeEventListener( "collision", onCollision )
                        timer.pause( gameLoopTimer )
                        endGame()
                  elseif ( score <= 0 ) then
                        for i = #goodGrade,1,-1 do
                            table.remove(goodGrade, i)
                        end
                        for i = #badGrade,1,-1 do
                            table.remove(badGrade, i)
                        end
                        Runtime:removeEventListener( "collision", onCollision )
                        timer.pause( gameLoopTimer )
                        endGame()
                  end
              end
            end
    end
    Runtime:addEventListener( "collision", onCollision, 0)

  function inputEvent( event )
      if event.target.name=="T" then
                transition.to(player,{x=player.x-display.contentHeight/10})
      elseif event.target.name=="B" then
                transition.to(player,{x = player.x+display.contentHeight/10})
      end
    end

local buttonUI={}
-- 8) 버튼 이미지 삽입 및 함수연결
    buttonUI[1] = widget.newButton ({ defaultFile = "image/Left.png", overFile = "image/Left.png", width = 150, height = 150, onPress = inputEvent})
    buttonUI[1].x, buttonUI [1].y = display.contentWidth/2 +400, display.contentHeight - 150
    buttonUI[1].name = "T"

    buttonUI[2] = widget.newButton ({ defaultFile = "image/Right.png", overFile = "image/Right.png", width = 150, height = 150, onPress = inputEvent})
    buttonUI[2].x, buttonUI [2].y = display.contentWidth/2 + 550,  display.contentHeight- 150
    buttonUI[2].name = "B"

      sceneGroup:insert(backGroup)
      sceneGroup:insert(mainGroup)
      sceneGroup:insert(uiGroup)
      sceneGroup:insert(ground)
      sceneGroup:insert(player)
      sceneGroup:insert(scoreText)
      --sceneGroup:insert(remainLives)
       for i = #goodGrade,1,-1 do
             sceneGroup:insert(goodGrade[i])
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