// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AfaqHome extends StatelessWidget {
  AfaqHome({Key? key, required this.url}) : super(key: key);

  String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class AfaqMorshhen extends StatelessWidget {
  AfaqMorshhen({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class AfaqTargets extends StatelessWidget {
  AfaqTargets({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class AfaqMorshhenNews extends StatelessWidget {
  AfaqMorshhenNews({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class AfaqContactUs extends StatelessWidget {
  AfaqContactUs({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
