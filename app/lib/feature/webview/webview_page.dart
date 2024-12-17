// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/webview/webview_pageview.dart';
import 'package:app/feature/webview/webview_view_model.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class WebviewPage extends BasePage<WebviewModel> {
  final WebviewArguments webviewArguments;

  const WebviewPage({super.key, required this.webviewArguments});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends AppBasePageState<WebviewModel, WebviewPage> {
  @override
  void onModelReady(WebviewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.webViewUrl = widget.webviewArguments.paymentsLink;
    if (mounted) {
      model.timer = Timer.periodic(
        Duration(seconds: model.timerSeconds),
        (timer) => model.getPaymentStatus(widget.webviewArguments.orderId),
      );
    }
  }

  @override
  Color scaffoldBackgroundColor() {
    // TODO: implement scaffoldBackgroundColor
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, WebviewModel model) {
    // TODO: implement buildView
    return WebviewPageView(provideBase());
  }

  @override
  ProviderBase<WebviewModel> provideBase() {
    return webViewProvider;
  }
}

class WebviewArguments {
  final String paymentsLink;
  final String orderId;

  WebviewArguments(this.paymentsLink, this.orderId);
}
