// ignore_for_file: use_super_parameters

import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../molecules/tansport/visitor_details_row.dart';
import '../../utils/common_widgets/data_status_widget.dart';
import 'student_profile_page_viewmodel.dart';

class StudentProfilePageView
    extends BasePageViewWidget<StudentProfilePageViewModel> {
  final int studentId;

  StudentProfilePageView(ProviderBase<StudentProfilePageViewModel> model,
      {required this.studentId})
      : super(model);

  @override
  Widget build(BuildContext context, StudentProfilePageViewModel model) {
    return AppStreamBuilder<Resource<GetStudentProfileData>>(
        initialData: Resource.none(),
        stream: model.studentProfileStream,
        dataBuilder: (context, student) {
          return DataStatusWidget(
            status: student?.status ?? Status.none,
            loadingWidget: () =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: () => Center(
              child: NoDataFoundWidget(
                title: student?.dealSafeAppError?.error.message
                            .contains("internet") ??
                        false
                    ? Strings.of(context).no_internet_connection
                    : Strings.of(context).something_got_wrong,
                subtitle: student?.dealSafeAppError?.error.message
                            .contains("internet") ??
                        false
                    ? Strings.of(context).it_seems_you_re_offline
                    : Strings.of(context).an_unexpected_error,
                onPressed: () {
                  model.getStudentProfile(studentId: studentId);
                },
              ),
            ),
            successWidget: () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StudentImageInfo(student: student?.data),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                      title1: Strings.of(context).bus_service,
                      value1: Strings.of(context).two_way,
                      title2: Strings.of(context).parent_contact_number,
                      value2: student?.data?.guardiansDetails?.isNotEmpty ??
                              false
                          ? "${student?.data?.guardiansDetails?.first.mobileNo}"
                          : "",
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                      title1: Strings.of(context).pickup_location,
                      value1: student?.data?.transportDetails?.route
                                  ?.routeStopMapping?.isNotEmpty ??
                              false
                          ? student?.data?.transportDetails?.route
                                  ?.routeStopMapping?.first.stop?.stopName ??
                              ""
                          : "",
                      title2: Strings.of(context).pickup_time,
                      value2: student?.data?.transportDetails?.route
                                  ?.routeStopMapping?.isNotEmpty ??
                              false
                          ? student?.data?.transportDetails?.route
                                  ?.routeStopMapping?.first.approxTime ??
                              "N/A"
                          : "N/A",
                    ),
                    SizedBox(height: 16.h),
                    VisitorDetailsRow(
                        title1: Strings.of(context).drop_location,
                        value1: student?.data?.transportDetails?.route
                                    ?.routeStopMapping?.isNotEmpty ??
                                false
                            ? student?.data?.transportDetails?.route
                                    ?.routeStopMapping?.first.stop?.stopName ??
                                ""
                            : "",
                        title2: Strings.of(context).drop_time,
                        value2: "N/A"),
                    SizedBox(height: 16.h),
                    const Divider(color: AppColors.dividerColor),
                    SizedBox(height: 16.h),
                    Column(
                      children: [
                CommonText(
                            text: Strings.of(context).bearers, style: AppTypography.subtitle2),
                        SizedBox(height: 16.h),

                        /// bearerList is empty
                        student?.data?.bearersDetails?.isEmpty == true
                            ? const SizedBox.shrink()
                            : BearerList(
                                model: model,
                                bearerList: student?.data?.bearersDetails ?? [],
                                studentId: studentId)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class BearerList extends StatelessWidget {
  const BearerList(
      {super.key,
      required this.bearerList,
      required this.studentId,
      required this.model});

  final List<BearerResponse> bearerList;
  final int studentId;
  final StudentProfilePageViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 1.sw,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bearerList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Display each bearer
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImageWidget(
                      imageUrl: "${bearerList[index].profileImage}",
                      clipBehavior: Clip.hardEdge,
                      imageWidth: 50,
                      imageHeight: 50),
                  const SizedBox(height: 12),
                  Text("${bearerList[index].firstName}")
                ],
              ),
              SizedBox(width: 16.w),
            ],
          );
        },
      ),
    );
  }
}



class StudentImageInfo extends StatelessWidget {
  const StudentImageInfo({super.key, this.student});

  final GetStudentProfileData? student;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 67.h,
          ),
          padding: EdgeInsets.only(
            top: 67.h + 24.h,
            left: 16,
            right: 16,
            bottom: 24,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text:
                          "${student?.firstName ?? ""} ${student?.lastName ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          AppTypography.h6.copyWith(color: AppColors.textDark),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const StudentBasicInfoTile(
                            icon: AppImages.bookIcon, infoType: "AY 2024-2025"),
                        SizedBox(width: 12.w),
                        StudentBasicInfoTile(
                            icon: AppImages.usertagIcon,
                            infoType: "${student?.crtEnrOn}"),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StudentBasicInfoTile(
                            icon: AppImages.schoolIcon,
                            infoType: "${student?.schoolName}"),
                        SizedBox(width: 12.w),
                        StudentBasicInfoTile(
                            icon: AppImages.recordIcon,
                            infoType: "${student?.gradeName}"),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.r),
                boxShadow: [AppColors.boxShadow]),
            child: CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 60.r,
                child: ClipOval(
                    child: CommonImageWidget(
                  imageUrl: "avatarImagePath",
                  fallbackAssetImagePath: AppImages.defaultStudentAvatar,
                  imageHeight: 120.r,
                  imageWidth: 120.r,
                )),
              ),
            ),
          ),
        )
      ],
    );
  }

}

class StudentBasicInfoTile extends StatelessWidget {
  const StudentBasicInfoTile(
      {super.key, required this.icon, required this.infoType});

  final String icon;
  final String infoType;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.textLighterGray,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 2.w),
            Flexible(
              child: CommonText(
                text: infoType,
                style: AppTypography.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
