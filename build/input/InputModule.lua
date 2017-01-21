dofile("app0:/common/FPSController.lua")
dofile("app0:/rooms/RoomModule.lua")

local cursorPosition = {}
local init = true
local inputTimer = Timer.new()
cursorPosition[1] = 0
cursorPosition[2] = 0

InputModule = {}
function InputModule.update()
    InputModule.updateCursorPosition()
    InputModule.updateGameInput()
    RoomModule.updateRooms(cursorPosition[1], cursorPosition[2])
    InputModule.updateFPSLimiter()
end

function InputModule.updateCursorPosition()
    if Controls.check(Controls.read(), SCE_CTRL_DOWN) then
        cursorPosition[2] = cursorPosition[2] + 5 * FPSController.getDelta()
    end
    if Controls.check(Controls.read(), SCE_CTRL_UP) then
        cursorPosition[2] = cursorPosition[2] - 5 * FPSController.getDelta()
    end
    if Controls.check(Controls.read(), SCE_CTRL_LEFT) then
        cursorPosition[1] = cursorPosition[1] - 5 * FPSController.getDelta()
    end
    if Controls.check(Controls.read(), SCE_CTRL_RIGHT) then
        cursorPosition[1] = cursorPosition[1] + 5 * FPSController.getDelta()
    end
end

function InputModule.updateFPSLimiter()
    if Controls.check(Controls.read(), SCE_CTRL_SELECT) and Timer.getTime(inputTimer) >= 500 then
        FPSController.switchFPSLimiter()
        Timer.reset(inputTimer)
    end
end

function InputModule.getCursorPosition()
    return cursorPosition
end

function InputModule.updateGameInput()
    if Controls.check(Controls.read(), SCE_CTRL_CIRCLE) and Timer.getTime(inputTimer) >= 500 then
        RoomModule.setActiveRoom(2)
        Timer.reset(inputTimer)
    end
    if Controls.check(Controls.read(), SCE_CTRL_TRIANGLE) and Timer.getTime(inputTimer) >= 500 then
        RoomModule.setActiveRoom(3)
        Timer.reset(inputTimer)
    end
end
