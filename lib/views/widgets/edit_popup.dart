import 'package:flutter/material.dart';
import 'package:item_tracker/viewmodels/todo_viewmodel.dart';

void showEditDialog(
    BuildContext context, TodoViewModelProvider itemViewModel, int index) {
  final item = itemViewModel.items[index];
  final nameController = TextEditingController(text: item.itemName);
  final descriptionController =
      TextEditingController(text: item.itemDescription);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              itemViewModel.editItem(
                index,
                nameController.text,
                descriptionController.text,
              );
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
