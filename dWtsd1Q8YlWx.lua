local message = "Hello, Roblox Lua!"
local counter = 0

local function greet(times)
    for i = 1, times do
        counter = counter + 1
        print(message .. " (" .. counter .. ")")
        if counter % 5 == 0 then
            print("Reached a multiple of 5!")
        end
    end
end

greet(10)
