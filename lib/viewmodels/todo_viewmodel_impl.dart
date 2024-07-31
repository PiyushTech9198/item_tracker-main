import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';
import 'todo_viewmodel.dart';

class TodoViewModelImpl extends TodoViewModelProvider {
  final TodoRepository _itemRepository;

  TodoViewModelImpl(this._itemRepository);

  @override
  List<TodoModel> get items => _itemRepository.getItems();

  @override
  void addItem(String name, String description) {
    _itemRepository
        .addItem(TodoModel(itemName: name, itemDescription: description));

    notifyListeners();
  }

  @override
  void editItem(int index, String name, String description) {
    _itemRepository.editItem(
        index, TodoModel(itemName: name, itemDescription: description));
    notifyListeners();
  }

  @override
  void removeItem(int index) {
    _itemRepository.removeItem(index);
    notifyListeners();
  }
}
