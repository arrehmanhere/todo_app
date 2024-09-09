import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todos = [
    TodoModel(title: 'Learn Flutter', isCompleted: false ),
    TodoModel(title: 'Learn Provider', isCompleted: false),
    TodoModel(title: 'Learn State Management', isCompleted: false),
  ];

  List<TodoModel> get todos => _todos;

  void add(TodoModel todo ) {
    _todos.add(todo);
    notifyListeners();
  }

  void checkTask(int index) {
    _todos[index].isDone();
    notifyListeners();
  }

  void remove(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void removeAll() {
    _todos.clear();
    notifyListeners();
  }

  List<TodoModel> getTodos() {
    return _todos;
  }

}