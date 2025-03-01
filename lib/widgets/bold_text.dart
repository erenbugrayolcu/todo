import 'package:flutter/material.dart';
import 'package:NOT/widgets/themes.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const BoldText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color, 
      ),
    );
  }
}
