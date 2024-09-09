import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/main.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/view/view_all_todos.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  final TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              "Add a new Todo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 40,),
             TextFormField(
               controller: _todoController,
               decoration: const InputDecoration(
                 hintText: "Enter your todo",
                 labelText: "Todo",
                 border: OutlineInputBorder(),
               ),
             ),
             const SizedBox(
              height: 20,
            ),
             ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().add(
                  TodoModel(
                    title: _todoController.text,
                    isCompleted: false,
                  ),
                );
                _todoController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewAllTodos(),
                  ),
                );
              },
              child:  const Text("Add Todo"),
            ),

          ],
        ),
      ),
    );
  }
}
