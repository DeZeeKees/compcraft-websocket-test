local ws, err = http.websocket("ws://localhost:8080/ws/index")

if not ws then
    print("WebSocket error: " .. err)
    return
end

ws.send("Hello World")
print(ws.receive())
ws.close()
