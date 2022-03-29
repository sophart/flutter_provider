import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Translation Model
class Translations {
  final int _value;
  const Translations(this._value);
  String get title => 'You clicked $_value times';
}

//! ProxyProviderProxyProviderScreen

class ProxyProviderProxyProviderScreen extends StatefulWidget {
  const ProxyProviderProxyProviderScreen({Key? key}) : super(key: key);

  static const String route = '/proxyproviderproxyprovider';

  @override
  State<ProxyProviderProxyProviderScreen> createState() =>
      _ProxyProviderProxyProviderScreenState();
}

class _ProxyProviderProxyProviderScreenState
    extends State<ProxyProviderProxyProviderScreen> {
  //! The Counter State
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
        title: Text('Proxy Provider x2'),
      ),
      body: Center(
        //! The Provider
        child: Center(
          child: MultiProvider(
            providers: [
              ProxyProvider0<int>(update: (_, __) => counter),
              ProxyProvider<int, Translations>(
                  update: (_, value, __) => Translations(value))
            ],
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
    //! Where we access the translation title
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
    //! The button for increment
    return ElevatedButton(
      onPressed: increment,
      child: Text(
        '+',
      ),
    );
  }
}
