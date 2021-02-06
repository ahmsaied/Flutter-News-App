import 'package:flutter/material.dart';
import 'package:newsapp/UI/widget/app_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/news-detail';
  final String url, title;

  NewsDetailScreen(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            maxLines: 2,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
