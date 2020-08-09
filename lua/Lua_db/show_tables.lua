function Show_tables(name_db)
    local name_file = name_db..'.txt'
    
    for line in io.lines(name_file) do
        print(line)
    end
end

