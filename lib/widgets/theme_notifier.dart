import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:NOT/widgets/theme_data.dart';

class ThemeNotifier extends ChangeNotifier {
   ThemeData _currentTheme = themes['RDR2']!;

  ThemeData get currentTheme => _currentTheme;

  // Temayı yüklemek
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('selectedTheme');
    _currentTheme = savedTheme != null ? themes[savedTheme]! : themes['Dark']!;
    notifyListeners(); // Tema yüklendikten sonra dinleyicilere bildirim gönder
  }

  // Temayı kaydetmek
  Future<void> saveTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedTheme', themeName);
  }

  // Tema değiştirmek
  void changeTheme(String themeName) {
    _currentTheme = themes[themeName]!;
    saveTheme(themeName);  // Yeni temayı kaydet
    notifyListeners();  // Dinleyicilere tema değiştiğini bildir
  }
}
