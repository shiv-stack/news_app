// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article_View extends StatefulWidget {
  const Article_View({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _Article_ViewState createState() => _Article_ViewState();
}

class _Article_ViewState extends State<Article_View> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Shivam News ',
          style: TextStyle(
              color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
