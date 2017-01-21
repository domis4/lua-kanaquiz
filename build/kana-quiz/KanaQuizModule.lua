KanaQuizModule = {}
KanaQuizModule.grid = {
    {0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0},
}
KanaQuizModule.romaji = {
    "a", "i", "u", "e", "o",
    "ka", "ki", "ku", "ke", "ko",
    "sa", "shi", "su", "se", "so",
    "ta", "chi", "tsu", "te", "to",
    "na", "ni", "nu", "ne", "no",
    "ha", "hi", "fu", "he", "ho",
    "ma", "mi", "mu", "me", "mo",
    "ya", "yu", "yo",
    "ra", "ri", "ru", "re", "ro",
    "wa", "wo",
    "n"
}
KanaQuizModule.hiragana = {
    "あ", "い", "う", "え", "お",
    "か", "き", "く", "け", "こ",
    "さ", "し", "す", "せ", "そ",
    "た", "ち", "つ", "て", "と",
    "な", "に", "ぬ", "ね", "の",
    "は", "ひ", "ふ", "へ", "ほ",
    "ま", "み", "む", "め", "も",
    "や", "ゆ", "よ",
    "ら", "り", "る", "れ", "ろ",
    "わ", "を",
    "ん"
}
KanaQuizModule.katakana = {
    "ア", "イ", "ウ", "エ", "オ",
    "カ", "キ", "ク", "ケ", "コ",
    "サ", "シ", "ス", "セ", "ソ",
    "タ", "チ", "ツ", "テ", "ト",
    "ナ", "ニ", "ヌ", "ネ", "ノ",
    "ハ", "ヒ", "フ", "ヘ", "ホ",
    "マ", "ミ", "ム", "メ", "モ",
    "ヤ", "ユ", "ヨ",
    "ラ", "リ", "ル", "レ", "ロ",
    "ワ", "ヲ",
    "ン"
}
local activeGrid1
local activeGrid2

function KanaQuizModule.generateGrid(grid1, grid2)
    math.randomseed(System.getTime())
    activeGrid1 = grid1
    activeGrid2 = grid2
    local randomUnique = getRandomUnique(grid1, grid2)
    for i,v in pairs(KanaQuizModule.grid) do
        for j,w in pairs(KanaQuizModule.grid[i]) do
            local tempUnique = copyByValue(randomUnique)
            local rand = math.random(#tempUnique)
            KanaQuizModule.grid[i][j] = randomUnique[rand]
            table.remove(tempUnique, rand)
            randomUnique = tempUnique
        end
    end
end

function KanaQuizModule.equalChars(char1, char2)
    local grid1pos = 0
    local grid2pos = 0
    for i,v in pairs(activeGrid1) do
        if activeGrid1[i] == char1 or activeGrid1[i] == char2 then
            grid1pos = i
        end
        if activeGrid2[i] == char1 or activeGrid2[i] == char2 then
            grid2pos = i
        end
    end
    if grid1pos == 0 or grid2pos == 0 then
        return false
    end
    if grid1pos == grid2pos then
        return true
    else
        return false
    end
end

function getRandomUnique(grid1, grid2)
    math.randomseed(System.getTime())
    local tempArray = {}
    local duplicateArray1 = copyByValue(grid1)
    local duplicateArray2 = copyByValue(grid2)
    for i = 1, 18 do
        local rand =  math.random(#grid1)
        table.insert(tempArray, grid1[rand])
        table.insert(tempArray, grid2[rand])
        table.remove(duplicateArray1, rand)
        table.remove(duplicateArray2, rand)
        grid1 = copyByValue(duplicateArray1)
        grid2 = copyByValue(duplicateArray2)
    end
    return tempArray
end

function copyByValue2D(array)
    local copy = {}
    for i,v in pairs(array) do
        copy[i] = {}
        for j,w in pairs(array[i]) do
            copy[i][j] = array[i][j]
        end
    end
    return copy
end
function copyByValue(array)
    local copy = {}
    for i,v in pairs(array) do
       copy[i] = array[i]
    end
    return copy
end