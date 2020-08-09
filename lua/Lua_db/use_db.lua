require('checkList')
require('create_table')
require('show_tables')

function Use_db(arr)
    io.write('Enter name Datebase for use >> ')
    local use_db = io.read()

    if Check(arr, use_db) == true then

        local command_tb = ""
        while command_tb ~= 'exit' do

            io.write(use_db .. ' >> ')
            command_tb = io.read()

            if command_tb == 'list' then
                print('\ncreate table - создать таблицу\nshow tb - показать таблицы\n')
            
            elseif command_tb == 'create table' or command_tb == 'create tb' then
                Table(use_db) -- создание таблицы
            
            elseif command_tb == 'show tb' or command_tb == 'show' or command_tb == 'show tables' then
                Show_tables(use_db)

            else
                print('Command not found or you come out')
            end
        end
    else
        print('DataBase not found')
    end
    
end