import 'package:flutter/material.dart';

class AddPlaceScreen extends StatelessWidget {
  AddPlaceScreen({super.key});

  final title = TextEditingController();

  void addPlace(BuildContext context) {
    if(title.text.trim().isEmpty){
      return;
    }
    Navigator.of(context).pop(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Place'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: title,
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  addPlace(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ],
          ),
        ));
  }
}
