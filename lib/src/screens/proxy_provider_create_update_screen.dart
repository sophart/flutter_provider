import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Translation Model
class Translations {
  late int _value;

  void updateValue(int value) {
    _value = value;
  }

  String get title => 'You clicked $_value times';
}

//! Proxy Provider Create Update Screen

class ProxyProviderCreateUpdateScreen extends StatefulWidget {
  const ProxyProviderCreateUpdateScreen({Key? key}) : super(key: key);

  static const String route = '/proxyprovidercreateupdate';

  @override
  State<ProxyProviderCreateUpdateScreen> createState() =>
      _ProxyProviderCreateUpdateScreenState();
}

class _ProxyProviderCreateUpdateScreenState
    extends State<ProxyProviderCreateUpdateScreen> {
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
        title: Text('Proxy Provider Update'),
      ),
      body: Center(
        //! The Provider
        child: ProxyProvider0<Translations>(
          create: (_) => Translations(),
          update: (_, translationUpdate) =>
              translationUpdate!..updateValue(counter),
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
