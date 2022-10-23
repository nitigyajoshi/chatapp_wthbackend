const express=require("express");
var http=require("http");
const app=express();
const port=process.env.PORT|| 5000;
var server=http.createServer(app);
var io=require("socket.io")(server);
app.use(express.json());
var client={};
const routes=require("./routes");
app.use("/uploads",express.static("uploads"));
io.on("connection",(Socket)=>{
console.log("connected");
console.log(Socket.id,"has joined");
Socket.on("signin",(id)=>{
console.log(id);
client[id]=Socket;
});
Socket.on("message",(msg)=>{
    console.log(msg);
    let targetid=msg.targetid;
    if (client[targetid]) {
        client[targetid].emit("message",msg);
    } 
    });
});
app.route("/check").get((req,res)=>{
    return res.json("working well");
});
server.listen(port,"0.0.0.0",()=>{

    console.log("server started");
});