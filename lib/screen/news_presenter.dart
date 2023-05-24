import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPresenter extends StatefulWidget {
  const NewsPresenter({Key? key, required this.newsUrl}) : super(key: key);

  final String newsUrl;

  @override
  State<NewsPresenter> createState() => _NewsPresenterState();
}

class _NewsPresenterState extends State<NewsPresenter> {


  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(widget.newsUrl));
    return  SafeArea(
        child: Center(
          child: WebViewWidget(
              controller: controller,

          ),
        ),
      );

  }
}
