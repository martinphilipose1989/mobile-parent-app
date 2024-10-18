import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/disciplinarySlip/disciplinary_details.dart';
import '../../molecules/disciplinarySlip/disciplinary_slip_list.dart';

class DisplinaryDetailsPageView extends BasePageViewWidget {
  DisplinaryDetailsPageView(
    super.providerBase,
  );

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          CommonSizedBox.sizedBox(height: 10.h, width: double.infinity),
          const DisciplinaryDetails(),
          const DisciplinarySlipList()
        ],
      ),
    );
  }
}
