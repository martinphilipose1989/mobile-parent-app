import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/molecules/enquiries/list.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesPageView extends BasePageViewWidget<EnquiriesPageModel> {
  EnquiriesPageView(super.providerBase);

  @override
  Widget build(BuildContext context, EnquiriesPageModel model) {
    return const Column(
      children: [
        SizedBox(height: 20,),
        ListV(),
      ],
    );
  }
}
