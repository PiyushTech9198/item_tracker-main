import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/repositories/todo_repository_impl.dart';
import 'package:item_tracker/viewmodels/todo_viewmodel_impl.dart';
import 'package:item_tracker/views/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:item_tracker/viewmodels/todo_viewmodel.dart';

void main() {
  testWidgets(
    'ItemForm adds item',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<TodoRepoImplementation>(
              create: (_) => TodoRepoImplementation(),
            ),
            ChangeNotifierProxyProvider<TodoRepoImplementation,
                TodoViewModelProvider>(
              create: (context) =>
                  TodoViewModelImpl(context.read<TodoRepoImplementation>()),
              update: (context, itemRepository, itemViewModel) =>
                  itemViewModel ?? TodoViewModelImpl(itemRepository),
            ),
          ],
          child: const MaterialApp(home: Scaffold(body: ItemListScreen())),
        ),
      );
      await tester.enterText(find.byType(TextField).at(0), 'New Item');
    },
  );
}
