local ws, err = http.websocket("ws://localhost:8080/ws/counter")

if not ws then
    print("WebSocket error: " .. err)
    return
end

print("Connected to WebSocket server.")

while true do
    local response, err = ws.receive()

    if not response then
        print("Socket closed: " .. tostring(err))
        break
    end

    local json = textutils.unserialiseJSON(response)

    if json.event == "count" then
        print(json.value)
    end
end

ws.close()
