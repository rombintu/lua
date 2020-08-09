function delete()
    -- init

    -- body
    local fileOpen = io.open("password.txt", "w")
    fileOpen:close()
end