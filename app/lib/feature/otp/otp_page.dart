import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/otp/otp_page_view.dart';
import 'package:app/feature/otp/otp_view_model.dart';
import 'package:app/molecules/otp/otp_pin_bottomsheet.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class OtpPage extends BasePage<OtpPageModel> {
  const OtpPage({super.key});

  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends AppBasePageState<OtpPageModel, OtpPage>
    with TickerProviderStateMixin {
  @override
  ProviderBase<OtpPageModel> provideBase() {
    return otpPageModelProvider;
  }

  @override
  void onModelReady(OtpPageModel model) {
    model.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget buildView(BuildContext context, OtpPageModel model) {
    return OtpPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Theme.of(context).colorScheme.primaryContainer;
  }

  @override
  Widget? buildBottomSheet(OtpPageModel model) {
    return AppStreamBuilder<bool>(
      stream: model.openBottomSheet,
      initialData: model.openBottomSheet.value,
      dataBuilder: (context, data) {
        return data == false
            ? const SizedBox(
                height: 0,
              )
            : OtpPinBottomsheet(
                otpPageModel: model,
              );
      },
    );
  }
}
