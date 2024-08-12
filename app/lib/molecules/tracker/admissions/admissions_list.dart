import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AdmissionsList extends StatelessWidget {
  final List<AdmissionListDetailModel>? admissionList;
  ScrollController scrollController;
  Future<void> Function() onRefresh;

  AdmissionsList({super.key,this.admissionList,required this.scrollController, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: admissionList?.length,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 16, right: 16),
              child: Container(
                height: 128,
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
                    Navigator.pushNamed(context, RoutePaths.admissionsDetails);
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
                          id: admissionList?[index].enquiryId??'',
                          title: admissionList?[index].school??'',
                          subtitle: "${admissionList?[index].grade??''} | ${admissionList?[index].grade??''}",
                          buttontext: admissionList?[index].enquiryType??'',
                          compeletion: admissionList?[index].enquiryStage??'',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonText(
                          text: "School Visit scheduled on 18th July 10:30 AM",
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
      ),
    );
  }
}
