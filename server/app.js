const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const dotenv = require('dotenv').config()


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require('./models/room')

var io = require('socket.io')(server)


//middleware
app.use(express.json())


io.on('connection', (socket) => {
    console.log('Connected to Socket');
    socket.on('createRoom', async ({ nickName }) => {

        console.log(nickName);
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname: nickName,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn = player;
            room = await room.save();
            const roomId = room._id.toString();
            socket.join(roomId);

            io.to(roomId).emit('createRoomSuccess', room);
        } catch (error) {
            console.log(error);
        }

    });
    socket.on('joinRoom', async ({ nickName, roomId }) => {
        if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
            socket.emit('errorOccured', "Please enter a valid roomId");
            return;
        }
        let room = await Room.findById(roomId);
        if (room.isJoin) {
            let player = {
                nickname: nickName,
                socketID: socket.id,
                playerType: 'O'
            }
            socket.join(roomId);
            room.players.push(player);
            room.isJoin = false;
            room = await room.save();
            io.to(roomId).emit('joinRoomSuccess', room);
            io.to(roomId).emit('updatePlayerSuccess', room.players);
            io.to(roomId).emit('updateRoom', room);
        } else {
            socket.emit('errorOccured', "The game is in progress, try again later.");
            return;
        }
    });

    socket.on('tap', async ({ index, roomId }) => {
        try {
            let room = await Room.findById(roomId);
            let choice = room.turn.playerType;
            if (room.turnIndex == 0) {
                room.turn = room.players[1];
                room.turnIndex = 1;
            } else {
                room.turn = room.players[0];
                room.turnIndex = 0;
            }
            room = await room.save();

            io.to(roomId).emit('tapped', {
                index,
                choice,
                room
            });
        } catch (error) {
            console.log(error);
        }
    });

    socket.on('winner', async ({ winnerSocketId, roomId }) => {
        try {
            let room = await Room.findById(roomId);
            let player;
            for (let index = 0; index < room.players.length; index++) {
                const element = room.players[index];
                if (element.socketID == winnerSocketId) {
                    element.points += 1;
                    player = element;
                }
            }
            room = await room.save();
            if (player.points == room.maxRounds) {
                io.to(roomId).emit('endGame', player)
            }
            else {
                io.to(roomId).emit('pointIncrease', player);
                console.log(room.players);
            }
        } catch (error) {
            console.log(error);
        }

    });
});

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