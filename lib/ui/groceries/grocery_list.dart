import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/ui/groceries/grocery_form.dart';
import '/models/grocery.dart';
import '../../data/mock_grocery_repository.dart';


class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {


  Future<void> onCreate() async {
    // TODO-4 - Navigate to the form screen using the Navigator push 
    final Grocery? newGrocery = await Navigator.push<Grocery>(
    context,
    MaterialPageRoute(builder: (context) => const NewItem()),
  );
  if (newGrocery != null) {
    _addGrocery(newGrocery);
  }

  }

      void _addGrocery(Grocery newGrocery){
    setState(() {
      dummyGroceryItems.add(newGrocery);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {

       // TODO-1 - Display groceries with an Item builder and  LIst Tile
      
      content = ListView.builder(
      itemCount: dummyGroceryItems.length,
      itemBuilder: (context, index) {
      final grocery = dummyGroceryItems[index];
      return GroceryTile(grocery: grocery);
  },
);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: onCreate,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
      // TODO-2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        color: grocery.category.color,
      ),
      title: Text(grocery.name),
      subtitle: Text(
        'Quantity: ${grocery.quantity} | Category: ${grocery.category.name}',
      ),
    );
  }
    
  }

