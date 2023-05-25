import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPresenter extends StatefulWidget {
  const NewsPresenter({Key? key, required this.newsUrl}) : super(key: key);

  final String newsUrl;

  @override
  State<NewsPresenter> createState() => _NewsPresenterState();
}

class _NewsPresenterState extends State<NewsPresenter> {


  bool isLoad = false;
  late WebViewController controller ;

  @override
  void initState() {

    getWebViewController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Center(
          child:  isLoad ? WebViewWidget(
              controller: controller,
          ) : const CircularProgressIndicator(),
        ),
      );

  }

  void getWebViewController() {

    controller =  WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // setState(() {
            //   isLoad = false;
            // });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoad = true;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith(widget.newsUrl)) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse(widget.newsUrl));

  }
}
