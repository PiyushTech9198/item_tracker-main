import 'package:flutter/material.dart';
import '../models/todo_model.dart';

abstract class TodoViewModelProvider extends ChangeNotifier {
  List<TodoModel> get items;
  void addItem(String name, String description);
  void editItem(int index, String name, String description);
  void removeItem(int index);
}
