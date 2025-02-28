import 'package:flutter/material.dart';

Map<String, ThemeData> themes = {
  'Dark': ThemeData(
    scaffoldBackgroundColor: const Color(0xFF212121), 
    primaryColor: const Color(0xFFBDBDBD), 
  ),
  'Half Life': ThemeData(
    scaffoldBackgroundColor: const Color(0xFF181818), 
    primaryColor: const Color(0xFFE66000), 
  ),
  'RDR2': ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 65, 32, 0),
    primaryColor: const Color.fromARGB(255, 154, 0, 0), 
  ),
  'Deus Ex': ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0D0D0D),
    primaryColor: const Color(0xFFFFC107),
  ),
  'Cyberpunk': ThemeData(
    scaffoldBackgroundColor: const Color(0xFF1A1A2E), 
    primaryColor: const Color(0xFFFF007F), 
  ),
  'Tetris': ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0F380F),
    primaryColor: const Color(0xFF8B9B4F),
  ),
  'M3': ThemeData(
    scaffoldBackgroundColor:  const Color.fromARGB(255, 0, 77, 144),
    primaryColor: const Color.fromARGB(255, 183, 183, 183)
  ),
};
