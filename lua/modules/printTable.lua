function printTable(tab)
    local StringBuffer = ""

    for i=1,#tab do
        StringBuffer = StringBuffer .. "[" ..tab[i].."]"
    end

    print(StringBuffer)
end