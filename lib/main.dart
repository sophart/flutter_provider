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
      body: Consumer<Dog>(
        builder: (BuildContext context, Dog dog, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("-name: ${dog.name}"), child!, BreedAndAge()],
          );
        },
        child: Text("Hello World"),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Dog>(
        builder: ((_, Dog dog, __) {
          return Column(
            children: [
              Text("-breed: ${dog.breed}"),
              Age(),
            ],
          );
        }),
      ),
    );
  }
}

class Age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, Dog dog, __) {
      return Column(
        children: [
          Text("-age: ${dog.age}"),
          ElevatedButton(onPressed: () => dog.grow(), child: Text("Click me"))
        ],
      );
    });
  }
}
