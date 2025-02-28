local repo = "DeZeeKees/compcraft-websocket-test" -- Replace with your GitHub username and repo name
local branch = "main" -- Change if using a different branch

local files = { -- List of Lua files to fetch
    "main.lua",
    "me-test.lua"
}

local baseUrl = "https://raw.githubusercontent.com/" .. repo .. "/" .. branch .. "/"

for _, file in ipairs(files) do
    local url = baseUrl .. file
    local response = http.get(url)
    
    if response then
        local content = response.readAll()
        response.close()
        
        local fileHandle = fs.open(file, "w")
        fileHandle.write(content)
        fileHandle.close()
        
        print("Downloaded: " .. file)
    else
        print("Failed to download: " .. file)
    end
end

print("All files processed.")