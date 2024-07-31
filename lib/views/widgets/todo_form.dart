import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/todo_viewmodel.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submit() {
    if (_nameController.text.isEmpty || _descriptionController.text.isEmpty) {
      return;
    }
    Provider.of<TodoViewModelProvider>(context, listen: false).addItem(
      _nameController.text,
      _descriptionController.text,
    );
    _nameController.clear();
    _descriptionController.clear();
  }

  void _measureSize() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    if (kDebugMode) {
      print('Size of the widget: $size');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _submit();
              _measureSize();
            },
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
