import 'package:app/feature/communication/communication_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommunicationPageView extends BasePageViewWidget<CommunicationPageModel> {
  CommunicationPageView(super.providerBase);

  @override
  Widget build(BuildContext context, CommunicationPageModel model) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppStreamBuilder<Resource<GetCommunicationDetails>>(
            stream: model.getCommunicationDetailsStream,
            initialData: Resource.none(),
            dataBuilder: (context, getCommunicationDetailsdata) {
              return getCommunicationDetailsdata!.status == Status.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.ticket),
                                  CommonSizedBox.sizedBox(
                                      height: 10, width: 10),
                                  CommonText(
                                    text: getCommunicationDetailsdata
                                            .data?.data?.ticketNumber ??
                                        '',
                                    style: AppTypography.subtitle1,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutePaths.ratePage,
                                      arguments: model.chatId);
                                },
                                child: AbsorbPointer(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      CommonSizedBox.sizedBox(
                                          height: 10, width: 10),
                                      CommonText(
                                        text: 'Mark As Closed',
                                        style: AppTypography.subtitle2.copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CommonSizedBox.sizedBox(height: 20, width: 10),
                        Expanded(
                            child: ListView(
                          children: [
                            SizedBox(
                              height: 256.h,
                              child: Card(
                                elevation: 2,
                                color: AppColors.listItem,
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(AppImages.avatar2),
                                          const SizedBox(height: 5, width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                text:
                                                    getCommunicationDetailsdata
                                                            .data
                                                            ?.data
                                                            ?.createdBy ??
                                                        "",
                                                style: AppTypography.subtitle2,
                                              ),
                                              const CommonText(
                                                text: '',
                                                style: AppTypography.caption,
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          CommonText(
                                            text: model.formatDateTime(
                                                date:
                                                    getCommunicationDetailsdata
                                                            .data?.data?.date
                                                            .toString() ??
                                                        '',
                                                time:
                                                    getCommunicationDetailsdata
                                                            .data?.data?.time ??
                                                        ''),
                                            style: AppTypography.caption
                                                .copyWith(fontSize: 10),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5, width: 10),
                                      const Divider(),
                                      const SizedBox(height: 5, width: 10),
                                      CommonText(
                                        text: getCommunicationDetailsdata
                                                .data
                                                ?.data
                                                ?.communicationMaster?[0]
                                                .category ??
                                            '',
                                        style: AppTypography.subtitle2,
                                      ),
                                      CommonText(
                                        text: getCommunicationDetailsdata
                                                .data
                                                ?.data
                                                ?.communicationMaster?[0]
                                                .subCategory ??
                                            '',
                                        style: AppTypography.body2,
                                      ),
                                      const SizedBox(height: 5, width: 10),
                                      SizedBox(
                                        width: 300,
                                        height: 20,
                                        child: CommonText(
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          text: getCommunicationDetailsdata
                                                  .data?.data?.communication ??
                                              '',
                                          style: AppTypography.body2,
                                        ),
                                      ),
                                      const SizedBox(height: 5, width: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CommonText(
                                            text: 'Priority :',
                                            style: AppTypography.subtitle2,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.failure
                                                    .withOpacity(0.2)),
                                            child: CommonText(
                                              text: getCommunicationDetailsdata
                                                      .data?.data?.priority ??
                                                  '',
                                              style: AppTypography.subtitle2
                                                  .copyWith(
                                                      color: AppColors.failure),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     CommonText(
                                      //       text: 'ERT :',
                                      //       style: AppTypography.subtitle2,
                                      //     ),
                                      //     CommonText(
                                      //       text: '20 july, 2024',
                                      //       style: AppTypography.body2,
                                      //     ),
                                      //   ],
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CommonText(
                                            text: 'Assigned To :',
                                            style: AppTypography.subtitle2,
                                          ),
                                          CommonText(
                                            text: getCommunicationDetailsdata
                                                    .data?.data?.assignTo ??
                                                '',
                                            style: AppTypography.body2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            CommonSizedBox.sizedBox(height: 10, width: 10),
                            CommonText(
                              text: 'Comments',
                              style: AppTypography.subtitle2.copyWith(),
                            ),
                            Column(
                              children: List.generate(
                                (getCommunicationDetailsdata.data?.data
                                        ?.communicationLogs?.length ??
                                    0),
                                (index) {
                                  return getCommunicationDetailsdata
                                              .data
                                              ?.data
                                              ?.communicationLogs?[index]
                                              .userId ==
                                          model.userId
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: getCommunicationDetailsdata
                                                      .data
                                                      ?.data
                                                      ?.communicationLogs?[
                                                          index]
                                                      .rating !=
                                                  null
                                              ? const SizedBox.shrink()
                                              : Container(
                                                  width: 255.11.w,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primaryContainer,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                      )),
                                                  margin:
                                                      const EdgeInsets.all(8.0),
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CommonText(
                                                          softWrap: true,
                                                          style: AppTypography
                                                              .body2,
                                                          text: getCommunicationDetailsdata
                                                                  .data
                                                                  ?.data
                                                                  ?.communicationLogs?[
                                                                      index]
                                                                  .comment ??
                                                              ""),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      CommonText(
                                                          text: model.formatIsoDateTime(
                                                              getCommunicationDetailsdata
                                                                      .data
                                                                      ?.data
                                                                      ?.communicationLogs?[
                                                                          index]
                                                                      .createdAt
                                                                      .toString() ??
                                                                  ''))
                                                    ],
                                                  ),
                                                ),
                                        )
                                      : Align(
                                          alignment: Alignment.centerLeft,
                                          child: getCommunicationDetailsdata
                                                      .data
                                                      ?.data
                                                      ?.communicationLogs?[
                                                          index]
                                                      .rating !=
                                                  null
                                              ? const SizedBox.shrink()
                                              : Container(
                                                  width: 255.11.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: AppColors
                                                              .closeTile,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          )),
                                                  margin:
                                                      const EdgeInsets.all(8.0),
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CommonText(
                                                          softWrap: true,
                                                          style: AppTypography
                                                              .subtitle2,
                                                          text: getCommunicationDetailsdata
                                                                  .data
                                                                  ?.data
                                                                  ?.communicationLogs?[
                                                                      index]
                                                                  .user ??
                                                              ""),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      CommonText(
                                                          softWrap: true,
                                                          style: AppTypography
                                                              .body2,
                                                          text: getCommunicationDetailsdata
                                                                  .data
                                                                  ?.data
                                                                  ?.communicationLogs?[
                                                                      index]
                                                                  .comment ??
                                                              ""),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      CommonText(
                                                          text: model.formatIsoDateTime(
                                                              getCommunicationDetailsdata
                                                                      .data
                                                                      ?.data
                                                                      ?.communicationLogs?[
                                                                          index]
                                                                      .createdAt
                                                                      .toString() ??
                                                                  ''))
                                                    ],
                                                  ),
                                                ),
                                        );
                                },
                              ),
                            )
                          ],
                        )),
                        SizedBox(
                          child: CommonTextFormField(
                            showAstreik: false,
                            maxLines: 1,
                            controller: model.commentController,
                            labelText: '',
                            hintText: 'Add Comments',
                            keyboardType: TextInputType.multiline,
                            prefix: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: SvgPicture.asset(
                                AppImages.attach,
                              ),
                            ),
                            suffix: InkWell(
                              onTap: () {
                                model.sendCommunication(model.chatId);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Icon(
                                  Icons.send_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            },
          )),
    );
  }
}
