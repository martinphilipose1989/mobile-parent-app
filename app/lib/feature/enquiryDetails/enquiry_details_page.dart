import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_view.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../base/app_base_page.dart';

class EnquiriesDetailsPage extends BasePage<EnquiriesDetailsPageModel> {
  const EnquiriesDetailsPage({super.key});

  @override
  EnquiriesDetailsPageState createState() => EnquiriesDetailsPageState();
}

class EnquiriesDetailsPageState
    extends AppBasePageState<EnquiriesDetailsPageModel, EnquiriesDetailsPage>
    with SingleTickerProviderStateMixin {
  @override
  ProviderBase<EnquiriesDetailsPageModel> provideBase() {
    return enquiriesDetailsPageModelProvider;
  }

  @override
  void onModelReady(EnquiriesDetailsPageModel model) {
    model.tabController = TabController(length: 2, vsync: this);
  }

  @override
  PreferredSizeWidget? buildAppbar(EnquiriesDetailsPageModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      notShowNotificationAndUserBatch: false,
      appbarTitle: 'Enquiries Details',
      showBackButton: true,
    );
  }

  @override
  Widget buildView(BuildContext context, EnquiriesDetailsPageModel model) {
    return EnquiriesDetailsPageView(provideBase());
  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  @override
  Widget? buildFloatingButton(EnquiriesDetailsPageModel model) {
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, data) {
        return data!
            ? Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        if (model.showWidget.value == 0) {
                          model.editRegistrationDetails.add(false);
                        } else {
                          ProviderScope.containerOf(context)
                              .read(commonChipListProvider)
                              .highlightIndex
                              .add(ProviderScope.containerOf(context)
                                      .read(commonChipListProvider)
                                      .highlightIndex
                                      .value -
                                  1);
                          model.showWidget.add(model.showWidget.value - 1);
                        }
                      },
                      text: model.showWidget.value == 0 ? 'Cancel' : 'Go Back',
                      borderColor: Theme.of(context).primaryColor,
                      borderWidth: 1,
                      width: 171.w,
                      height: 40.h,
                      textColor: Theme.of(context).primaryColor,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        if (model.showWidget.value <= 6) {
                          ProviderScope.containerOf(context)
                              .read(commonChipListProvider)
                              .highlightIndex
                              .add(ProviderScope.containerOf(context)
                                      .read(commonChipListProvider)
                                      .highlightIndex
                                      .value +
                                  1);
                          model.showWidget.add(model.showWidget.value + 1);
                        }
                      },
                      text: 'Next',
                      backgroundColor: AppColors.accent,
                      width: 171.w,
                      height: 40.h,
                      textColor: AppColors.accentOn,
                    ),
                  ],
                ))
            : AppStreamBuilder<bool>(
                stream: model.showMenuOnFloatingButton,
                initialData: model.showMenuOnFloatingButton.value,
                dataBuilder: (context, data) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                        height: 56.h,
                        width: 130.w,
                        child: CommonElevatedButton(
                          onPressed: () {
                            if (model.showMenuOnFloatingButton.value) {
                              model.showMenuOnFloatingButton.add(false);
                            } else {
                              model.showMenuOnFloatingButton.add(true);
                            }
                          },
                          text: data! ? 'Close' : 'Action',
                          icon: data ? Icons.close : Icons.add,
                          borderRadius: BorderRadius.circular(10),
                          textColor: Theme.of(context).colorScheme.onTertiary,
                          backgroundColor: AppColors.accent,
                          textStyle: AppTypography.subtitle2.copyWith(
                              color: Theme.of(context).colorScheme.onTertiary),
                        )),
                  );
                },
              );
      },
    );
  }
}