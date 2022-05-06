import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final Function()? ontap;
  final String label;
  const CustomButton({
    Key? key,
    required this.ontap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: _width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.playerO,
          boxShadow: const [
            BoxShadow(
              color: AppColors.playerO,
              blurRadius: 1,
            ),
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
