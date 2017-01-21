dofile("app0:/rooms/MainMenuRoomModule.lua")
dofile("app0:/rooms/GameRoomModule.lua")
dofile("app0:/rooms/SettingsRoomModule.lua")

RoomModule = {}
RoomModule.rooms = {
    MainMenuRoomModule,
    GameRoomModule,
    SettingsRoomModule
}

local activeRoom = 1
local init = true

function RoomModule.updateRooms(x, y)
    if init == true then
        activeRoom = 1
        init = false
    end
    RoomModule.rooms[activeRoom].cursorHandler(x, y)
end
function RoomModule.drawRoomPipelines(x, y)
    RoomModule.rooms[activeRoom].drawPipeline()
end

function RoomModule.setActiveRoom(index)
    activeRoom = index
end
function RoomModule.getActiveRoom()
    return activeRoom
end
function RoomModule.drawBackground()
    RoomModule.rooms[activeRoom].drawBackground()
end