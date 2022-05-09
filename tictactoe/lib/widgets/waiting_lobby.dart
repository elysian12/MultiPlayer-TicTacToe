import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tictactoe/providers/room_data_provider.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for a player to Join'),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: roomIdController,
          hintText: '',
          isReadOnly: true,
          isSuffixIcon: true,
          ontap: () {
            Share.share(
                'Hey ${Provider.of<RoomDataProvider>(context, listen: false).roomData['players'][0]['nickname']} is Wating  for you. Join the room with ${Provider.of<RoomDataProvider>(context, listen: false).roomData['_id']}');
          },
        )
      ],
    );
  }
}
