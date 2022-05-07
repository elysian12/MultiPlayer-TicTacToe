import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/room_data_provider.dart';
import 'package:tictactoe/resources/socket_method.dart';
import 'package:tictactoe/utils/colors.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({Key? key}) : super(key: key);

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final _socketMethods = SocketMethod();

  @override
  void initState() {
    _socketMethods.tappedListeners(context);
    super.initState();
  }

  void tapped(int index, RoomDataProvider provider) {
    _socketMethods.tapGrid(
        index, provider.roomData['_id'], provider.displayElemets);
  }

  @override
  Widget build(BuildContext context) {
    final roomDataProvider = Provider.of<RoomDataProvider>(context);
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 600,
      ),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['socketID'] ==
            _socketMethods.socketClient.id,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, int index) {
            return InkWell(
              onTap: () => tapped(index, roomDataProvider),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.textColor,
                  ),
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      roomDataProvider.displayElemets[index],
                      style: TextStyle(
                          color: roomDataProvider.displayElemets[index] == 'X'
                              ? AppColors.playerX
                              : AppColors.playerO,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color:
                                  roomDataProvider.displayElemets[index] == 'X'
                                      ? AppColors.playerX
                                      : AppColors.playerO,
                              blurRadius: 5,
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
