import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';


import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../data_status_widget.dart';

class StaffListPopup extends StatelessWidget {
  const StaffListPopup({super.key, required this.args});

  final StaffArgs args;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
insetPadding: EdgeInsets.zero,
      child: BaseWidget(
        providerBase: staffListViewModelProvider,
        builder: (context, model, _) {
          return Container(

            padding: EdgeInsets.all(8),
            child: AppStreamBuilder<Resource<List<Staff>>>(
                initialData: Resource.none(),
                stream: model!.staffResponse.stream,
                dataBuilder: (context, bearer) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      CommonText(
                              text: "Bus Personnel", style: AppTypography.h6),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon:  Icon(Icons.close))

                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          DataStatusWidget(
                            status: bearer?.status ?? Status.none,
                            loadingWidget: () => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: () => const NoDataFoundWidget(
                                title: "No Staff Found"),
                            successWidget: () => Container(
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible:
                                          bearer?.data?.isNotEmpty ?? false,
                                      child: IconButton(
                                        onPressed: () {
                                          model.pageController.previousPage(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.linear);
                                        },
                                        icon: const Icon(CupertinoIcons.back),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 125.w,
                                      height: 125.h,
                                      child: Visibility(
                                        visible:
                                            bearer?.data?.isNotEmpty ?? false,
                                        replacement: const Center(
                                            child: Text("No Staff Found")),
                                        child: PageView.builder(
                                            itemCount: bearer?.data?.length,
                                            controller: model.pageController,
                                            onPageChanged: (index) {
                                              model.selectIndex.value = index;
                                            },
                                            itemBuilder: (context, index) {
                                              return CommonImageWidget(
                                                  imageHeight: 120.h,
                                                  imageWidth: 120.w,
                                                  imageUrl: "imageUrl",
                                                  clipBehavior: Clip.hardEdge);
                                            }),
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          bearer?.data?.isNotEmpty ?? false,
                                      child: RotatedBox(
                                        quarterTurns: 2,
                                        child: IconButton(
                                          onPressed: () {
                                            model.pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.linear);
                                          },
                                          icon: Icon(CupertinoIcons.back),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (bearer?.data?.isNotEmpty ?? false)
                            AppStreamBuilder<int>(
                                stream: model.selectIndex.stream,
                                initialData: 0,
                                dataBuilder: (context, selectedIndex) {
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                              text:
                                                  "${bearer?.data?[selectedIndex ?? 0].firstName} ${bearer?.data?[selectedIndex ?? 0].lastName}",
                                              style: AppTypography.h5.copyWith(
                                                  fontWeight: FontWeight.w500),
                                            ),

                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            if (bearer
                                                    ?.data?[selectedIndex ?? 0]
                                                    .mobile!=
                                                null) {
                                              UrlLauncher.launchPhone(
                                                  "${bearer?.data?[selectedIndex ?? 0].mobile}");
                                            } else {
                                              model.flutterToastErrorPresenter.show(
                                                  Exception(),
                                                  context,
                                                  "No Phone Number added for this bearer");
                                            }
                                          },
                                          iconSize: 40,
                                          icon: SvgPicture.asset(
                                            AppImages.call,
                                            height: 40.w,
                                            width: 40.w,
                                          ),
                                        )
                                      ]);
                                }),
                          const SizedBox(height: 24),

                        ],
                      )
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}

class StaffArgs {
final int? routeId;

 StaffArgs({this.routeId});
}
