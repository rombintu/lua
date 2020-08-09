
local function printTable(tab,n)
    local StringBuffer = ""

    for i=1,#tab do
        StringBuffer = StringBuffer .. "[" ..tab[i].."]"
    end

    print("["..n.."]"..StringBuffer)

end

local function printGame(l1,l2,l3)
    print("\n")
    printTable({"_1_", "_2_", "_3_"},"N|L")
    printTable(l1,"_1_")
    printTable(l2,"_2_")
    printTable(l3,"_3_")
end

local function process_line()
    io.write("Введите число строки: ")
    local line = tonumber(io.read())
    if type(line) == "number" then
        return line
    else
        print("Неверный ввод, попробуйте еще раз")
        process_line()
    end
end

local function process_column()
    io.write("Введите число столбца: ")
    local column = tonumber(io.read())
    if type(column) == "number" then
        return column
    else 
        print("Неверный ввод, попробуйте еще раз")
        process_column()
    end    
end

local function Player(player)
    print("Ходит "..player)
    local val_line = process_line()
    local val_column = process_column()
    if val_line < 0 or val_column < 0 then
        print("Неправильный ввод ")
        Player(player)
    elseif val_line > 3 or val_column > 3 then 
        print("Неправильный ввод ")
        Player(player)
    elseif game_bar[val_line][val_column] ~= " - " then
        print("Это значение уже занято, попробуйте другое")
        Player(player)
    else
        game_bar[val_line][val_column] = " "..player.." "
        printGame(game_bar[1],game_bar[2],game_bar[3])
        io.write("\nНажми любую кнопку \n ")
        io.read()
    end
end

local function step(flag)
    
    if flag == true then
        Player("X")
    else
        Player("O")
    end
end

local function check_line(player)
    local count_l = 3
    local count_c = 3

    if game_bar[count_l][count_c] == player and game_bar[count_l][count_c-1] == player and game_bar[count_l][count_c-2] == player then
        return false
    elseif game_bar[count_l-1][count_c] == player and game_bar[count_l-1][count_c-1] == player and game_bar[count_l-1][count_c-2] == player then
        return false
    elseif game_bar[count_l-2][count_c] == player and game_bar[count_l-2][count_c-1] == player and game_bar[count_l-2][count_c-2] == player then
        return false
    end
end

local function check_column(player)
    local count_l = 3
    local count_c = 3

    if game_bar[count_l][count_c] == player and game_bar[count_l-1][count_c] == player and game_bar[count_l-2][count_c] == player then
        return false
    elseif game_bar[count_l][count_c-1] == player and game_bar[count_l-1][count_c-1] == player and game_bar[count_l-2][count_c-1] == player then
        return false
    elseif game_bar[count_l][count_c-2] == player and game_bar[count_l-1][count_c-2] == player and game_bar[count_l-2][count_c-2] == player then
        return false
    end
end

local function check_diagonal(player)
    local count_l = 3
    local count_c = 3

    if game_bar[count_l][count_c] == player and game_bar[count_l-1][count_c-1] == player and game_bar[count_l-2][count_c-2] == player then
        return false
    elseif game_bar[count_l][count_c-2] == player and game_bar[count_l-1][count_c-1] == player and game_bar[count_l-2][count_c-2] == player then
        return false
    end
end

local function win()
    local x = " X "
    local o = " O "
    if check_line(x) == false then
        return false
    elseif check_line(o) == false then
        return false
    elseif check_column(x) == false then
        return false
    elseif check_column(o) == false then
        return false
    elseif check_diagonal(x) == false then
        return false
    elseif check_diagonal(o) == false then
        return false
    end
end


local function main()
    local void = " - "
    local line_1 = {void,void,void}
    local line_2 = {void,void,void}
    local line_3 = {void,void,void}
    game_bar = {line_1,line_2,line_3} -- двойной массив, который содержит в себе 3 линии
    local exGame = false -- чтобы выйти из игры
    local val_for_step = true --флаг некст хода

    

    while exGame == false do
        step(val_for_step) -- вызываем функцию хода с игроком
        val_for_step = not val_for_step -- меняем игрока и ход

        if win() == false then
            print("Конец игры ")
            exGame = true
        end
    end
end

if pcall(main) then
    print("Программа завершилась без ошибок")
else
    print("Программа завершилась с ошибками")
end