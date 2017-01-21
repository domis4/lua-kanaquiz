SettingsRoomModule = {}

local BLACK = Color.new(0, 0, 0)
local bg = Graphics.loadImage("app0:/assets/textures/bg.png")
local inputTimer = Timer.new()

function SettingsRoomModule.drawPipeline()
    Graphics.debugPrint(32, 32, "Go Back", BLACK)
    Graphics.debugPrint(300, 300, "SettingsRoomModule あ", BLACK)
end

function SettingsRoomModule.drawBackground()
    Graphics.drawImage(0, 0, bg)
end

function SettingsRoomModule.cursorHandler(x, y)
    if Controls.check(Controls.read(), SCE_CTRL_CROSS) and Timer.getTime(inputTimer) >= 500 then
        if x >= 32 and y >= 32 and x < 118 and y < 67 then
            RoomModule.setActiveRoom(1)
        end
        Timer.reset(inputTimer)
    end
end
