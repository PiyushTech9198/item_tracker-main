import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/todo_repository_impl.dart';
import 'viewmodels/todo_viewmodel.dart';
import 'viewmodels/todo_viewmodel_impl.dart';
import 'views/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoRepoImplementation>(
          create: (_) => TodoRepoImplementation(),
        ),
        ChangeNotifierProxyProvider<TodoRepoImplementation,
            TodoViewModelProvider>(
          create: (context) =>
              TodoViewModelImpl(context.read<TodoRepoImplementation>()),
          update: (context, todoRepository, todoViewModel) =>
              todoViewModel ?? TodoViewModelImpl(todoRepository),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Item Tracker',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ItemListScreen(),
        );
      },
    );
  }
}
