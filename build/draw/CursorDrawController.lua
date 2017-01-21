dofile("app0:/input/InputModule.lua")

local image = Graphics.loadImage("app0:/assets/sprites/cursor0.png")

CursorDrawController = {}

function CursorDrawController.pipeline()
    cursorPosition = InputModule.getCursorPosition()
    Graphics.drawImage(cursorPosition[1], cursorPosition[2], image)
end
