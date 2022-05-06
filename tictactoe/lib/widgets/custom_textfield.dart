import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColors.playerO.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 5,
          )
        ]),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.textColor.withOpacity(0.4),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
