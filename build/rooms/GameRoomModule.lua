dofile("app0:/kana-quiz/KanaQuizModule.lua")

GameRoomModule = {}

local BLACK = Color.new(0, 0, 0)
local WHITE = Color.new(255, 255, 255)
local bg = Graphics.loadImage("app0:/assets/textures/bg.png")
local quizicon = Graphics.loadImage("app0:/assets/sprites/quizbutton0.png")
local inputTimer = Timer.new()
local init = true
local activeButtons = {{-1,-1},{-1,-1}}
local solvedButtons = {}
local buttonSize = 64
local yoffset = 32
local xoffset = 0

function GameRoomModule.drawPipeline()
    Graphics.debugPrint(32, 32, "Go Back", BLACK)
    Graphics.debugPrint(300, 300, "GameRoomModule あ", BLACK)
    GameRoomModule.drawQuiz()
end

function GameRoomModule.drawBackground()
    Graphics.drawImage(0, 0, bg)
end
function GameRoomModule.cursorHandler(x, y)
    if Controls.check(Controls.read(), SCE_CTRL_CROSS) and Timer.getTime(inputTimer) >= 500 then
        if x >= 32 and y >= 32 and x < 118 and y < 67 then
            RoomModule.setActiveRoom(1)
        else
            GameRoomModule.activateBubble(x, y)
        end

        Timer.reset(inputTimer)
    end
end

function GameRoomModule.drawQuiz()
    if init == true then
        KanaQuizModule.generateGrid(KanaQuizModule.hiragana, KanaQuizModule.romaji)
        init = false
    end
    for i,v in pairs(KanaQuizModule.grid) do
        for j,w in pairs(KanaQuizModule.grid[i]) do
            Graphics.drawImage(xoffset + j * buttonSize, yoffset + i * buttonSize, quizicon)
            local found = 0
            if activeButtons[1][1] == j and activeButtons[1][2] == i or activeButtons[2][1] == j and activeButtons[2][2] == i then
                Graphics.debugPrint(xoffset + j * buttonSize + 20, yoffset + i * buttonSize + 20, KanaQuizModule.grid[i][j], WHITE)
            else
                Graphics.debugPrint(xoffset + j * buttonSize + 20, yoffset + i * buttonSize + 20, "?", WHITE)
            end
        end
    end
    for i,v in pairs(activeButtons) do
        Graphics.debugPrint(400, 300 + i * 25, activeButtons[i][1] .. " " .. activeButtons[i][2], BLACK)
    end
    Graphics.debugPrint(550, 300, #solvedButtons, BLACK)
end

function GameRoomModule.activateBubble(x, y)
    local index = GameRoomModule.getIndexFromXY(x, y)
    if index[1] <= #KanaQuizModule.grid[1] and index[2] <= #KanaQuizModule.grid and index[1] >= 1 and index[2] >= 1 then
        if activeButtons[1][1] == -1 then
            activeButtons[1] = {index[1],index[2] }
        elseif activeButtons[2][1] == -1 then
            activeButtons[2] = {index[1],index[2] }
            if KanaQuizModule.equalChars(
            KanaQuizModule.grid[activeButtons[1][1]][activeButtons[1][2]],
            KanaQuizModule.grid[activeButtons[2][1]][activeButtons[2][2]]) then
                solvedButtons[#solvedButtons + 1] = {activeButtons[1][1], activeButtons[1][2]}
                solvedButtons[#solvedButtons + 1] = {activeButtons[2][1], activeButtons[2][2] }
            end
        else
            activeButtons[1] = {-1,-1}
            activeButtons[2] = {-1,-1}
        end
    end
end

function GameRoomModule.getIndexFromXY(x, y)
    local index = {}
    index[1] = math.floor((x - xoffset) / buttonSize)
    index[2] = math.floor((y - yoffset) / buttonSize)
    return index
end