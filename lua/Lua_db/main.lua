require('create_db')
require('delete_db')
require('use_db')
require('checkList')

local function main()
    local command = ''
    
    while command ~= 'exit' do
        io.write('System >> ')
        command = io.read()

        if command == 'help' or command == 'hello' then
            print('\nHello!\nwrite - "list" - показать все доступные команды | show all commands \n')
        
        elseif command == 'list' then
            print('\n"create db" - создать базу данных | create new database\n"delete db" - удалить базу данных | delete database\n  "list db" - список баз данных   | list database\n      "use" - выбрать базу данных | use database\n     "exit" - выйти из программы  | close program\n')
        
        elseif command == 'create db' or command == 'create database' then
            io.write('Enter name new Database >> ')
            local name = io.read()
            create_db(name)

        elseif command == 'delete db' or command == 'delete database' then
            io.write('Enter name Database for delete >> ')
            local name = io.read()
            delete_db(name)
            
        elseif command == 'use' then
            local file = io.open('list_db.txt',"r")
            local arr_db = file:read()
            Use_db(arr_db)   
            file:close()

        elseif command == 'list db' then
            local file = io.open('list_db.txt',"r")
            local arr_db = file:read()
            print(arr_db)
            file:close()

        else
            print("Command not found or you come out")

        end
    end
end

if pcall(main) then
	print("program closed without errors")
else
	print("!<< program closed with errors >>!")
end


