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
      // Fix the NotFound exception by using builder instead
      // the cause of the problem is bacause we try to read
      // the provider immediately
      builder: (context, _) {
        return Scaffold(
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
        );
      },
    );
  }
}
