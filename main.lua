local req = http.get("http://localhost:8080")
local content = req.readAll()
print(content)

req.close()
