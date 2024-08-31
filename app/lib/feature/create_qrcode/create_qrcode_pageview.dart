import 'package:app/feature/create_qrcode/create_qrcode_viewmodel.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateQrcodePageView extends BasePageViewWidget<CreateQrcodeViewModel> {
  CreateQrcodePageView({required providerBase}) : super(providerBase);

  @override
  Widget build(BuildContext context, CreateQrcodeViewModel model) {
    return Column(children: [
      CommonElevatedButton(onPressed: () {}, text: "Create Qr code")
    ]);
  }
}
