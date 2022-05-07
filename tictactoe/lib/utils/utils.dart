import 'package:flutter/material.dart';
import 'package:tictactoe/resources/game_methods.dart';
import 'package:tictactoe/utils/colors.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialogBox(BuildContext context, String content) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 146,
          width: 236,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Text(
                'Game Result',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(content),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  GameMthods().clearBoard(context);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 38,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.playerX,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Play Again',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
    },
  );
}
