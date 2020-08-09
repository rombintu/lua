
function Show_tables(name_db)
    local name_file = name_db..'.txt'
    local file = io.open(name_file,"r")
    
    for line in io.lines(name_file) do
        print(line)
    end
end

Show_tables('Lol_db')