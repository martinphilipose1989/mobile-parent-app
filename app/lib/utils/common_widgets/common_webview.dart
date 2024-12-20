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
  final void Function(InAppWebViewController controller, Uri? url)? onLoadStop;
  final void Function(InAppWebViewController controller, Uri? url)?
      onLoadHttpError;
  final void Function(InAppWebViewController controller, Uri? url)?
      onUpdateVisitedHistory;
  final VoidCallback? onBackButtonPressed;

  const CommonWebView(
      {super.key,
      required this.url,
      this.headers,
      this.onWebViewCreated,
      this.onLoadStop,
      this.onPageStarted,
      this.onPageFinished,
      this.onLoadError,
      this.onLoadHttpError,
      this.onUpdateVisitedHistory,
      this.onBackButtonPressed});

  @override
  CommonWebViewState createState() => CommonWebViewState();
}

class CommonWebViewState extends State<CommonWebView> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            bool canGoBack = await _webViewController.canGoBack();
            if (canGoBack) {
              _webViewController.goBack();
            } else {
              if (context.mounted) {
                Navigator.pop(context);
                widget.onBackButtonPressed?.call();
              }
            }
          },
        ),
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
        onLoadStop: (controller, url) {
          if (widget.onLoadStop != null) {
            widget.onLoadStop!(controller, url);
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
