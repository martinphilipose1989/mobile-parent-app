import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/create_qrcode/create_qrcode_pageview.dart';
import 'package:app/feature/create_qrcode/create_qrcode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateQrcodePage extends BasePage<CreateQrcodeViewModel> {
  const CreateQrcodePage({super.key});

  @override
  CreateQrcodePageState createState() => CreateQrcodePageState();
}

class CreateQrcodePageState
    extends AppBasePageState<CreateQrcodeViewModel, CreateQrcodePage> {
  @override
  Widget buildView(BuildContext context, CreateQrcodeViewModel model) {
    return CreateQrcodePageView(providerBase: provideBase());
  }

  @override
  ProviderBase<CreateQrcodeViewModel> provideBase() {
    return createQrcodeViewModelProvider;
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
