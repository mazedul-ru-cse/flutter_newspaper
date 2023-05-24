import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPresenter extends StatefulWidget {
  const NewsPresenter({Key? key, required this.newsUrl, required this.newsTitle}) : super(key: key);

  final String newsUrl;
  final String newsTitle;

  @override
  State<NewsPresenter> createState() => _NewsPresenterState();
}

class _NewsPresenterState extends State<NewsPresenter> {


  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(widget.newsUrl));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.newsTitle),
      ),
      body: SafeArea(
        child: Center(
          child: WebViewWidget(
              controller: controller,

          ),
        ),
      ),
    );
  }
}
