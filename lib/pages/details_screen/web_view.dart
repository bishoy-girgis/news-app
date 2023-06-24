
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  static const String routeName="web view";
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    controller =WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate())
    ..loadRequest(Uri.parse(article.url??""));
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/background_pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            article.title ?? "",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
        body: WebViewWidget(controller:controller )
      ),
    );
  }
}
