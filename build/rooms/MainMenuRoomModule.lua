MainMenuRoomModule = {}

local BLACK = Color.new(0, 0, 0)
local bg = Graphics.loadImage("app0:/assets/textures/bg.png")
local inputTimer = Timer.new()

function MainMenuRoomModule.drawPipeline()
    Graphics.debugPrint(250, 200, "Hiragana Quiz / ひらがな クイズ", BLACK)
    Graphics.debugPrint(250, 235, "Katakana Quiz / カタカナ クイズ", BLACK)
    Graphics.debugPrint(250, 270, "Settings / セッティング", BLACK)
end

function MainMenuRoomModule.drawBackground()
    Graphics.drawImage(0, 0, bg)
end

function MainMenuRoomModule.cursorHandler(x, y)
    if Controls.check(Controls.read(), SCE_CTRL_CROSS) and Timer.getTime(inputTimer) >= 500 then
        if x >= 250 and y >= 200 and x < 540 and y < 235 then
            RoomModule.setActiveRoom(2)
        end
        if x >= 250 and y >= 235 and x < 540 and y < 270 then
            RoomModule.setActiveRoom(2)
        end
        if x >= 250 and y >= 270 and x < 540 and y < 305 then
            RoomModule.setActiveRoom(3)
        end
        Timer.reset(inputTimer)
    end
end