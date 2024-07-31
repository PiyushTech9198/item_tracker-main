import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import 'todo_repository.dart';

class TodoRepoImplementation extends ChangeNotifier implements TodoRepository {
  final List<TodoModel> _items = [];

  @override
  List<TodoModel> getItems() {
    return _items;
  }

  @override
  void addItem(TodoModel item) {
    _items.add(item);
    notifyListeners();
  }

  @override
  void editItem(int index, TodoModel item) {
    _items[index] = item;
    notifyListeners();
  }

  @override
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
