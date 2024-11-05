import 'dart:developer';

import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

// ignore: must_be_immutable
class ListV extends StatelessWidget {
  final List<BehaviorSubject<EnquiryListDetailModel>>? enquiries;
  ScrollController scrollController;
  final bool isClosed;
  Future<void> Function() onRefresh;

  ListV(
      {super.key,
      required this.enquiries,
      required this.scrollController,
      required this.onRefresh,
      this.isClosed = false});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await onRefresh.call(),
      child: ListView.builder(
        controller: scrollController,
        itemCount: enquiries?.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemBuilder: (context, index) {
          return AppStreamBuilder<EnquiryListDetailModel>(
              stream: enquiries![index],
              initialData: enquiries![index].value,
              dataBuilder: (context, data) {
                return GestureDetector(
                  onTap: () {
                    log("message ${data?.status}");
                    log("message ${data?.currentStage}");

                    EnquiryDetailArgs enquiryDetail = EnquiryDetailArgs(
                        enquiryId: data?.enquiryId,
                        enquiryNumber: data?.enquiryNumber,
                        currentStage: data?.currentStage,
                        enquiryType: data?.enquiryType,
                        studentName: data?.studentName,
                        academicYear: data?.academicYear,
                        school: data?.school,
                        board: data?.board,
                        grade: data?.grade,
                        stream: data?.stream,
                        shift: data?.shift,
                        isFrom: 'enquiry',
                        status: data?.status);
                    Navigator.pushNamed(
                        context, RoutePaths.enquiriesAdmissionsJourneyPage,
                        arguments: {
                          "enquiryDetailArgs": enquiryDetail,
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isClosed
                              ? AppColors.roseWhite
                              : AppColors.listItem,
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
                                name: data?.studentName ?? '',
                                year: data?.academicYear ?? '',
                                id: data?.enquiryNumber ?? '',
                                title: data?.school ?? '',
                                subtitle:
                                    '${data?.grade ?? ''} | ${data?.board ?? ''} | ${data?.shift} | Stream-${data?.stream}',
                                buttontext: data?.currentStage ?? '',
                                status: data?.status ?? '',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CommonText(
                                text: data?.comment ?? '',
                                style: AppTypography.overline.copyWith(
                                    color: AppColors.primary, letterSpacing: 0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
