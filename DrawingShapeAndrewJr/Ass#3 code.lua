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
myTriangle.fill = { 66/255, 244/255, 179/255 }
myTriangle.strokeWidth = 40
myTriangle:setStrokeColor( 200/255, 200/255, 220/255 )


-- anchor a triangle in the top left corner of the screen
myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.x = 100
myTriangle.y = 370
textSize = 50
--write the name of the shape on the screen. Take into consideration the size of the text font when positioning it on the screen.
texObject = display.newText("Triangle", 200, 700, Arial, textSize)

--sets the color of the text
texObject:setTextColor(16/255, 10/255, 25/255)

--draw my hexagon that is half the width and half the height of the screen
myHexagon = display.newPolygon( 808, 501, myHexagonVertices )
myHexagon.fill = { 49/255, 78/255, 222/255 }
myHexagon:setStrokeColor( 200/255, 200/255, 72/255 )

--write the name of the shape on the screen. Take into consideration the size of the text font when positioning it on the screen.
texObject = display.newText("Hexagon", 790, 700, Arial, textSize)

--draw my rounded rectangle and set its (x,y) position
myRoundedRect = display.newRoundedRect( 800, 150, 350, 130, 30 )
myRoundedRect.strokeWidth = 10
myRoundedRect:setFillColor( 180/255, 21/255, 22/255 )
myRoundedRect:setStrokeColor( 23/255, 200/255, 25/255 )
 
--write the name of the shape on the screen. Take into consideration the size of the text font when positioning it on the screen.
texObject = display.newText("Rounded Rectangle", 770, 270, Arial, textSize)

--sets the color of the text
texObject:setTextColor(85/255, 50/255, 119/255)
