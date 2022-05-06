import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';
import 'package:tictactoe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  const MainMenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/icon.png',
            height: 150,
          ),
          const SizedBox(
            height: 120,
          ),
          CustomButton(
            ontap: () => createRoom(context),
            label: 'Create a Room',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            ontap: () => joinRoom(context),
            label: 'Join a Room',
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
