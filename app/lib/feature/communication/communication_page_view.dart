import 'package:app/feature/communication/communication_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
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
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.ticket),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      const CommonText(
                        text: '#TKT1234',
                        style: AppTypography.subtitle1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      CommonText(
                        text: 'Mark As Closed',
                        style: AppTypography.subtitle2.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.avatar2),
                              const SizedBox(height: 5, width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: 'Rohan Thale',
                                    style: AppTypography.subtitle2,
                                  ),
                                  CommonText(
                                    text: 'Father of Aman thale',
                                    style: AppTypography.caption,
                                  )
                                ],
                              ),
                              const Spacer(),
                              CommonText(
                                text: '11:10 Am - 12 July, 2024',
                                style: AppTypography.caption
                                    .copyWith(fontSize: 10),
                              )
                            ],
                          ),
                          const SizedBox(height: 5, width: 10),
                          const Divider(),
                          const SizedBox(height: 5, width: 10),
                          const CommonText(
                            text: 'Academic Related',
                            style: AppTypography.subtitle2,
                          ),
                          const CommonText(
                            text: 'Request for progress Report',
                            style: AppTypography.body2,
                          ),
                          const SizedBox(height: 5, width: 10),
                          const SizedBox(
                            width: 300,
                            height: 20,
                            child: CommonText(
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              text:
                                  'Lorem ipsum dolor sit amet consectetur. Turpis suscipit duis diam mattis. Sem habitasse quam tellus magna euismod at scelerisque rutrum ornare.',
                              style: AppTypography.body2,
                            ),
                          ),
                          const SizedBox(height: 5, width: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CommonText(
                                text: 'Priority :',
                                style: AppTypography.subtitle2,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.failure.withOpacity(0.2)),
                                child: CommonText(
                                  text: 'High',
                                  style: AppTypography.subtitle2
                                      .copyWith(color: AppColors.failure),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: 'ERT :',
                                style: AppTypography.subtitle2,
                              ),
                              CommonText(
                                text: '20 july, 2024',
                                style: AppTypography.body2,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: 'Assigned To :',
                                style: AppTypography.subtitle2,
                              ),
                              CommonText(
                                text: 'Vipul patel',
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
                )
              ],
            )),
            SizedBox(
              child: CommonTextFormField(
                showAstreik: false,
                maxLines: 1,
                labelText: '',
                hintText: 'Add Comments',
                keyboardType: TextInputType.multiline,
                suffix: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: SvgPicture.asset(
                    AppImages.attach,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
