function autostart()
    local flag_forStart = false
    local check = 3

    while flag_forStart == false do
        -- init
        io.write("Enter password >> ")
        local message = io.read()

        
        -- if check == 0 then
            -- system.shutdown 
        -- end
        
        -- body
        local fileOpen = io.open("password.txt","r")
        local password = fileOpen:read("l")

        if message == password then
            flag_forStart = true
            print("Wellcome ".."\n")
        else
            print("Password invalid ")
            check = check - 1
        end   
    end     
end