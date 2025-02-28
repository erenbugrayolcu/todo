import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NOT/models/save_task.dart';
import 'package:NOT/pages/settings.dart';
import 'package:NOT/pages/todo_list.dart';
import 'package:NOT/pages/add_todo.dart';
import 'package:NOT/widgets/theme_notifier.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeNotifier = ThemeNotifier();
  await themeNotifier.loadTheme();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SaveTask()),
        ChangeNotifierProvider(create: (context) => themeNotifier),  
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          theme: context.watch<ThemeNotifier>().currentTheme,
          initialRoute: '/',
          routes: {
            '/': (_) => const TodoList(),
            '/add_todo_screen': (_) => AddTodo(),
            '/settings': (_) => SettingsPage(
              onThemeChanged: context.read<ThemeNotifier>().changeTheme, // Theme değiştir
            ),
          },
        );
      }
    );
  }
}
