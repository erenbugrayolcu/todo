import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NOT/models/save_task.dart';
import 'package:NOT/models/task_model.dart';
import 'package:NOT/pages/page_items/appbar.dart';
import 'package:NOT/widgets/default_text.dart';
import 'package:NOT/widgets/themes.dart';

// ignore: must_be_immutable
class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final controller = TextEditingController();
  bool isSnackBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Todo',
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,),
        onPressed: () {
          if (isSnackBarVisible) {
            ScaffoldMessenger.of(context).clearSnackBars();
          }
          Navigator.of(context).pop();
        },
      ),
      body:
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              cursorColor: Theme.of(context).primaryColor,
              controller: controller,
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Onur wants you to buy...',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: () {
                if (controller.text.isEmpty) {
                  if (!isSnackBarVisible) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.snackBarBackColor,
                        content: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: const DefaultText(
                            text: "Please enter a task.",
                            decoration: TextDecoration.none,
                          ),
                        ),
                        duration: const Duration(seconds: 5),
                      ),
                    );
                    isSnackBarVisible = true;
                    Future.delayed(const Duration(seconds: 2), () {
                      isSnackBarVisible = false;
                    });
                  }
                } else {
                  context.read<SaveTask>().addTask(
                        TaskModel(title: controller.text, isCompleted: false),
                      );
                  controller.clear();
                  Navigator.of(context).pop();
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor,),
                foregroundColor: WidgetStateProperty.all(AppColors.textColor),
              ),
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}