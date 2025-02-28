import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NOT/models/save_task.dart';
import 'package:NOT/pages/page_items/appbar.dart';
import 'package:NOT/widgets/default_text.dart';
import 'package:NOT/widgets/theme_data.dart';
import 'package:NOT/widgets/themes.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Todo List',
        icon: Icon(Icons.settings, color: Colors.white,),
        onPressed: () {
          Navigator.of(context).pushNamed('/settings');
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Theme.of(context).primaryColor,
        elevation: 0, 
        onPressed: () {
          Navigator.of(context).pushNamed('/add_todo_screen');
        },
        child: Icon(Icons.add, color: Theme.of(context).scaffoldBackgroundColor,),
      ),

      body: Consumer<SaveTask>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: DefaultText(
                  text: task.tasks[index].title,
                  decoration: task.tasks[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
                trailing: Wrap(
                  children: [
                    Checkbox(
                      value: task.tasks[index].isCompleted,
                      fillColor: WidgetStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                      overlayColor: WidgetStateProperty.all(AppColors.textColor),
                      checkColor: AppColors.textColor,
                      onChanged: (_) {
                        context.read<SaveTask>().checkTask(index);
                      },
                      side: BorderSide.none, 
                    ),

                    IconButton(
                        onPressed: () {
                          final deletedTask = task.tasks[index];
                          context.read<SaveTask>().removeTask(index);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.snackBarBackColor,
                              content: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: DefaultText(
                                  text: "Deleted: ${deletedTask.title}",
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              duration: const Duration(seconds: 5),
                              action: SnackBarAction(
                                label: "Undo",
                                backgroundColor: Theme.of(context).primaryColor,
                                textColor: AppColors.textColor,
                                disabledTextColor:
                                    Theme.of(context).primaryColor,
                                onPressed: () {
                                  context.read<SaveTask>().undoDelete();
                                },
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.delete,
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
