import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/view/todo_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}
