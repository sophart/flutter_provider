import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() => runApp(ProviderDemoApp());

class ProviderDemoApp extends StatelessWidget {
  const ProviderDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dog dog = Dog(name: "Lulu", breed: "unknow");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dog.addListener(() => print("${dog.age} from change notifier."));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dog.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("-name: ${dog.name}"),
          BreedAndAge(dog: dog),
        ],
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("-breed: ${dog.breed}"),
          Age(dog: dog),
        ],
      ),
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("-age: ${dog.age}"),
        ElevatedButton(onPressed: () => dog.grow(), child: Text("Click me"))
      ],
    );
  }
}
