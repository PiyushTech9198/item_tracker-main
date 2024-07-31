import '../models/todo_model.dart';

abstract class TodoRepository {
  List<TodoModel> getItems();
  void addItem(TodoModel item);
  void editItem(int index, TodoModel item);
  void removeItem(int index);
}
