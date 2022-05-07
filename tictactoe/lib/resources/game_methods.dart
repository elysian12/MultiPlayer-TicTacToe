import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/providers/room_data_provider.dart';
import 'package:tictactoe/utils/utils.dart';

class GameMthods {
  void checkWinner(BuildContext context, Socket socketClient) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);
    String winner = ''; // X or O

    if (roomDataProvider.displayElemets[0] ==
            roomDataProvider.displayElemets[1] &&
        roomDataProvider.displayElemets[1] ==
            roomDataProvider.displayElemets[2] &&
        roomDataProvider.displayElemets[0] != '') {
      winner = roomDataProvider.displayElemets[0];
    }
    if (roomDataProvider.displayElemets[3] ==
            roomDataProvider.displayElemets[4] &&
        roomDataProvider.displayElemets[4] ==
            roomDataProvider.displayElemets[5] &&
        roomDataProvider.displayElemets[3] != '') {
      winner = roomDataProvider.displayElemets[3];
    }
    if (roomDataProvider.displayElemets[6] ==
            roomDataProvider.displayElemets[7] &&
        roomDataProvider.displayElemets[7] ==
            roomDataProvider.displayElemets[8] &&
        roomDataProvider.displayElemets[6] != '') {
      winner = roomDataProvider.displayElemets[6];
    }
    if (roomDataProvider.displayElemets[0] ==
            roomDataProvider.displayElemets[3] &&
        roomDataProvider.displayElemets[3] ==
            roomDataProvider.displayElemets[6] &&
        roomDataProvider.displayElemets[0] != '') {
      winner = roomDataProvider.displayElemets[0];
    }
    if (roomDataProvider.displayElemets[1] ==
            roomDataProvider.displayElemets[4] &&
        roomDataProvider.displayElemets[4] ==
            roomDataProvider.displayElemets[7] &&
        roomDataProvider.displayElemets[1] != '') {
      winner = roomDataProvider.displayElemets[1];
    }
    if (roomDataProvider.displayElemets[2] ==
            roomDataProvider.displayElemets[5] &&
        roomDataProvider.displayElemets[5] ==
            roomDataProvider.displayElemets[8] &&
        roomDataProvider.displayElemets[2] != '') {
      winner = roomDataProvider.displayElemets[2];
    }
    if (roomDataProvider.displayElemets[0] ==
            roomDataProvider.displayElemets[4] &&
        roomDataProvider.displayElemets[4] ==
            roomDataProvider.displayElemets[8] &&
        roomDataProvider.displayElemets[0] != '') {
      winner = roomDataProvider.displayElemets[0];
    }
    if (roomDataProvider.displayElemets[2] ==
            roomDataProvider.displayElemets[4] &&
        roomDataProvider.displayElemets[4] ==
            roomDataProvider.displayElemets[6] &&
        roomDataProvider.displayElemets[2] != '') {
      winner = roomDataProvider.displayElemets[2];
    } else if (roomDataProvider.filledBoxes == 9) {
      winner = '';
      //display draw dialog
      showGameDialogBox(context, 'Draw');
    }

    if (winner != '') {
      if (roomDataProvider.player1.playerType == winner) {
        showGameDialogBox(context, roomDataProvider.player1.nickname);
        socketClient.emit('winner', {
          'winnerSocketId': roomDataProvider.player1.socketID,
          'roomId': roomDataProvider.roomData['_id']
        });
      } else {
        showGameDialogBox(context, roomDataProvider.player2.nickname);
        socketClient.emit('winner', {
          'winnerSocketId': roomDataProvider.player2.socketID,
          'roomId': roomDataProvider.roomData['_id']
        });
      }
    }
  }

  void clearBoard(BuildContext context) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    for (var i = 0; i < roomDataProvider.roomData.length; i++) {
      roomDataProvider.updateDisplayElements(i, '');
    }
    roomDataProvider.setFilledBoxesToZero();
  }
}
