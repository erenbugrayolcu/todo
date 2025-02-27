import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const BoldText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.white,
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
