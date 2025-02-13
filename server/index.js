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

try {
    await fastify.listen({
        port: 8080
    })
} catch(err) {
    console.log(err)
}