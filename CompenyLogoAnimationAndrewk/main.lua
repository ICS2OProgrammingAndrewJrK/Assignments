-- Title:Compeny Logo Animation
-- Name: Andrew Jr
-- Course: ICS2O/3C
-- This program...

----------------------------------------------------------------------------------------
--SOUNDS 
-----------------------------------------------------------------------------------------

local goinghigherSound = audio.loadSound("Sound/goinghigher.mp3")--Setting a variable to an mp3 file
local goinghigherChannel 
local goinghigherSoundChannel = audio.play(goinghigherSound)

-- hide the status dar 
display.setStatusBar(display.HiddenStatusBar)

-- glodal varibles
scrollSpeed = 5

-- sets  the background colour
display.setDefault("background",70/255,54/255,90/255) 

-- character image with width and height 
local AndrewLogo = display.newImageRect("Image/AndrewLogo.png", 800, 800)

-- character image with width and height 
local pizza = display.newImageRect("Image/pizza.png", 320, 320)
pizza.x = 500
pizza.y = 600

--set the image to be transparent
AndrewLogo.alpha = 0
AndrewLogo.alpha = 1

--set the initial x and y position of AndrewLogo
AndrewLogo.x = 0
AndrewLogo.y = display.contentHeight/3

--set the initial x and y position of AndrewLogo
AndrewLogo.x = 0
AndrewLogo.y = 400

-- Function: AndrewLogo
-- Input this function accepts an event listener
-- Output: none
-- Description:This function adds the scroll speed to the x-value of the ship
local function MoveAndrewLogo(event) 
    -- add the scroll speed to the x-value of the ship
    AndrewLogo.x = AndrewLogo.x + scrollSpeed  
    AndrewLogo.alpha = AndrewLogo.alpha - 0.0003
  
    -- change the transparency of the ship every time it moves so that it fades out
   
end
local function Movepizza(event) 
    -- add the scroll speed to the x-value of the ship
    pizza.x = pizza.x + scrollSpeed  
    pizza.alpha = pizza.alpha - 0.0003
  
    -- change the transparency of the ship every time it moves so that it fades out
   
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveAndrewLogo)  

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", Movepizza) 
