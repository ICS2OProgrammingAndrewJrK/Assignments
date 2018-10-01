---- Title:Local Variables
-- Name:Ms Andrew Jr
-- Course:ICS20/3C
-- Date:2018-09-28
-----------------------------------------------------------------------------------------

-- set the bakground colour of my screen.Remember that colors are between 0 and 1.
display.setDefault("background", 200/255, 200/255, 112/255)

-- create my local variables 

local textSize = 50
local triangleX = display.contentWidth * 100
local triangleY = display.contentHeight * 150
local vertices = { 100,100, 10,400, 200,400, }
local myTriangle
local textObject
local myHexagonVertices = { 0,150, -130,100, -130,-100, 0,-150, 130,-100, 130,100 }
local myHexagon
local myRoundedRect

--set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault("background", 0.7, 0.3, 0.9)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw a triangle that is half the width and half the height of the screen
myTriangle = display.newPolygon( 100, 150, vertices )
myTriangle.fill = { 244/255, 78/255, 89/255 }
myTriangle:setStrokeColor( 200/255, 200/255, 220/255 )

-- anchor a triangle in the top left corner of the screen
myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.x = 100
myTriangle.y = 400
