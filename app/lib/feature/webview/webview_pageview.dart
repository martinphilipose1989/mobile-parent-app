import 'package:app/feature/webview/webview_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/common_widgets/common_webview.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class WebviewPageView extends BasePageViewWidget<WebviewModel> {
  WebviewPageView(super.providerBase);

  @override
  Widget build(BuildContext context, WebviewModel model) {
    return AppStreamBuilder<Resource<GetPaymentStatusModel>>(
      stream: model.getPaymentStatusModel,
      initialData: Resource.none(),
      onData: (value) {
        if (value.data?.data?.toLowerCase() == "success") {
          // Handle successful payment
          model.timer.cancel();
          Navigator.pop(context, true);
        } else if (value.data?.data?.toLowerCase() == "failure") {
          // Handle failed payment
          model.timer.cancel();
          Navigator.pop(context, false);
        }
      },
      dataBuilder: (context, data) {
        return CommonWebView(
          url: model.webViewUrl,
          onPageFinished: (url) {},
          onWebViewCreated: (controller) {},
          onUpdateVisitedHistory: (controller, url) {},
        );
      },
    );
  }
}
