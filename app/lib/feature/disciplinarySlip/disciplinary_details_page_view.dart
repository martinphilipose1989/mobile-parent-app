import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/disciplinarySlip/disciplinary_details.dart';
import '../../molecules/disciplinarySlip/disciplinary_slip_list.dart';
import 'disciplinary_details_view_model.dart';

class DisplinaryDetailsPageView extends BasePageViewWidget<DisplinaryDetailsViewModel> {
  DisplinaryDetailsPageView(
    super.providerBase,
  );

  @override
  Widget build(BuildContext context, DisplinaryDetailsViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          SizedBox(height: 10.h, ),
          const DisciplinaryDetails(),
          const DisciplinarySlipList()
        ],
      ),
    );
  }
}
