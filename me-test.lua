-- Lua script for ComputerCraft (CC:Tweaked) with Advanced Peripherals
-- Lists all items in an Applied Energistics 2 (AE2) system and sends them as JSON to a webserver

-- Get the AE2 peripheral
local me = peripheral.wrap("right") -- Adjust side as necessary
if not me then
    error("No ME peripheral found on the left side")
end

-- Fetch all items from the ME system
local items = me.listItems()  -- Advanced Peripherals method

-- Convert the items to JSON format using textutils.serialiseJSON
local jsonData = textutils.serialiseJSON(items, { allow_repetitions = true })

-- Define the webserver URL
local url = "http://example.com/api/items"  -- Change this to your actual webserver endpoint

-- Send the JSON data to the webserver
local response = http.post(url, jsonData, { ["Content-Type"] = "application/json" })

if response then
    print("Data sent successfully!")
    response.close()
else
    print("Failed to send data")
end
