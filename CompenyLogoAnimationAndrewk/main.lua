-- Title:Compeny Logo Animation
-- Name: Andrew Jr
-- Course: ICS2O/3C
-- This program...

----------------------------------------------------------------------------------------
--SOUNDS 
-----------------------------------------------------------------------------------------

local jazzyfrenchySound = audio.loadSound("Sound/jazzyfrenchy.mp3")--Setting a variable to an mp3 file
local jazzyfrenchyChannel 
local jazzyfrenchySoundChannel = audio.play(jazzyfrenchySound)

-- hide the status dar 
display.setStatusBar(display.HiddenStatusBar)

-- glodal varibles
scrollSpeed = 5


-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 234/255, 170/255, 83/255)

-- character image with width and height 
local AndrewLogo = display.newImageRect("Image/AndrewLogo.png", 800, 800)


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

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveAndrewLogo)    
