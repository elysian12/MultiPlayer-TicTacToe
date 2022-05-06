const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const dotenv = require('dotenv').config()


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require('socket.io')(server)


//middleware
app.use(express.json())


io.on('connection', (socket) => {
    console.log('Connected to Socket')
})

mongoose.connect(
    process.env.MONGO_URI,
).then(() => {
    console.log('Connected to Db...');
}).catch((err) => {
    console.log(`Error occured ${err}`);
});

server.listen(port, '0.0.0.0', () => {
    console.log(`server is listening on pot ${port}`);
});