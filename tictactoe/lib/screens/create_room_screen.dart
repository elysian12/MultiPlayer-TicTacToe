import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController roomController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    roomController.dispose();
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
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(
                height: height * 0.08,
              ),
              CustomTextField(
                controller: roomController,
                hintText: 'Enter Your Nickname',
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(ontap: () {}, label: 'Create')
            ],
          ),
        ),
      ),
    );
  }
}
