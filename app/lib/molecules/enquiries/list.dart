import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/string_extension.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ListV extends StatelessWidget {
  final List<EnquiryListDetailModel>? enquiries;
  ScrollController scrollController;
  EnquiriesPageModel model;

  ListV({super.key, required this.enquiries, required this.scrollController, required this.model,});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => model.fetchEnquiries(isRefresh: true),
      child: ListView.builder(
        controller: scrollController,
        itemCount: enquiries?.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              EnquiryDetailArgs enquiryDetail = EnquiryDetailArgs(
                enquiryId: enquiries?[index].enquiryId,
                enquiryNumber: enquiries?[index].enquiryNumber,
                currentStage: enquiries?[index].currentStage,
                enquiryType: enquiries?[index].enquiryType,
                studentName: enquiries?[index].studentName,
                academicYear: enquiries?[index].academicYear,
                school: enquiries?[index].school,
                board: enquiries?[index].board,
                grade: enquiries?[index].grade,
                
              );
              Navigator.pushNamed(
                  context, RoutePaths.enquiriesAdmissionsJourneyPage,
                  arguments: {
                    "enquiryDetailArgs": enquiryDetail,
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 16, right: 16),
              child: Container(
                height: (!enquiries![index].schoolVisitDate.isEmptyOrNull() && !enquiries![index].schoolVisitTime.isEmptyOrNull())? 128 : 115,
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListItem(
                            image: AppImages.personIcon,
                            name: enquiries?[index].studentName??'',
                            year: enquiries?[index].academicYear??'',
                            id: enquiries?[index].enquiryNumber??'',
                            title: enquiries?[index].school??'',
                            subtitle: '${enquiries?[index].grade??''} | ${enquiries?[index].board??''}',
                            buttontext: enquiries?[index].currentStage??''),
                        if(!enquiries![index].schoolVisitDate.isEmptyOrNull() && !enquiries![index].schoolVisitTime.isEmptyOrNull())...[
                          const SizedBox(
                            height: 10,
                          ),
                          CommonText(
                            text: "School Visit scheduled on ${enquiries?[index].schoolVisitDate??""} ${enquiries?[index].schoolVisitTime??''}",
                            style: AppTypography.overline.copyWith(
                              color: AppColors.primary, letterSpacing: 0),
                          )
                        ]
                      ],
                    ),
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
