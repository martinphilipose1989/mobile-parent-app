import 'dart:developer';

import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/feature/webview/webview_page.dart';
import 'package:app/feature/webview/webview_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_webview.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class WebviewPageView extends BasePageViewWidget<WebviewModel> {
  final WebviewArguments webviewArguments;
  WebviewPageView(super.providerBase, this.webviewArguments);

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
          onBackButtonPressed: () {
            if (webviewArguments.paymentType == "billdesk") {
              model.cancelPayment(
                  orderId: webviewArguments.orderId!,
                  paymentGateway: webviewArguments.paymentType!);
            }
          },
          onPageFinished: (url) {},
          onLoadStop: (controller, url) {},
          onWebViewCreated: (controller) {
            model.webViewController = controller;
          },
          onLoadHttpError: (cont, uri) {
            log("URI ${uri?.path}");
          },
          onLoadError: (controller, url) {
            log("URL $url");
          },
          onUpdateVisitedHistory: (controller, url) {
            if (url != null) {
              if (url.toString().contains('success')) {
                // Handle successful payment
                model.timer.cancel();
                Navigator.pop(context, true);
                //  url = null;
              } else if (url.toString().contains('failure')) {
                // Handle failed payment
                model.timer.cancel();
                Navigator.pop(context, false);
                //  url = null;
              } else if (url.path.contains("enquiries/mobile_submitted")) {
                navigatorKey.currentState?.pushNamed(
                  RoutePaths.payments,
                  arguments: PaymentArguments(
                    phoneNo: '',
                    module: Modules.admission,
                    enquiryId: model.enquiryDetailArgs?.enquiryId,
                    enquiryNo: model.enquiryDetailArgs?.enquiryNumber,
                    studentName: "${model.enquiryDetailArgs?.studentName} ",
                  ),
                );
              } else if (url.path.contains("subject-selection/completed ")) {
                navigatorKey.currentState?.pushNamedAndRemoveUntil(
                    RoutePaths.tabbar, (route) => false);
              }
            }
          },
        );
      },
    );
  }
}
