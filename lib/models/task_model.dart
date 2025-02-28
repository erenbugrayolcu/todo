class TaskModel {
  final String title;
  bool isCompleted;

  TaskModel({required this.title, required this.isCompleted});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  void isDone(){
    isCompleted = !isCompleted;
  }
}
