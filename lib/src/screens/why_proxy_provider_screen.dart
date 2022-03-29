import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Translations Model

class Translations {
  final int _value;

  const Translations(this._value);

  String get title => 'You clicked $_value times';
}

//! Why ProxyProvider Screen

class WhyProxyProviderScreen extends StatefulWidget {
  const WhyProxyProviderScreen({Key? key}) : super(key: key);

  static const String route = '/whyproxyprovider';

  @override
  State<WhyProxyProviderScreen> createState() => _WhyProxyProviderScreenState();
}

//! Why ProxyProviderScreenState
class _WhyProxyProviderScreenState extends State<WhyProxyProviderScreen> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });

    print('Counter:' + counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proxy Provider'),
      ),
      body: Center(
        child: Provider<Translations>(
          create: (_) => Translations(counter),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTranslations(),
                SizedBox(
                  height: 16.0,
                ),
                IncrementButton(increment: increment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//! Show Translation

class ShowTranslations extends StatelessWidget {
  ShowTranslations({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String title = context.watch<Translations>().title;
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

//! The Increment Button

class IncrementButton extends StatelessWidget {
  final VoidCallback increment;
  const IncrementButton({Key? key, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: Text(
        '+',
      ),
    );
  }
}
