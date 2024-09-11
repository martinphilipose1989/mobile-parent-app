// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CommonWebView extends StatefulWidget {
  final String url;
  final Map<String, String>? headers;
  final void Function(InAppWebViewController controller)? onWebViewCreated;
  final void Function(String url)? onPageStarted;
  final void Function(String url)? onPageFinished;
  final void Function(InAppWebViewController controller, Uri? url)? onLoadError;
  final void Function(InAppWebViewController controller, Uri? url)?
      onLoadHttpError;
  final void Function(InAppWebViewController controller, Uri? url)?
      onUpdateVisitedHistory;

  const CommonWebView({
    super.key,
    required this.url,
    this.headers,
    this.onWebViewCreated,
    this.onPageStarted,
    this.onPageFinished,
    this.onLoadError,
    this.onLoadHttpError,
    this.onUpdateVisitedHistory,
  });

  @override
  CommonWebViewState createState() => CommonWebViewState();
}

class CommonWebViewState extends State<CommonWebView> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(widget.url),
          headers: widget.headers,
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
          if (widget.onWebViewCreated != null) {
            widget.onWebViewCreated!(controller);
          }
        },
        onLoadStart: (controller, url) {
          if (widget.onPageStarted != null) {
            widget.onPageStarted!(url.toString());
          }
        },
        onLoadStop: (controller, url) async {
          if (url != null) {
            if (url.toString().contains('success')) {
              // Handle successful payment
              print("Payment successful!");
              Navigator.pop(context, true);
            } else if (url.toString().contains('failure')) {
              // Handle failed payment
              print("Payment failed!");
              Navigator.pop(context, false);
            }
          }
        },
        onLoadError: (controller, url, code, message) {
          if (widget.onLoadError != null) {
            widget.onLoadError!(controller, url);
          }
        },
        onLoadHttpError: (controller, url, statusCode, description) {
          if (widget.onLoadHttpError != null) {
            widget.onLoadHttpError!(controller, url);
          }
        },
        onUpdateVisitedHistory: (controller, url, isReload) {
          if (widget.onUpdateVisitedHistory != null) {
            widget.onUpdateVisitedHistory!(controller, url);
          }
        },
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          ),
        ),
      ),
    );
  }
}

class WebView extends StatelessWidget {
  final String webViewLink;
  const WebView({
    super.key,
    required this.webViewLink,
  });

  @override
  Widget build(BuildContext context) {
    return CommonWebView(url: webViewLink);
  }
}
