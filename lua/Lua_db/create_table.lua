
function Table(use_db)
    io.write('Enter name Table >> ')
    local table_name = io.read()
        
    local Table_name = {} -- тут хранятся колонки
    local y = 1 -- это для посчета колонок
    local type_n = false

    while type_n == false do
        io.write('How mach columns? >> ')
        local num_columns = io.read()
        if type(tonumber(num_columns)) ~= "number" then
            print('Error !!! its not number ')
        else
            type_n = true -- выход из цикла

            local file = io.open(use_db..'.txt',"a")
            
            file:write('\nTable: '..table_name..'\n')
            
            for i = 1, num_columns do
                io.write('Enter name column "'..y..'" >> ')
                local inputs = tostring(io.read())
                table.insert(Table_name, inputs)
                file:write(i..'.'..inputs.."\n")
                y = y + 1
            end

            io.write("Show Table? y/n >> ")
            local ask = io.read()

            if ask == 'y' then
                print('\nTable "'..table_name..'"')
        
                for i=1, #Table_name do
                    print(i..'. '..Table_name[i])
                end 
            end
            
            file:close()
        end
    end
end