class TodoModel {
  String title;
  bool isCompleted;
  TodoModel({required this.title, this.isCompleted = false});

  void isDone() {
    isCompleted = !isCompleted;
  }

}