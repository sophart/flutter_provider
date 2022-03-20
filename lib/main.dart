import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() => runApp(ProviderDemoApp());

class ProviderDemoApp extends StatelessWidget {
  const ProviderDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: "Lulu 2", breed: "Unknown", age: 5),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("-name: ${context.read<Dog>().name}"),
          BreedAndAge(),
        ],
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("-breed: ${context.read<Dog>().breed}"),
          Age(),
        ],
      ),
    );
  }
}

class Age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("-age: ${context.watch<Dog>().age}"),
        // Text("-age: ${context.select<Dog, int>((Dog dog) => dog.age)}"),
        ElevatedButton(
            onPressed: () => context.read<Dog>().grow(),
            child: Text("Click me"))
      ],
    );
  }
}
