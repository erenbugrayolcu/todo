import 'package:flutter/material.dart';
import 'package:NOT/widgets/bold_text.dart';
import 'package:NOT/widgets/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon icon;
  final VoidCallback onPressed; 

  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BoldText(
        text: title,
        fontSize: 20,
        color: AppColors.textColor, 
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton( 
        icon: icon,
        onPressed: onPressed,  
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}