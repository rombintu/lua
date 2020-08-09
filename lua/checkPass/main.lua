-- pack
require("createPassword")
require("deletePassword")
require("autoStart")

-- init
local main_command
local flag_forEx = false

-- body
while flag_forEx == false do 
    io.write("Enter command >> ")
    main_command = io.read()

    if main_command == "help" then
        print("\n".."Use command >> create, delete, test, exit ".."\n")
    
    elseif main_command == "create" then
        io.write("Enter password >> ")
        create()

    elseif main_command == "delete" then
        delete()

    elseif main_command == "test" then
        autostart()

    elseif main_command == "exit" then
        flag_forEx = true
    
    else
        print("Command not found, try again..." .. "\n")
    end    
end    