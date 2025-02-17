-- Lua script for ComputerCraft (CC:Tweaked) with Advanced Peripherals
-- Lists all items in an Applied Energistics 2 (AE2) system and sends them as JSON to a webserver

-- Load required APIs
os.loadAPI("json")  -- Ensure you have a JSON API available

-- Get the AE2 peripheral
local me = peripheral.wrap("left") -- Adjust side as necessary
if not me then
    error("No ME peripheral found on the left side")
end

-- Fetch all items from the ME system
local items = me.listItems()  -- Advanced Peripherals method

-- Convert the items to JSON format
local jsonData = json.encode(items)