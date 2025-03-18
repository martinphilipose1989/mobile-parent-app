import 'dart:convert';

import 'dart:typed_data';

import 'package:app/feature/gate_pass/visitor_details/visitor_details_page.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_viewmodel.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/gate_managment/visitor_details/visitor_details_row.dart';
import 'package:app/molecules/gate_managment/visitor_details/visitor_details_shimmer.dart';
import 'package:app/molecules/gate_managment/visitor_details/visitor_info_card.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_primary_elevated_button.dart';
import 'package:app/utils/constants/constants.dart';
import 'package:app/utils/data_status_widget.dart';
import 'package:app/utils/dateformate.dart';
import 'package:app/utils/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class VisitorDetailsPageView
    extends BasePageViewWidget<VisitorDetailsViewModel> {
  final VisitorDetailsPageParams? params;

  // ignore: use_super_parameters
  VisitorDetailsPageView(
    ProviderBase<VisitorDetailsViewModel> model, {
    required this.params,
  }) : super(model);

  @override
  Widget build(BuildContext context, VisitorDetailsViewModel model) {
    return AppStreamBuilder<Resource<VisitorDataModel>>(
        stream: model.visitorDetails,
        initialData: Resource.none(),
        onData: (data) {},
        dataBuilder: (context, snapShotData) {
          return DataStatusWidget(
              status: snapShotData?.status ?? Status.none,
              loadingWidget: () => const VisitorDetailsPageShimmer(),
              errorWidget: () => Center(
                    child: NoDataFoundWidget(
                      title: snapShotData?.dealSafeAppError?.error.message
                                  .contains("internet") ??
                              false
                          ? "No Internet Connection"
                          : snapShotData?.dealSafeAppError?.error.message ??
                              "Something Went Wrong",
                      subtitle: snapShotData?.dealSafeAppError?.error.message
                                  .contains("internet") ??
                              false
                          ? "It seems you're offline. Please check your internet connection and try again."
                          : (snapShotData?.dealSafeAppError?.error.message
                                      .isNotEmpty ??
                                  false)
                              ? ''
                              : "An unexpected error occurred. Please try again later or contact support if the issue persists.",
                      onPressed: () {
                        model.getVisitorDetails(
                          mobile: params?.mobileNo,
                          studentId: params?.studentId,
                        );
                      },
                    ),
                  ),
              successWidget: () {
                VisitorDataModel? visitor = snapShotData?.data;

                // default NoDataFoundWidget
                if (visitor == null) return const NoDataFoundWidget();

                Uint8List qrImageBytes = Uint8List(0);
                if (visitor.qrCode?.isNotEmpty == true) {
                  // Remove the data URL prefix if it exists
                  String cleanBase64 =
                      visitor.qrCode.toString().split(',').last;

                  // Decode the base64 string
                  qrImageBytes = base64Decode(cleanBase64);
                }

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: REdgeInsets.all(
                            16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VisitorInfoCard(
                                visitorName:
                                    "${visitor.visitorName ?? ''}  (#${visitor.gatePassNumber ?? "N/A"})",
                                issuedOn: visitor.issuedDate ?? '',
                                // qrImagePath: AppImages.qrImage,
                                qrImagePath: qrImageBytes,
                                avatarImagePath:
                                    visitor.visitorProfileImageImageUrl ?? '',
                              ),
                              SizedBox(height: 16.h),
                              VisitorDetailsRow(
                                title1: "Student Name",
                                value1: visitor.visitorName ?? '',
                                title2: "Contact Number",
                                value2: visitor.visitorMobile ?? '',
                              ),
                              SizedBox(height: 16.h),
                              VisitorDetailsRow(
                                title1: "Email ID",
                                value1: visitor.visitorEmail ?? '',
                                title2: "Purpose Of Visit",
                                value2: visitor.purposeOfVisitName ?? '',
                              ),
                              SizedBox(height: 16.h),
                              VisitorDetailsRow(
                                title1: "Date of Visit",
                                value1: visitor.dateOfVisit
                                        ?.replaceAll('-', '/') ??
                                    "${visitor.vistDate?.replaceAll('-', '/') ?? ''} ",
                                title2: "Time",
                                value2:
                                    visitor.outgoingTime?.isNotEmpty ?? false
                                        ? visitor.outgoingTime
                                                ?.formatTimeWithoutIntl() ??
                                            ""
                                        : visitor.incomingTime
                                                ?.formatTimeWithoutIntl() ??
                                            '',
                              ),
                              SizedBox(height: 16.h),
                              VisitorDetailsRow(
                                title1: "Point of Contact",
                                value1: visitor.pointOfContact ?? "",
                                title2: "Guest Count",
                                value2: '${visitor.guestCount ?? ""}',
                              ),
                              SizedBox(height: 16.h),
                              VisitorDetailsRow(
                                title1: "Coming From",
                                value1: visitor.comingFrom ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(
                          bottom: 16, right: 16, left: 16, top: 16),
                      child: CommonPrimaryElevatedButton(
                          title: "Close",
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            BOTTOM_NAV_INDEX = 0;
                            Navigator.pushNamedAndRemoveUntil(
                                context, RoutePaths.tabbar, (route) => false);
                          }),
                    )
                  ],
                );
              });
        });
  }
}
