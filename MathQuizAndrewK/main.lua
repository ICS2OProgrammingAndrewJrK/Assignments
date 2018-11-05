-- Title: Math Quiz
-- Name: Anderw Jr
-- Course: ICS2O/3C
-- This program...

--hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour 
display.setDefault("background", 40/255, 10/255, 10/255)


-------------------------------------------------------------------------------------
--Local variables
-------------------------------------------------------------------------------------

--create local variables 
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local incorrectAnswer
local correctAnswer
local randomOperator
local pointsTextObject
local numberOfPoints = 0

--varible for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText 
local countDownTimer
local numberPoint = 0
local gameover

local lives = 3
local heart1
local heart2
local heart3
local winner


--*** ADD LOCAL VARIABLE FOR: INCORRECT OBJECT, POINTS OBJECT, POINTS

------------------------------------------------------------------------------------
-- SOUND
------------------------------------------------------------------------------------

--Setting a variable to an mp3 file
local heySoundSound = audio.loadSound("Sounds/hey.mp3")
local heySoundSoundChannel

local pipSoundSoundSound = audio.loadSound("Sounds/pip.mp3")

local creepySoundSoundSound = audio.loadSound("Sounds/creepy.mp3")
local creepySoundChannel = audio.play(creepySound)

------------------------------------------------------------------------------------
-- local functions 
------------------------------------------------------------------------------------

local function UpdateHeart()
    if(lives == 3) then
      	heart1.isVisible = true
      	heart2.isVisible = true
      	heart3.isVisible = true
  
    elseif (lives == 2) then
      	heart1.isVisible = true
      	heart2.isVisible = true
      	heart3.isVisible = false

    elseif (lives == 1) then
      	heart1.isVisible = true
     	heart2.isVisible = false
      	heart3.isVisible = false

    elseif (lives == 0) then
    	heart1.isVisible = false
      	heart2.isVisible = false
      	heart3.isVisible = false
      	gameover.isVisible = true
      	emoji.isVisible = true
      	numericField.isVisible = false
      	pointsTextObject.isVisible = false
      	questionObject.isVisible = false
      	creepySound.cancel = true
    end
end


local function UpdateTime()

	--decrement the numder of secounds
	secondsLeft = secondsLeft - 1

	--display the numder of seconds left in the clock odject 
	clockText.text = secondsLeft .. ""
    
    if (secondsLeft == 0 ) then
    	-- reset the numder of seconds left
    	secondsLeft = totalSeconds
    	lives = lives - 1
    	UpdateHeart()

    	-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUNDS, SHOW AYOU LOSE IMAGE
    	-- AND CANCEL THE TIMER REMOVER THE THIRD HEART BY MAKING IT INVISIBLE
    	if (lives == 2) then
    		heart2.invisible = false
    	elseif (lives == 1) then
    		heart1.isVisible = false
    	end

    	-- *** CALL THE FUNCTION TO ASK A NEW QUESTION
    
    end
end


-- function that calls the timer
local function Starttimer()
   -- creat a countdown timer that loops infinitely
   countDownTimer  = timer.performWithDelay( 1000, UpdateTime, 0)
   creepySoundSoundSoundChannel = audio.play(creepySoundSoundSound)
end  



local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,5)
	randomNumber1 = math.random(1,20)
	randomNumber2 = math.random(1,20)
	randomNumber3 = math.random(1,10)
 	randomNumber4 = math.random(1,100)
 	randomNumber5 = math.random(1,100)
 	randomNumber6 = math.random(1,10)

 	if (randomOperator == 1) then
 		correctAnswer = randomNumber1 + randomNumber2
	
		--create questionin text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
	 	correctAnswer = randomNumber1 - randomNumber2

		--create questionin text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	if ( randomNumber1 < randomNumber2) then
		questionObject.text = randomNumber2 .. " - " .. randomNumber2 .. " = "
		correctAnswer = randomNumber2 - randomNumber1
	else
		--create questionin text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		correctAnswer = randomNumber1 - randomNumber2
	end

	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber1 * randomNumber2

		--create questionin text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	elseif (randomOperator == 4) then
		correctAnswer = randomNumber4 * randomNumber5
	 	temp = randomNumber4
	 	randomNumber4 = correctAnswer
	 	correctAnswer = temp

		--create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "	

	elseif (randomOperator == 5) then
		randomNumber6 = math.random(1,10)
		temp = randomNumber6 * randomNumber6
		correctAnswer = math.sqrt(temp)
		questionObject.text = temp.."sqrt"
	end	
end


local function Updatepoints()
	if ( numberOfPoints == 5 ) then
		clockText.isvisible = true
		timer.cancel(countDownTimer)
		winner.isvisible = true 
		creepySound = false	
	end
end



local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end
local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function NumericFieldListener( event )

	--User beging editing "numericfeild"
	if ( event.phase == "began" ) then

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true 
			incorrectObject.isVisible = false
			heySoundSoundChannel = audio.play(heySoundSound)
			timer.performWithDelay(2000,HideCorrect)
			numberOfPoints = numberOfPoints + 1
			event.target.text = ""
			secondsLeft = totalSeconds 	
			Updatepoints()		
			-- create increasing points in the text object
            pointsTextObject.text = "Points = ".. numberOfPoints
		else 
			correctObject.isVisible = false 
			incorrectObject.isVisible = true
			secondsLeft = totalSeconds 
			incorrectObject.text = "The correct answer is " .. correctAnswer
			pipSoundSoundSoundChannel = audio.play(pipSoundSoundSound)
			timer.performWithDelay(2000,HideCorrect)
			lives = lives -1
			UpdateHeart()			
		end
	    --clear text field 
	    event.target.text = ""
	end
end

----------------------------------------------------------------------------------------------------------------------------
--object Creation 
----------------------------------------------------------------------------------------------------------------------------


-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(200/255, 255/255, 180/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("correct, Well done!", display.contentWidth/2, display.contentHeight*2/3, nil, 90)
correctObject:setTextColor(100/255, 200/255, 180/255)
correctObject.isVisible = false

-- create numeric field 
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 97, 100)
numericField.inputType = "default"
numericField.xScale = 2
numericField.yScale = 1

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(150/255, 205/255, 18/255)
incorrectObject.isVisible = false

--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)


-- create the liver to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7
 
heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


--display the timer on the screen
clockText = display.newText("", 520, 680, nil, 190)
clockText:setFillColor( 40/255, 220/255, 160/255 )

--create and display game over on the screen
gameover = display.newImageRect("Images/gameover.png", display.contentWidth, display.contentHeight)
gameover.anchorX = 0
gameover.anchorY = 0
gameover.isVisible = false


--create and display winner on the screen
winner = display.newImageRect("Images/winner.png", display.contentWidth, display.contentHeight)
winner.anchorX = 0
winner.anchorY = 0
winner.isVisible = false

--create and display emoji on the screen
emoji = display.newImageRect("Images/emoji.png", display.contentWidth, display.contentHeight)
emoji.xScale = 0.2
emoji.yScale = 0.2
emoji.isVisible = false
emoji.x = 800
emoji.y = 600

-- create points box and make it visible
pointsTextObject = display.newText( "Points = ".. numberOfPoints, 800, 385, nil, 50 )
pointsTextObject:setTextColor(240/255, 190/255, 25/255)


-----------------------------------------------------------------------------------------------------------------------------
-- function calls
-----------------------------------------------------------------------------------------------------------------------------

-- call the function to as the Question
AskQuestion()
Starttimer()
Updatepoints()
