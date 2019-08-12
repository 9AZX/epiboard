import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Office365 extends StatefulWidget {
  const Office365({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Office365State createState() => _Office365State();
}

class _Office365State extends State<Office365> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (url == "https://intra.epitech.eu/") {
        flutterWebViewPlugin.close();
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    flutterWebViewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://intra.epitech.eu/login",
      appBar: new AppBar(
        title: const Text('Connect to office 365'),
      ),
      withLocalStorage: true,
      clearCache: true,
      clearCookies: true,
      initialChild: Container(
        color: Colors.blueGrey,
        child: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
