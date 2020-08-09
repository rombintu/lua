--functions
local function printTable(tab)
    for i=1,#tab do
        print(tab[i])
    end
end

local function getVar()
    io.write("Введите число: ")
    local var = tonumber(io.read())
    return var
end

local function options(operator)
    local var1 = getVar()
    local var2 = getVar()
    local sum
    if operator == "*" then sum = var1*var2
    elseif operator == "/" then sum = var1/var2
    elseif operator == "+" then sum = var1+var2
    elseif operator == "-" then sum = var1-var2
    end
    print(var1.." "..operator.." "..var2.." = "..sum)
end


--main

--init
local command
local flag = false
local all_commands = {"ex|выход","* |умножить","/ |делить","+ |сумма","- |разность"}
--body
while flag==false do
    io.write("Введите команду: ")
    command = io.read()
    if command=="ex" then
        flag=true
        print("Пока")
    elseif command=="help" then
        printTable(all_commands)
    elseif command=="*" then
        options(command)
    elseif command=="/" then
        options(command)
    elseif command=="+" then
        options(command)
    elseif command=="-" then
        options(command)
    else
        print("Команды не существует")
    end
end