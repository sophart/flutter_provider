import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Foo.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Foo>(
      create: (_) => Foo(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${context.watch<Foo>().value}",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<Foo>().switchValue(),
                child:
                    Text(context.watch<Foo>().value == 'Foo' ? 'Bar' : 'Foo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
