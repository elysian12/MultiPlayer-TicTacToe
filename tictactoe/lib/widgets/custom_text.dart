import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;
  const CustomText({
    Key? key,
    required this.shadows,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        shadows: shadows,
        color: AppColors.playerO,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
