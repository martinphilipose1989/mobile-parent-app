// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/webview/webview_pageview.dart';
import 'package:app/feature/webview/webview_view_model.dart';

import 'package:app/utils/enums/enquiry_enum.dart';
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
    log("URL ${widget.webviewArguments.paymentsLink}");
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.webViewUrl = widget.webviewArguments.paymentsLink;
    model.enquiryDetailArgs = widget.webviewArguments.enquiryDetailArgs;
    if (mounted && widget.webviewArguments.module == null) {
      model.timer = Timer.periodic(
        Duration(seconds: model.timerSeconds),
        (timer) => model.getPaymentStatus(widget.webviewArguments.orderId!),
      );
    }
  }

  @override
  Color scaffoldBackgroundColor() {
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
  final String? orderId;
  final Modules? module;
  final EnquiryDetailArgs? enquiryDetailArgs;

  WebviewArguments(
      {required this.paymentsLink,
      this.orderId,
      this.module,
      this.enquiryDetailArgs});
}
