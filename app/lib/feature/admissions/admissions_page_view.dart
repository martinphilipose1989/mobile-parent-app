import 'package:app/molecules/tracker/admissions/admissions_list.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsPageView extends BasePageViewWidget {
  AdmissionsPageView(super.providerBase);

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Column(
      children: [
        CommonSizedBox.sizedBox(height: 20, width: 10),
        const AdmissionsList(),
      ],
    );
  }
}
