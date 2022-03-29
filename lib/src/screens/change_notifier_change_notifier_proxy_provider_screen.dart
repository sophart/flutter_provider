import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Translation Model
class Translations with ChangeNotifier {
  late int _value;

  void updateValue(value) {
    _value = value;
    notifyListeners();
  }

  String get title => 'You clicked $_value times';
}

//! Counter Model

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}

//! ChangeNotifier ChangeNotifierProxyProvider Screen
class ChangeNotifierChangeNotifierProxyProviderScreen extends StatelessWidget {
  const ChangeNotifierChangeNotifierProxyProviderScreen({Key? key})
      : super(key: key);

  static const route = 'changenotifierchangenotifierproxyprovider';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier x2 Proxy'),
      ),
      body: Center(
        //! The Provider
        child: Center(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<Counter>(create: (_) => Counter()),
              ChangeNotifierProxyProvider<Counter, Translations>(
                create: (_) => Translations(),
                update: (_, counter, translations) =>
                    translations!..updateValue(counter.value),
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTranslations(),
                SizedBox(
                  height: 16.0,
                ),
                IncrementButton(),
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
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! The button for increment
    return ElevatedButton(
      onPressed: () => context.read<Counter>().increment(),
      child: Text(
        '+',
      ),
    );
  }
}
