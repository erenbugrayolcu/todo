import 'package:flutter/material.dart';
import 'package:todo/pages/page_items/appbar.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Todo',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'The new duty is...'
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(onPressed: () {}, child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}