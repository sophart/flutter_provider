import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Translation Model
class Translations {
  final int _value;

  const Translations(this._value);

  String get title => 'You clicked $_value times';
}

//! ProxyProviderUpdate Screen

class ProxyProviderUpdateScreen extends StatefulWidget {
  const ProxyProviderUpdateScreen({Key? key}) : super(key: key);

  static const String route = '/proxyproviderupdate';

  @override
  State<ProxyProviderUpdateScreen> createState() =>
      _ProxyProviderUpdateScreenState();
}

class _ProxyProviderUpdateScreenState extends State<ProxyProviderUpdateScreen> {
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
        title: Text('Proxy Provider Update'),
      ),
      body: Center(
        child: ProxyProvider0<Translations>(
          update: (_, __) => Translations(counter),
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
