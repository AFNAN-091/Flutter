
import 'package:flutter/material.dart';
import 'package:favourite_places/data/dummy_data.dart';
import 'package:favourite_places/add_place.dart';
import 'package:favourite_places/models/place.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Places> placeTitles = placeTitle;

  void addPlace (BuildContext context) async {
   final val = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (ctx) => AddPlaceScreen(),
      ),
    );
    print(val);
    if(val != null){
      setState(() {
        placeTitles.add(Places(title: val));
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              addPlace(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: placeTitles.length,
        itemBuilder: (ctx, index) => ListTile(title: Text(placeTitles[index].title)),
      ),
    );
    
  }
}