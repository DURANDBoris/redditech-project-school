import 'package:flutter/material.dart';
import 'package:redditech/views/HomePage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:redditech/data/userData.dart'
    as userData;

class pageLogin extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<pageLogin> {
  String clientId =
      "2Qis_kII0ipaz3T0nd-GpQ";

  String _webView() {
    String scope =
        "account,identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread";

    return 'https://www.reddit.com/api/v1/authorize.compact?client_id=$clientId&response_type=code&state=test&redirect_uri=http://localhost&duration=permanent&scope=$scope';
  }

  void _postCode(code) async {
    final id = base64.encode(
        utf8.encode(
            "2Qis_kII0ipaz3T0nd-GpQ:"));
    final response = await Dio().post(
        'https://www.reddit.com/api/v1/access_token',
        options: Options(
            headers: <String, dynamic>{
              'authorization':
                  'Basic $id',
              'content-type':
                  "application/x-www-form-urlencoded"
            }),
        data:
            'grant_type=authorization_code&code=$code&redirect_uri=http://localhost');
    userData.accessToken =
        response.data['access_token'];
    userData.refreshToken =
        response.data['refresh_token'];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: _webView(),
        javascriptMode:
            JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller = controller;
        },
        navigationDelegate:
            (NavigationRequest
                request) {
          if (request.url.startsWith(
              "http://localhost")) {
            var pos = request.url
                .lastIndexOf('=');
            var code = (pos != -1)
                ? request.url.substring(
                    pos + 1,
                    request.url.length -
                        2)
                : request.url;
            _postCode(code);
            return NavigationDecision
                .prevent;
          }
          return NavigationDecision
              .navigate;
        },
      ),
    );
  }
}
