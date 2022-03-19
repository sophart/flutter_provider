import 'dart:ffi';

import 'package:flutter/material.dart';

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
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Homepage"),
            CounterA(counter: counter, increment: increment),
            Middle(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;

  const CounterA({Key? key, required this.counter, required this.increment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$counter'),
        ElevatedButton(onPressed: increment, child: Text("Click Me"))
      ],
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;

  const Middle({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CounterB(counter: counter),
      SizedBox(
        width: 6,
      ),
      Sibling(),
    ]);
  }
}

class CounterB extends StatelessWidget {
  final int counter;

  const CounterB({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Sibling");
  }
}
