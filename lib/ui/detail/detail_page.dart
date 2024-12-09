import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_region_search_app/data/model/location.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.item);

  Location item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          mediaPlaybackRequiresUserGesture: true,
          javaScriptEnabled: true,
          userAgent:
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        ),
        initialUrlRequest: URLRequest(
          url: WebUri(item.link),
        ),
      ),
    );
  }
}