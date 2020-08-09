function create_db(name)
    local name_ras =  name .. '.txt'
    local db = io.open(name_ras,"w")
    print('DateBase with name '..name..' created.')
    db:close()

    local file = io.open('list_db.txt',"a")
    file:write(", '"..name.."'")
    file:close()
end
