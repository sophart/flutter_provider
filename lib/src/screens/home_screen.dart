import 'package:flutter/material.dart';
import 'package:flutter_provider/src/screens/change_notifier_change_notifier_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/change_notifier_provider_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/proxy_provider_create_update_screen.dart';
import 'package:flutter_provider/src/screens/proxy_provider_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/why_proxy_provider_screen.dart';
import 'package:flutter_provider/src/screens/proxy_provider_update_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              //! WhyProxyProviderScreen
              Navigator.pushNamed(context, WhyProxyProviderScreen.route);
            },
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Why ProxyProvider?')),
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              //! ProxyProviderUpdateScreen
              Navigator.pushNamed(context, ProxyProviderUpdateScreen.route);
            },
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text('ProxyProvider Update')),
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              //! ProxyProviderCreateUpdateScreen
              Navigator.pushNamed(
                  context, ProxyProviderCreateUpdateScreen.route);
            },
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'ProxyProvider Create \/ Update',
                  textAlign: TextAlign.center,
                )),
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              //! Proxy Provider / Proxy Provider Screen
              Navigator.pushNamed(
                  context, ProxyProviderProxyProviderScreen.route);
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ProxyProvider \/ ProxyProvider',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              //! ChangeNotifier / ChangeNotifierProxyProvider
              Navigator.pushNamed(context,
                  ChangeNotifierChangeNotifierProxyProviderScreen.route);
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ChangeNotifier \/ ChangeNotifierProxyProvider',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              //! ChangeNotifierProvider / ProxyProvider
              Navigator.pushNamed(
                  context, ChangeNotifierProxyProviderScreen.route);
            },
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text('ChangeNotifierProvider \/ ProxyProvider')),
          ),
        ],
      ),
    ));
  }
}
