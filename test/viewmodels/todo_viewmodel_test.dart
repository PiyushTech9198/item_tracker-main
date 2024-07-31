import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/repositories/todo_repository_impl.dart';
import 'package:item_tracker/viewmodels/todo_viewmodel_impl.dart';

void main() {
  group('ItemViewModel', () {
    test('should add an item', () {
      final itemRepository = TodoRepoImplementation();
      final itemViewModel = TodoViewModelImpl(itemRepository);

      itemViewModel.addItem('Test Item', 'Test Description');
      expect(itemViewModel.items.length, 1);
      expect(itemViewModel.items[0].itemName, 'Test Item');
      expect(itemViewModel.items[0].itemDescription, 'Test Description');
    });

    test('should edit an item', () {
      final itemRepository = TodoRepoImplementation();
      final itemViewModel = TodoViewModelImpl(itemRepository);

      itemViewModel.addItem('Test Item', 'Test Description');
      itemViewModel.editItem(0, 'Updated Item', 'Updated Description');
      expect(itemViewModel.items[0].itemName, 'Updated Item');
      expect(itemViewModel.items[0].itemDescription, 'Updated Description');
    });

    test('should remove an item', () {
      final itemRepository = TodoRepoImplementation();
      final itemViewModel = TodoViewModelImpl(itemRepository);

      itemViewModel.addItem('Test Item', 'Test Description');
      itemViewModel.removeItem(0);
      expect(itemViewModel.items.length, 0);
    });
  });
}
