import 'package:flutter/material.dart';
import 'package:item_tracker/views/widgets/edit_popup.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/todo_viewmodel.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModelProvider>(
      builder: (context, itemViewModel, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: itemViewModel.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itemViewModel.items[index].itemName),
              subtitle: Text(itemViewModel.items[index].itemDescription),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () =>
                        showEditDialog(context, itemViewModel, index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      itemViewModel.removeItem(index);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
