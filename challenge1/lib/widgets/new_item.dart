import 'package:challenge1/data/categories.dart';
import 'package:challenge1/model/category.dart';
import 'package:challenge1/model/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void saveItem() async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final url = Uri.https('first-project-d184e-default-rtdb.firebaseio.com','shopping-list.json');
     final response = await http.post(url, headers: 
      {
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'name': _enteredName,
        'quantity': _enteredQuantity,
        'category': _selectedCategory.title
      })
      );

      print(response.body);
      print(response.statusCode);

      if(!context.mounted){
        return;
      }
      Navigator.of(context).pop(
        // GroceryItem(
        //   id: DateTime.now().toString(),
        //   name: _enteredName,
        //   quantity: _enteredQuantity,
        //   category: _selectedCategory)
        );
    }
    // print(_enteredName);
    // print(_enteredQuantity);
    // print(_selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredName = newValue!;
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: _enteredQuantity.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Quantity',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value)! <= 0) {
                            return 'Please enter a positive number';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            _enteredQuantity = int.parse(newValue!),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 16,
                                        color: category.value.color,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(category.value.title),
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text('Reset')),
                    ElevatedButton(
                        onPressed: saveItem, child: const Text('Add Item'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
