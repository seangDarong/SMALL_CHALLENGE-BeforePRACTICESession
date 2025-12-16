import 'package:flutter/material.dart';
import 'ui/groceries/grocery_list.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 17, 117, 50),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 14, 82, 41),
      ),
      home: const GroceryList(),
    );
  }
}





