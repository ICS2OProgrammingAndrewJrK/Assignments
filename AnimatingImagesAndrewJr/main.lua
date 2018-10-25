-- Title: AnimatingImages
-- Name: andrew Jr
-- Course: ICS2O/3C
-- This program..

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables. I am trying to get the x value to be set properly
local backgroundImage = display.newImageRect("Images/sad.jpg", 2048, 1536)

--character images with width and height
local Person = display.newImageRect("Images/Person.png", 200, 400)

--character images with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

--character images with width and height
local fortniteDark = display.newImageRect("Images/fortniteDark.png", 300, 400)

--global variables
local scrollSpeedPerson = 4
local scrollSpeedfortniteDark = 4
local scrollSpeedrocketship = 3

--set the images to be transparent
Person.alpha = 1
fortniteDark.alpha = 1
rocketship.alpha = 1

--set the initial x and y position of Person 
Person.x = 0
Person.y = 200

--set the initial x and y position of Person 
fortniteDark.x = 700
fortniteDark.y = 500


--set the initial x and y position of Person 
rocketship.x = 200
rocketship.y = 0

--Function: MovePerson
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the Person
local function MovePerson(event)
	--add the scroll speed to the x-value of the Person
	Person.x = Person.x + scrollSpeedPerson

	--change the transparency of the Person every time it so fast that it fades out
	Person.alpha = Person.alpha - 0.003
end
Runtime:addEventListener("enterFrame", MovePerson)


--Function: MovefortniteDark
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the fortniteDark
local function MovefortniteDark(event)
	--add the scroll speed to the x-value of the fortniteDark
	fortniteDark.x = fortniteDark.x - scrollSpeedfortniteDark
	--change the transparency of the fortniteDark every time it so fast that it fades out
	fortniteDark.alpha = fortniteDark.alpha + 0.00001
end

--MovefortniteDark will be called over and over again
Runtime:addEventListener("enterFrame", MovefortniteDark)



--Function: Moverocket
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the girl
local function Moverocketship(event)
	--add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x + scrollSpeedrocketship
	rocketship.y = rocketship.y + scrollSpeedrocketship
    
	--change the transparency of the srocket every time it so fast that it fades out
	rocketship.alpha = rocketship.alpha + 0.0001
end

--Moverocketship will be called over and over again
Runtime:addEventListener("enterFrame", Moverocketship)

--create a local variable
local textObjectSignature
textObjectSignature = display.newText( "By:Andrew Jr", 700, 700, nil, 40 )
textObjectSignature:setTextColor(100/255, 100/255, 10/255)