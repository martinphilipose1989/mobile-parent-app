
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/disciplinarySlip/disciplinary_details.dart';
import '../../molecules/disciplinarySlip/disciplinary_slip_list.dart';

class DisplinaryDetailsPageView extends BasePageViewWidget {
  DisplinaryDetailsPageView(super.providerBase, );

  @override
  Widget build(BuildContext context, BasePageViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CommonSizedBox.sizedBox(height: 20, width: 10),
          const DisciplinaryDetails(),
         SizedBox(height:MediaQuery.of(context).size.height*0.55,
             child: const DisciplinarySlipList()
         )
        ],
      ),
    );
  }
}
