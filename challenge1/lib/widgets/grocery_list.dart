import 'package:challenge1/data/dummy_item.dart';
import 'package:challenge1/model/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:challenge1/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItem = groceryItems;

  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    setState(() {
      _groceryItem.add(newItem!);
    });
  }

  void _removeItem(GroceryItem item){
    setState(() {
      _groceryItem.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [IconButton(onPressed: addItem, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemCount: _groceryItem.length,
          itemBuilder: (cnt, index) => Dismissible(
            onDismissed: (direcion){
              _removeItem(_groceryItem[index]);
            },
            key: ValueKey(_groceryItem[index].id),
            child:  ListTile(
                  title: Text(_groceryItem[index].name),
                  leading: Container(
                    height: 25,
                    width: 25,
                    color: _groceryItem[index].category.color,
                  ),
                  trailing: Text(_groceryItem[index].quantity.toString()),
                ),
          )),
    );
  }
}
