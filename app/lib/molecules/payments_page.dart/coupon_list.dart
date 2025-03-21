import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/payments_page/payments_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/data_status_widget.dart';
import 'package:app/utils/common_widgets/dotted_border.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:collection/collection.dart';

class CouponListArgs {
  final GetPendingFeesFeeModel getPendingFeesFeeModel;
  final List<FetchCouponsDataModel>? appliedCouponList;

  CouponListArgs(
      {required this.getPendingFeesFeeModel,
      this.appliedCouponList = const []});
}

class CouponList extends StatelessWidget {
  final CouponListArgs couponListArgs;
  const CouponList({super.key, required this.couponListArgs});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PaymentsPageModel>(
        onModelReady: (model) {
          model.getCouponsList(
              academicYrsId: couponListArgs
                  .getPendingFeesFeeModel.academicYearId
                  .toString(),
              feeSubTypeIds:
                  couponListArgs.getPendingFeesFeeModel.feeSubTypeId.toString(),
              feeCategoryIds:
                  couponListArgs.getPendingFeesFeeModel.feeCategoryIds ?? "",
              feeSubCategoryIds:
                  couponListArgs.getPendingFeesFeeModel.feeSubCategoryIds ?? "",
              feeTypeIds:
                  couponListArgs.getPendingFeesFeeModel.feeTypeId.toString(),
              studentId: couponListArgs.getPendingFeesFeeModel.studentId == null
                  ? couponListArgs.getPendingFeesFeeModel.enquiryId
                  : couponListArgs.getPendingFeesFeeModel.studentId.toString());
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar:  CommonAppBar(//Strings.of(context)
              appbarTitle: Strings.of(context).apply_couppon,
              notShowNotificationAndUserBatch: true,
              showBackButton: true,
            ),
            body: Column(
              children: [
                // AppStreamBuilder<bool>(
                //   stream: model!.displayCustomCoupon,
                //   initialData: model.displayCustomCoupon.value,
                //   dataBuilder: (context, data) {
                //     return Padding(
                //       padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               CommonText(
                //                 text: data!
                //                     ? 'Enter Your Coupon Below'
                //                     : 'Alerady Have A Coupon?',
                //                 style: AppTypography.subtitle2,
                //               ),
                //               InkWell(
                //                 onTap: () {
                //                   data
                //                       ? model.displayCustomCoupon.add(false)
                //                       : model.displayCustomCoupon.add(true);
                //                 },
                //                 child: data
                //                     ? const Icon(Icons.close)
                //                     : CommonText(
                //                         text: 'Apply Now',
                //                         style: AppTypography.subtitle2.copyWith(
                //                             color: Theme.of(context)
                //                                 .colorScheme
                //                                 .primary),
                //                       ),
                //               ),
                //             ],
                //           ),
                //           model.displayCustomCoupon.value
                //               ? Column(
                //                   children: [
                //                     CommonSizedBox.sizedBox(
                //                         height: 20, width: 10),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Flexible(
                //                           fit: FlexFit.loose,
                //                           child: CommonTextFormField(
                //                             showAstreik: false,
                //                             readOnly: false,
                //                             labelText: 'Apply Coupon',
                //                             controller: model.couponController,
                //                           ),
                //                         ),
                //                         CommonSizedBox.sizedBox(
                //                             height: 20, width: 20),
                //                         SizedBox(
                //                             height: 40.h,
                //                             width: 140.w,
                //                             child: CommonElevatedButton(
                //                               onPressed: () {},
                //                               text: 'Apply',
                //                               textColor: Theme.of(context)
                //                                   .scaffoldBackgroundColor,
                //                               backgroundColor: Theme.of(context)
                //                                   .primaryColor,
                //                             ))
                //                       ],
                //                     ),
                //                   ],
                //                 )
                //               : const SizedBox.shrink(),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                Expanded(
                    child: AppStreamBuilder<Resource<FetchCouponsListModel>>(
                  stream: model!.fetchCouponsListModel,
                  initialData: Resource.none(),
                  dataBuilder: (context, data) {
                    return DataStatusWidget(
                      status: data?.status ?? Status.none,
                      loadingWidget: () =>
                          const Center(child: CircularProgressIndicator()),
                      successWidget: () => Visibility(
                          visible: data?.data?.data?.isNotEmpty ?? false,
                          replacement:
                              NoDataFoundWidget(title: Strings.of(context).no_coupons_found),
                          child: ListView.builder(
                              itemCount: data?.data?.data?.length,
                              itemBuilder: (context, index) {
                                FetchCouponsDataModel? fetchCouponsDataModel =
                                    data?.data?.data?[index];
                                return AppStreamBuilder<bool>(
                                  stream: model.showMore,
                                  initialData: model.showMore.value,
                                  dataBuilder: (context, data) {
                                    return SizedBox(
                                      height:
                                          data! && index == model.couponShowMore
                                              ? 270.h
                                              : 200.h,
                                      width: 350.w,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    // Image.asset(
                                                    //     AppImages.sbiBankIcon),
                                                    // CommonSizedBox.sizedBox(
                                                    //     height: 10, width: 10),
                                                    CustomPaint(
                                                        painter: DashRectPainter(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            strokeWidth: 1.5,
                                                            gap: 3),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 40.h,
                                                          width: 145.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary
                                                                  .withOpacity(
                                                                      0.2)),
                                                          child: CommonText(
                                                            text: fetchCouponsDataModel
                                                                    ?.couponCode ??
                                                                "",
                                                            style: AppTypography
                                                                .subtitle2
                                                                .copyWith(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary),
                                                          ),
                                                        )),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        final selectedCoupon = couponListArgs
                                                            .appliedCouponList
                                                            ?.firstWhereOrNull(
                                                                (coupon) =>
                                                                    coupon.id ==
                                                                    fetchCouponsDataModel
                                                                        ?.id);

                                                        if (selectedCoupon !=
                                                            null) {
                                                          if (selectedCoupon
                                                                  .maxCount ==
                                                              selectedCoupon
                                                                  .appliedCouponCount) {
                                                            model
                                                                .flutterToastErrorPresenter
                                                                .show(
                                                              Exception(),
                                                              context,
                                                              Strings.of(context).the_max_applied_coupon,
                                                            );
                                                          } else {
                                                            Navigator.pop(
                                                                context,
                                                                fetchCouponsDataModel);
                                                          }
                                                        } else {
                                                          Navigator.pop(context,
                                                              fetchCouponsDataModel);
                                                        }
                                                      },
                                                      child: CommonText(
                                                        text: Strings.of(context).apply,
                                                        style: AppTypography
                                                            .subtitle2
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                CommonSizedBox.sizedBox(
                                                    height: 10, width: 10),
                                                CommonText(
                                                  text: fetchCouponsDataModel
                                                          ?.description ??
                                                      '',
                                                  style:
                                                      AppTypography.subtitle2,
                                                ),
                                                CommonSizedBox.sizedBox(
                                                    height: 10, width: 10),
                                                const Divider(),
                                                CommonSizedBox.sizedBox(
                                                    height: 10, width: 10),
                                                CommonText(
                                                  text: fetchCouponsDataModel
                                                          ?.termsAndConditions ??
                                                      '',
                                                  style: AppTypography.caption,
                                                  overflow: data &&
                                                          index ==
                                                              model
                                                                  .couponShowMore
                                                      ? TextOverflow.visible
                                                      : TextOverflow.ellipsis,
                                                ),
                                                CommonSizedBox.sizedBox(
                                                    height: 10, width: 10),
                                                InkWell(
                                                  onTap: () {
                                                    model.couponShowMore =
                                                        index;
                                                    model.showMore.add(!data);
                                                  },
                                                  child: CommonText(
                                                    text: data &&
                                                            index ==
                                                                model
                                                                    .couponShowMore
                                                        ? Strings.of(context).show_less
                                                        : Strings.of(context).show_more,
                                                    style:
                                                        AppTypography.caption,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              })),
                      errorWidget: () => NoDataFoundWidget(
                          title: "${data?.dealSafeAppError?.error.message}"),
                    );
                  },
                ))
              ],
            ),
          );
        },
        providerBase: paymentsPageModelProvider);
  }
}
