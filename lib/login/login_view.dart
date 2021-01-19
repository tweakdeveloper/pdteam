import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => WebView(
        initialUrl: 'https://aaregional.arcos-inc.com',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String url) async {
          print(url);
          if (url.endsWith('/Default.aspx')) {
            final cookieManager = WebviewCookieManager();
            final cookies = await cookieManager
                .getCookies('https://aaregional.arcos-inc.com');
            for (var cookie in cookies) {
              if (cookie.name == 'ROSTERAPPS.AUTH') {
                print(cookie.value);
              }
            }
          }
        },
      ),
    );
  }
}
