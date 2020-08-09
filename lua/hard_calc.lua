--functions
local function parse(str) -- получаем команду пользователя в виде строки
    local arr = {} -- тут будут хранится числовые значения
    local operator -- тут будет храниться оператор
    local sum -- тут будет хранится итог операций

    for value in str:gmatch("%d+") do -- для каждого числового значения в строке
        table.insert( arr, value) -- добавить значение в таблицу
    end

    for char in str:gmatch("%W") do -- для каждого символа НЕ буквы или цифры
        if char ~= " " then -- если не пробел
            operator = char -- присвоить знак оператора
        end
    end

    if operator == "*" then -- выполнение операторов
        sum = arr[1] * arr[2]
    elseif operator == "/" then
        sum = arr[1] / arr[2]
    elseif operator == "+" then
        sum = arr[1] + arr[2]
    elseif operator == "-" then
        sum = arr[1] - arr[2]
    else
        print("Неверный ввод ")
    end
    print("= "..sum) -- вывод полученного результата
end

--init
local flag = false -- флаг для выхода из цикла

--body
local function main() -- главная функция (нужна для создания исключения ошибок)
    while flag==false do
        io.write("Введите операцию: ")
        local command = io.read() -- запись команды юзера в переменную
            if command == "exit" then
                print("Выход из программы")
                os.exit(0) -- выход из программы через 0 мс
            end
        parse(command) -- передаем команду в функцию parse
    end
end

if pcall(main) then -- создание исключения ошибок
    print("Программа закарылась без ошибок")
else -- если вылетает ошибка
    print("Программа закрылась с ошибками") 
end