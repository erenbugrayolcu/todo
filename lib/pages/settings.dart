import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:NOT/pages/page_items/appbar.dart';
import 'package:NOT/widgets/theme_notifier.dart';

class SettingsPage extends StatelessWidget {
  final Function(String) onThemeChanged;

  const SettingsPage({required this.onThemeChanged});

  Future<void> saveTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedTheme', themeName);
  }

  Future<String?> getSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedTheme');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Themes',
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: FutureBuilder<String?>(
        future: getSavedTheme(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          String? savedTheme = snapshot.data;

          return ListView(
            children: ['Dark', 'Half Life', 'RDR2', 'Deus Ex', 'Cyberpunk', 'Tetris', 'M3'].map((themeName) {
              return ListTile(
                title: Text(themeName, style: const TextStyle(color: Colors.white)),
                tileColor: themeName == savedTheme ? Theme.of(context).primaryColor : null, 
                onTap: () {
                  onThemeChanged(themeName);
                  context.read<ThemeNotifier>().changeTheme(themeName);
                  saveTheme(themeName);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
