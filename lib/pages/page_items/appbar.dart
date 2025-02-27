import 'package:flutter/material.dart';
import 'package:todo/widgets/bold_text.dart';
import 'package:todo/widgets/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BoldText(
        text: title,
        fontSize: 20,
        color: AppColors.textColor, 
      ),
      backgroundColor: AppColors.backColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
