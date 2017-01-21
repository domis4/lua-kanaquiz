dofile("app0:/input/InputModule.lua")

HUDDrawController = {}

local crossImage = Graphics.loadImage("app0:/assets/sprites/cross0.png")
local dpadImage = Graphics.loadImage("app0:/assets/sprites/dpad0.png")
local selectImage = Graphics.loadImage("app0:/assets/sprites/select0.png")
local BLACK = Color.new(0, 0, 0)

HUDDrawController = {}

function HUDDrawController.pipeline()
    Graphics.drawImage(816, 64, crossImage)
    Graphics.drawImage(816, 108, dpadImage)
    Graphics.drawImage(816, 152, selectImage)
    Graphics.debugPrint(816, 32, "- MENU -", BLACK)
    Graphics.debugPrint(856, 64, "Click", BLACK)
    Graphics.debugPrint(856, 108, "Move", BLACK)
    Graphics.debugPrint(856, 152, "FPS Limit", BLACK)
end
