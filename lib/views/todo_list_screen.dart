import 'package:flutter/material.dart';
import 'widgets/todo_form.dart';
import 'widgets/item_list.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Tracker'),
      ),
      body: const Column(
        children: [
          TodoForm(),
          Expanded(child: ItemList()),
        ],
      ),
    );
  }
}
