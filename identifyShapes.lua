local storyboard = require("storyboard")
local widget = require("widget")
local scene = storyboard.newScene()
local external = require("external")

function scene:willEnterScene( event )
    local group = self.view
    storyboard.removeAll()
end

function scene:createScene( event )
    local screenGroup = self.view

    local W = display.contentWidth
    local H = display.contentHeight
    
    local moveOption1, moveOption2

    local shape, option1, option2, createShape, restartButton, menuButton
    local endGame = false
    local diamondDone = false
    local circleDone = false
    local squareDone = false
    local starDone = false
    local rectangleDone = false
    local ovalDone = false
    local triangleDone = false
    local option1Correct = false
    local option2Correct = false
    local randomBlackShapes, rBlack, createOptions, rand2
    local questionNumber = 1
    local scoreNum = 0
    

    local bg = display.newImageRect("images/bg5.png", W, H)
    bg.x = W * 0.5
    bg.y = H * 0.5
    screenGroup:insert(bg)
    
    local title = display.newText("Identify the shape", 0, 0, "Chinacat", 40)
    title.x = W * 0.2725
    title.y = H * 0.2
    title:setFillColor(0,0,0)
    screenGroup:insert(title)
    
    local score = display.newText("Score: "..scoreNum, 0, 0, "Chinacat", 30)
    score.x = display.contentWidth * 0.73
    score.y = display.contentHeight * 0.2
    score:setFillColor(0,0,0)
    screenGroup:insert(score)
    
    local questionNumText = display.newText("Question # "..questionNumber, 0, 0, "Chinacat", 30)
    questionNumText.x = display.contentWidth * 0.725
    questionNumText.y = display.contentHeight * 0.11
    questionNumText:setFillColor(0,0,0)
    screenGroup:insert(questionNumText)
    
    local function randomBlackNum()
        rBlack = math.random(1,7)
        randomBlackShapes()
    end

    function randomBlackShapes()
        if diamondDone == true and circleDone == true and squareDone == true and starDone == true and rectangleDone == true and ovalDone == true and triangleDone == true then
            questionNumText.alpha = 0
            score.size = 50
            transition.to(score, {x = title.x, y = H * 0.4, time = 500})
            transition.to(restartButton, {x = title.x, y = H * 0.75, time = 500})
            transition.to(menuButton, {x = title.x, y = H * 0.6, time = 500})
            title.text = "Yehey!!"
            endGame = true
        else
            if rBlack == 1 then
                if diamondDone == false then
                    diamondDone = true
                    shape = display.newImage("images/shapeGame/diamondBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 2 then
                if circleDone == false then
                    circleDone = true
                    shape = display.newImage("images/shapeGame/circleBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 3 then
                if squareDone == false then
                    squareDone = true
                    shape = display.newImage("images/shapeGame/squareBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 4 then
                if starDone == false then
                    starDone = true
                    shape = display.newImage("images/shapeGame/starBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 5 then
                if rectangleDone == false then
                    rectangleDone = true
                    shape = display.newImage("images/shapeGame/rectangleBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 6 then
                if ovalDone == false then
                    ovalDone = true
                    shape = display.newImage("images/shapeGame/ovalBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            elseif rBlack == 7 then
                if triangleDone == false then
                    triangleDone = true
                    shape = display.newImage("images/shapeGame/triangleBlack.png")
                    shape.x = W * 0.27
                    shape.y = H * 0.55
                    screenGroup:insert(shape)
                else
                    randomBlackNum()
                end
            end
        end
    end
    
    local function answerShape(r)
        if r == 1 then
            --external.correctionEffects("correct")
            return "images/shapeGame/diamond.png"
        elseif r == 2 then
           --external.correctionEffects("correct")
            return "images/shapeGame/circle.png"
        elseif r == 3 then
            --external.correctionEffects("correct")
            return "images/shapeGame/square.png"
        elseif r == 4 then
           --external.correctionEffects("correct")
            return "images/shapeGame/star.png"
        elseif r == 5 then
            --external.correctionEffects("correct")
            return "images/shapeGame/rectangle.png"
        elseif r == 6 then
            --external.correctionEffects("correct")
            return "images/shapeGame/oval.png"
        elseif r == 7 then
            --external.correctionEffects("correct")
            return "images/shapeGame/triangle.png"
        end
    end
    
    local function randomShapes()
        rand2 = math.random(1,7)
        if rand2 == 1 then
            return "images/shapeGame/diamond.png"
        elseif rand2 == 2 then
            return "images/shapeGame/circle.png"
        elseif rand2 == 3 then
            return "images/shapeGame/square.png"
        elseif rand2 == 4 then
            return "images/shapeGame/star.png"
        elseif rand2 == 5 then
            return "images/shapeGame/rectangle.png"
        elseif rand2 == 6 then
            return "images/shapeGame/oval.png"
        elseif rand2 == 7 then
            return "images/shapeGame/triangle.png"
        end
    end
    
    function createOptions()
        local randOption = math.random(1,2)

        if randOption == 1 then
            option1Correct = true
            option1 = display.newImage(answerShape(rBlack))
            if rand2 == rBlack then
                option2 = display.newImage(randomShapes())  
            else
                option2 = display.newImage(randomShapes())
            end
        else
            option2Correct = true
            option2 = display.newImage(answerShape(rBlack))          
            if rand2 == rBlack then
                option1 = display.newImage(randomShapes())  
            else
                option1 = display.newImage(randomShapes())
            end
        end

        option1.x = W * 0.625
        option1.y = H * 0.475
        option1:scale(0.7,0.7)

        option2.x = W * 0.875
        option2.y = H * 0.475
        option2:scale(0.7,0.7)
        
        screenGroup:insert(option1)
        screenGroup:insert(option2)
        
        option1:addEventListener("touch", moveOption1)
        option2:addEventListener("touch", moveOption2)
    end

    function createShape()
        
        option1Correct = false
        option2Correct = false
        if shape ~= nil then
            shape:removeSelf()
        end

        if option1 ~= nil then
            option1:removeSelf()
        end

        if option2 ~= nil then
            option2:removeSelf()
        end

        randomBlackNum()
        
        if endGame == false then
            createOptions()
        end
    end
    
    local isOption1 = false
    local isOption2 = false
    
    moveOption1 = function(event)
        if isOption2 == false then
            isOption1 = true
            if event.phase == "ended" then
                if (option1.x <= shape.x + 100 and option1.x >= shape.x - 100) and (option1.y <= shape.y + 100 and option1.y >= shape.y - 100) then
                    if option1Correct == true then
                        option1Correct = false
                        isOption1 = false
                        scoreNum = scoreNum + 1
                        score.text = "Score: "..scoreNum
                        questionNumber = questionNumber + 1
                        questionNumText.text = "Question # "..questionNumber
                        createShape()
                    else
                        isOption1 = false
                        transition.to(option1, {x = W * 0.625, y = H * 0.475, xScale = 0.7, yScale = 0.7, transition=easing.inOutExpo, time = 500})
                    end
                else
                    isOption1 = false
                    transition.to(option1, {x = W * 0.625, y = H * 0.475, xScale = 0.7, yScale = 0.7, transition=easing.inOutExpo, time = 500})  
                end
            else
                if event.x <= 900 and event.x >= 60 and event.y <= 560 and event.y >= 60 then
                    option1.xScale = 1; option1.yScale = 1
                    option1.x = event.x
                    option1.y = event.y
                end
            end
        end
    end
    
    moveOption2 = function(event)
        if isOption1 == false then
            isOption2 = true
            if event.phase == "ended" then
                if (option2.x <= shape.x + 100 and option2.x >= shape.x - 100) and (option2.y <= shape.y + 100 and option2.y >= shape.y - 100) then
                    if option2Correct == true then
                        option2Correct = false
                        isOption2 = false
                        scoreNum = scoreNum + 1
                        score.text = "Score: "..scoreNum
                        questionNumber = questionNumber + 1
                        questionNumText.text = "Question # "..questionNumber
                        createShape()
                    else
                       isOption2 = false
                       transition.to(option2, {x = W * 0.875, y = H * 0.475, xScale = 0.7, yScale = 0.7, transition=easing.inOutExpo, time = 500})  
                    end
                else
                    isOption2 = false
                    transition.to(option2, {x = W * 0.875, y = H * 0.475, xScale = 0.7, yScale = 0.7, transition=easing.inOutExpo, time = 500})
                end 
            else
                if event.x <= 900 and event.x >= 60 and event.y <= 560 and event.y >= 60 then
                    option2.xScale = 1; option2.yScale = 1
                    option2.x = event.x
                    option2.y = event.y
                end
            end
        end
    end
    
    createShape()
    
    restartButton = widget.newButton{
        defaultFile = "images/buttons/restart.png",
        overFile = "images/buttons/restartOver.png",
        onRelease = function()
            storyboard.gotoScene("refresh_identifyShapes", "fade", 200)
        end,
    }
    restartButton.x = W * 0.625
    restartButton.y = H * 0.85
    restartButton:scale(1.5,1.75)
    screenGroup:insert(restartButton)
        
    menuButton = widget.newButton{
        defaultFile = "images/buttons/menu.png",
        overFile = "images/buttons/menuOver.png",
        onRelease = function()
            storyboard.gotoScene("anotherMenu", "fade", 400)
        end,
    }
    menuButton.x = W * 0.875
    menuButton.y = H * 0.85
    menuButton:scale(1.5,1.75)
    screenGroup:insert(menuButton)
end

function scene:exitScene( event )
    external.setPreviousScene("identifyShapes")
end

scene:addEventListener( "exitScene", scene )
scene:addEventListener( "createScene", scene )
scene:addEventListener( "willEnterScene", scene )

return scene

