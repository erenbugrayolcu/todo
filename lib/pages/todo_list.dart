import 'package:flutter/material.dart';
import 'package:todo/pages/page_items/appbar.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Todo List',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context).pushNamed('/add_todo_screen');
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}