const express = require("express");
const { PrismaClient } = require('@prisma/client');
const http = require('http');
var io = require('socket.io')(server);


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const prisma = new PrismaClient();


io.on("connection",(socket)=>{
    console.log("connected to sockets");

// #*# first echo

    socket.on("createRoom",async ({nickname})=>{
        console.log(nickname);

try {
    const createdGame = await prisma.game.create({
        data : {
            players : {
                create : [
                    {
                        nickname : nickname,
                        socketId : socket.id,
                        turnActive : true,
                        playerType : "X"
                    },
                ],
            },
        },
        include : {
            players : true
        },
       })

       if (createdGame) {
        console.log("data created");
        console.log(createdGame);
       }
       const createdGameId = createdGame.id;
       socket.join(createdGameId);

       io.to(createdGameId).emit("gameSuccessfullyCreated",createdGame);

} catch (error) {
    console.log(error);
}
    })

// #*# second echo    

    socket.on('joinRoom', async ({nickname,gameId})=>{
        try {
            if (!Number.isInteger(gameId)) {
                socket.emit('errorOccured','Please enter a valid game id');
                return;
            }

            const isGameJoinable = await prisma.game.findFirst({
                where : {
                    id : gameId
                }
            })
            console.log(gameId);
            console.log(isGameJoinable.joinable)

            if (isGameJoinable.joinable) {
                const joinedGame = await prisma.game.update({
                    where : {
                        id : gameId
                    }, data : {
                        joinable : false,
                        players : {
                            create : [
                                {
                                    nickname : nickname,
                                    socketId : socket.id,
                                    playerType : 'O'
                                }
                            ]
                        }
                    } ,
                    include : {
                        players : true
                    }
                })
                socket.join(gameId);
                io.to(gameId).emit("gameJoindedSuccessfully",joinedGame);
                io.to(gameId).emit("updatePlayers",joinedGame.players);
                io.to(gameId).emit("updateGame",joinedGame);

            }else{
                console.log('emitted');
                socket.emit('errorOccured','game is in progress');
                return;
            }
        } catch (error) {
            console.log(error);
        }
    })


// #*# third echo of tap

    socket.on('tap',async ({index,gameId}) =>{
        try {

            const currentTurn = await prisma.findFirst({
                where : {
                    if : gameId
                }
            })
            let playerTurn = currentTurn.playerTurn;
            const tappedChoice = currentTurn.players[playerTurn].playerType;

            if (currentTurn.playerTurn == 0) {
                let afterTurn = await prisma.game.update({
                    where : {
                        id : gameId
                    },
                    data : {
                        playerTurn : 1
                    }
                })
                
                io.to(gameId).emit("tapped",{
                    index,
                    tappedChoice,
                    afterTurn,
                })

            }else{
                let afterTurn = await prisma.game.update({
                    where : {
                        id : gameId
                    },
                    data : {
                        playerTurn : 0
                    }
                })

                io.to(gameId).emit("tapped",{
                    index,
                    tappedChoice,
                    afterTurn,
                })
            }
// * 
            
        } catch (error) {
            console.log(error)
        }
    }

// #*# fourth echo


)

})



app.use(express.json());

server.listen(port,'0.0.0.0',()=>{
    console.log("server started on port 3000");
});
