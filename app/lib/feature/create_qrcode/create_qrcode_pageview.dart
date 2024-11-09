import 'dart:typed_data';

import 'package:app/feature/create_qrcode/create_qrcode_viewmodel.dart';
import 'package:app/feature/gate_pass/create_edit_gate_pass/create_edit_gate_pass_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateQrcodePageView extends BasePageViewWidget<CreateQrcodeViewModel> {
  CreateQrcodePageView({required providerBase}) : super(providerBase);

  @override
  Widget build(BuildContext context, CreateQrcodeViewModel model) {
    return Align(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppStreamBuilder<Resource<CreateQrcodeResponseModel>>(
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            return Visibility(
              visible: data?.status != Status.loading,
              replacement: const Center(child: CircularProgressIndicator()),
              child: CommonElevatedButton(
                  onPressed: () {
                    // // TODO: GATE PASS : HANDLE NAVIGATION AND VIEW. CONFIRM AND REMOVE unwanted GatePassArguments
                    // navigatorKey.currentState?.pushNamed(
                    //     RoutePaths.createEditGatePassPage,
                    //     arguments: GatePassArguments(
                    //         id: "",
                    //         type: "",
                    //         parentData: null));
                    //
                    // return;
                    model.requestGatePass();
                  },
                  text: "Create Qr code"),
            );
          },
          stream: model.response.stream,
        ),
        SizedBox(height: 16.h),
        AppStreamBuilder<Resource<Uint8List>>(
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            return Visibility(
              visible: data?.status == Status.success,
              replacement: const SizedBox(),
              child: Image.memory(
                data?.data as Uint8List,
                fit: BoxFit.cover,
                height: 0.4.sw,
                width: 0.4.sw,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                      Icons.error); // Display an error icon or widget
                },
              ),
            );
          },
          stream: model.qrCodeStream,
        ),
      ]),
    );
  }
}
