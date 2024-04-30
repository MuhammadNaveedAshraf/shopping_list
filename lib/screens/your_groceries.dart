import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';

class YourGroceries extends StatelessWidget {
  const YourGroceries({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: GroceryList(
        groceryItems: groceryItems,
      ),
    );
  }
}

class GroceryList extends StatelessWidget {
  const GroceryList({super.key, required this.groceryItems});
  final List<GroceryItem> groceryItems;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => _tile(index, groceryItems[index], context),
    );
  }
}

ListTile _tile(int key, GroceryItem groceryItem, BuildContext context) {
  return ListTile(
    key: ValueKey(key),
    onTap: () {
      int k = ValueKey(key).value;
      print('$k index clicked');
    },
    hoverColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    leading: SizedBox(
      width: 30.0,
      height: 30.0,
      child: DecoratedBox(
        decoration: BoxDecoration(color: groceryItem.category.color),
      ),
    ),
    title: Text(groceryItem.name),
    trailing: Text(
      groceryItem.quantity.toString(),
      style: Theme.of(context).textTheme.titleSmall,
    ),
  );
}
