import Fastify from "fastify";
import websocket from "@fastify/websocket";

const fastify = Fastify()
await fastify.register(websocket)

fastify.get("/", async (request, reply) => {
    return {
        "text": "Hello world"
    }
})

fastify.get("/ws/index", { websocket: true }, async (socket, request) => {

    socket.on("message", message => {
        socket.send('test message')
    })
})

// New counter WebSocket route
fastify.get("/ws/counter", { websocket: true }, async (socket, request) => {
    let count = 0;

    const interval = setInterval(() => {
        if (socket.readyState === 1) { // Check if connection is open
            socket.send(JSON.stringify({ event: "count", value: count }));
            count++;
        } else {
            clearInterval(interval);
        }
    }, 1000); // Send count every second

    socket.on("close", () => {
        clearInterval(interval);
    });
});

// Endpoint to receive JSON data and save it to a file
fastify.post('/api/items', async (request, reply) => {
    try {
        const data = request.body;
        writeFileSync('items.json', JSON.stringify(data, null, 2));
        reply.send({ success: true, message: 'Data saved to items.json' });
    } catch (err) {
        reply.status(500).send({ success: false, error: err.message });
    }
});

try {
    await fastify.listen({
        port: 8080
    })
} catch(err) {
    console.log(err)
}