import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/baby.dart';

import 'models/dog.dart';

void main() => runApp(ProviderDemoApp());

class ProviderDemoApp extends StatelessWidget {
  const ProviderDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(
            name: "Lulu 2",
            breed: "Unknown",
            age: 5,
          ),
        ),
        FutureProvider<int>(
            create: (context) {
              final int dogAge = context.read<Dog>().age;
              final babies = Baby(age: dogAge).getBabies();
              return babies;
            },
            initialData: 0),
        StreamProvider<String>(
            create: (context) {
              final int dogAge = context.read<Dog>().age;
              final babies = Baby(age: dogAge * 2);

              return babies.bark();
            },
            initialData: "Bark 0 time")
      ],
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
        Text("-number of baby: ${context.watch<int>()}"),
        Text("-bark: ${context.watch<String>()}"),
        // Text("-age: ${context.select<Dog, int>((Dog dog) => dog.age)}"),
        ElevatedButton(
            onPressed: () => context.read<Dog>().grow(),
            child: Text("Click me"))
      ],
    );
  }
}
