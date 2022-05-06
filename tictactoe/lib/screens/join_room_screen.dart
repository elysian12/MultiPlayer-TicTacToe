import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roomIdController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ResponsiveWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    color: AppColors.playerO,
                    blurRadius: 30,
                  ),
                ],
                text: 'Join Room',
                fontSize: 70,
              ),
              SizedBox(
                height: height * 0.08,
              ),
              CustomTextField(
                controller: nameController,
                hintText: 'Enter Your Nickname',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                controller: roomIdController,
                hintText: 'Enter Your Nickname',
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(ontap: () {}, label: 'Join')
            ],
          ),
        ),
      ),
    );
  }
}
