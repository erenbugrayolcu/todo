import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  List<TaskModel> _tasks = [
    TaskModel(title: 'Learn Flutter'),
    TaskModel(title: 'Drink Water'),
  ];

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task){
    tasks.add(task);
    notifyListeners();
  }
}