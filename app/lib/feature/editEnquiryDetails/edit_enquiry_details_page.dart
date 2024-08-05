import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page_model.dart';
import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EditEnquiriesDetailsPage extends BasePage<EditEnquiriesDetailsPageModel> {
  const EditEnquiriesDetailsPage({super.key});

  @override
  EditEnquiriesDetailsPageState createState() =>
      EditEnquiriesDetailsPageState();
}

class EditEnquiriesDetailsPageState extends AppBasePageState<
    EditEnquiriesDetailsPageModel,
    EditEnquiriesDetailsPage> with SingleTickerProviderStateMixin {
  @override
  ProviderBase<EditEnquiriesDetailsPageModel> provideBase() {
    return editEnquiriesDetailsPageModelProvider;
  }

  @override
  void onModelReady(EditEnquiriesDetailsPageModel model) {
    model.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget buildView(BuildContext context, EditEnquiriesDetailsPageModel model) {
    return EditEnquiriesDetailsPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }
}
