require('os')

function delete_db(name)
    local file = name..'.txt'
    os.remove(file)  
    print('Date base '.. name .. ' deleted.')  

    local new_name = ", '"..name.."'"

    local file_old_list_db = io.open('list_db.txt', 'r')
    local file_read = file_old_list_db:read()
    local old_list_db = string.gsub(file_read, new_name, '', 1)
    local new_list_db = io.open('list_db.txt','w')
    new_list_db:write(old_list_db)
    new_list_db:close()  
end