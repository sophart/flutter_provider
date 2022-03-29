import 'package:flutter/material.dart';
import 'package:flutter_provider/src/screens/change_notifier_change_notifier_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/change_notifier_provider_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/home_screen.dart';
import 'package:flutter_provider/src/screens/proxy_provider_create_update_screen.dart';
import 'package:flutter_provider/src/screens/proxy_provider_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/why_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/proxy_provider_update_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
      routes: {
        WhyProxyProviderScreen.route: (_) => WhyProxyProviderScreen(),
        ProxyProviderUpdateScreen.route: (_) => ProxyProviderUpdateScreen(),
        ProxyProviderCreateUpdateScreen.route: (_) =>
            ProxyProviderCreateUpdateScreen(),
        ProxyProviderProxyProviderScreen.route: (_) =>
            ProxyProviderProxyProviderScreen(),
        ChangeNotifierChangeNotifierProxyProviderScreen.route: (_) =>
            ChangeNotifierChangeNotifierProxyProviderScreen(),
        ChangeNotifierProxyProviderScreen.route: (_) =>
            ChangeNotifierProxyProviderScreen(),
      },
    );
  }
}
