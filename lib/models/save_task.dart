import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:NOT/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  final List<TaskModel> _tasks = [];
  List<TaskModel> _deletedTasks = [];

  SaveTask() {
    _loadTasks();
  }

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
    _saveTasks();
    notifyListeners();
  }

  void removeTask(int index) {
    final deletedTask = _tasks[index];
    _deletedTasks.add(deletedTask); 
    _tasks.removeAt(index);
    _saveTasks();
    notifyListeners();
  }

  void undoDelete() {
    if (_deletedTasks.isNotEmpty) {
      final lastDeletedTask = _deletedTasks.removeLast(); 
      _tasks.add(lastDeletedTask); 
      _saveTasks();
      notifyListeners();
    }
  }

  void checkTask(int index) {
    _tasks[index].isDone();
    _saveTasks();
    notifyListeners();
  }

  // SharedPreferences'dan görevleri yükleme
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskData = prefs.getString('tasks');
    if (taskData != null) {
      final List<dynamic> taskList = json.decode(taskData);
      _tasks.clear();
      _tasks.addAll(taskList.map((task) => TaskModel.fromJson(task)).toList());
      notifyListeners();
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskData = json.encode(_tasks.map((task) => task.toJson()).toList());
    prefs.setString('tasks', taskData);
  }
}
