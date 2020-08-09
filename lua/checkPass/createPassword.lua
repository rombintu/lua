-- pack

function create()
    -- init
    local password = io.read()
    local fileOpen = io.open("password.txt", "w")

    -- body
    fileOpen:write(password)
    fileOpen:close()
end
