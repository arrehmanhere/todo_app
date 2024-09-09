import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';

class ViewAllTodos extends StatelessWidget {
  const ViewAllTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Todos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      todoProvider.todos[index].title,
                      style: TextStyle(
                        color: Colors.teal,
                        decoration: todoProvider.todos[index].isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: const Icon(Icons.access_time_filled_sharp),
                    trailing: Wrap(
                      children: [
                        Checkbox(
                          value: todoProvider.todos[index].isCompleted,
                          onChanged: (_) {
                            context.read<TodoProvider>().checkTask(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoProvider>().remove(todoProvider.todos[index]);
                          },
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                itemCount: todoProvider.todos.length);
          },
        ),
      ),
    );
  }
}
