import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/save_task.dart';
import 'package:todo/pages/todo_list.dart';
import 'package:todo/pages/add_todo.dart';
import 'package:todo/widgets/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask(),
      child: const MyApp()
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backColor
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoList(),
        '/add_todo_screen': (_) => AddTodo()
      },
    );
  }
}