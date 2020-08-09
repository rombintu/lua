
function Check(list, name)
    
    local find_name = list:match(name)
        if find_name == name then
            return true
        end
    
    return false
end

