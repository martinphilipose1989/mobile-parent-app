import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_model.dart';
import 'package:app/feature/cancelSchoolTour/cancel_school_tour_page_view.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class CancelSchoolTourPage extends BasePage<CancelSchoolTourPageModel> {
  final EnquiryDetailArgs enquiryDetailArgs;
  final SchoolVisitDetail schoolVisitDetail;
  const CancelSchoolTourPage({super.key,required this.enquiryDetailArgs,required this.schoolVisitDetail});

  @override
  CancelSchoolTourPageState createState() => CancelSchoolTourPageState();
}

class CancelSchoolTourPageState
    extends AppBasePageState<CancelSchoolTourPageModel, CancelSchoolTourPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<CancelSchoolTourPageModel> provideBase() {
    return cancelSchoolTourPageModelProvider;
  }

  @override
  void onModelReady(CancelSchoolTourPageModel model) {}

  @override
  PreferredSizeWidget? buildAppbar(CancelSchoolTourPageModel model) {
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Cancel School Visit',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, CancelSchoolTourPageModel model) {
    return CancelSchoolTourPageView(provideBase(),widget.schoolVisitDetail,widget.enquiryDetailArgs);
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget? buildBottomNavigationBar(CancelSchoolTourPageModel model) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: CommonElevatedButton(
          onPressed: () {
            if(model.formKey.currentState!.validate()){
              CommonPopups().showConfirm(
                context,
                'Confirm Cancellation Details',
                'Please Confirm the below details',
                'Date: ${model.dateFormat.format(DateTime.parse((widget.schoolVisitDetail.schoolVisitDate??DateTime.now().toString())))}',
                'Selected Time: ${model.schoolVisitDetailData?.slot??''}',
                'Comments: ${model.controller.text}',
                (shouldRoute) {
                  model.cacnelSchoolVisit(enquiryID: widget.enquiryDetailArgs.enquiryId??'',schoolVisitID: widget.schoolVisitDetail.id??'');
                },
              );
            }
          },
          text: 'Cancel Tour',
          backgroundColor: AppColors.accent,
          width: MediaQuery.of(context).size.width,
          height: 40.h,
          textColor: AppColors.accentOn,
        ),
      ),
    );
    
  }
}
