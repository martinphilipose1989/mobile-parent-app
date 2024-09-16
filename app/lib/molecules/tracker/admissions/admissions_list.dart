import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AdmissionsList extends StatelessWidget {
  final List<AdmissionListDetailModel>? admissionList;
  ScrollController scrollController;
  Future<void> Function() onRefresh;

  AdmissionsList({super.key,this.admissionList,required this.scrollController, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: admissionList?.length,
        shrinkWrap: false,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.listItem,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 2,
                        color: AppColors.disableNeutral80,
                        offset: Offset(0, 1))
                  ]),
              child: GestureDetector(
                onTap: () {
                  EnquiryDetailArgs admissionDetail = EnquiryDetailArgs(
                    enquiryId: admissionList?[index].enquiryId,
                    enquiryNumber: admissionList?[index].enquiryNumber,
                    currentStage: admissionList?[index].currentStage,
                    enquiryType: admissionList?[index].enquiryType,
                    school: admissionList?[index].school,
                    studentName: admissionList?[index].studentName,
                    academicYear: admissionList?[index].academicYear,
                    board: admissionList?[index].board,
                    grade: admissionList?[index].grade,
                    formCompletionPercentage: admissionList?[index].formCompletionPercentage,
                    isFrom: 'admission',
                    status: admissionList?[index].status 
                  );
                  Navigator.pushNamed(context, RoutePaths.admissionsDetails,arguments: admissionDetail);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListItem(
                        image: AppImages.personIcon,
                        name: admissionList?[index].studentName??'',
                        year: admissionList?[index].academicYear??'',
                        id: admissionList?[index].enquiryNumber??'',
                        title: admissionList?[index].school??'',
                        subtitle: "${admissionList?[index].grade??''} | ${admissionList?[index].board??''}",
                        buttontext: admissionList?[index].currentStage??'',
                        compeletion: "${(admissionList?[index].formCompletionPercentage??0).toString()}% Completed",
                        status: admissionList?[index].status??'',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonText(
                        text: admissionList?[index].comment??'',
                        style: AppTypography.caption.copyWith(
                            color: AppColors.primary, letterSpacing: 0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
