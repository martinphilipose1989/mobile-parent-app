import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/molecules/enquiries/edit_enquiry_details.dart';
import 'package:app/molecules/enquiries/enquiries_details_view.dart';
import 'package:app/molecules/enquiries/upload_documents.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesDetailsPageView
    extends BasePageViewWidget<EnquiriesDetailsPageModel> {
  EnquiriesDetailsPageView(super.providerBase);

  actionOnMenu(
      int index, BuildContext context, EnquiriesDetailsPageModel model) {
    switch (index) {
      case 0:
        return Navigator.of(context)
            .pushNamed(RoutePaths.registrationDetails, arguments: "enquiry");
      case 1:
        return UrlLauncher.launchPhone('+1234567890', context: context);
      case 2:
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 3:
        model.editRegistrationDetails.add(true);
        model.showMenuOnFloatingButton.add(false);
        return null;
      case 4:
        return Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage);
      case 5:
        return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, EnquiriesDetailsPageModel model) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListItem(
                        image: AppImages.personIcon,
                        name: "Khevna Shah ",
                        year: "(AY 2024-2025)",
                        id: "ENADMS#4402",
                        title: "Vibgyor Kids & High - Malad West",
                        subtitle: "Grade V | CBSE",
                        buttontext: "School Visit",
                        compeletion: '',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CommonText(
                          text: "Admission Journey",
                          style: AppTypography.body1,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.remove_red_eye_outlined,
                                color: AppColors.primary),
                            const SizedBox(
                              width: 5,
                            ),
                            CommonText(
                              text: "View Details",
                              style: AppTypography.subtitle2.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTabPage(
                          firstTabTitle: "Enquiry Details",
                          secondTabTitle: "Upload Documents",
                          tabController: model.tabController,
                          selectedValue: model.selectedValue,
                        ),
                        AppStreamBuilder<bool>(
                          stream: model.editRegistrationDetails,
                          initialData: model.editRegistrationDetails.value,
                          dataBuilder: (context, editRegistrationDetailsData) {
                            return AppStreamBuilder<int>(
                              stream: model.selectedValue,
                              initialData: model.selectedValue.value,
                              dataBuilder: (context, data) {
                                return data == 1
                                    ? const UploadDocuments()
                                    : model.editRegistrationDetails.value
                                        ? SingleChildScrollView(
                                            child: SizedBox(
                                              child: EditEnquiriesDetailsWidget(
                                                model: model,
                                              ),
                                            ),
                                          )
                                        : const EnquiriesDetailsViewWidget();
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return data!
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                    )
                  : SizedBox.fromSize();
            }),
        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return Positioned(
                  right: 20,
                  bottom: 100,
                  child: data!
                      ? Menu(
                          height: 395.h,
                          menuData: model.menuData,
                          onTap: (index) {
                            actionOnMenu(index, context, model);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                        )
                      : SizedBox.fromSize());
            })
      ],
    );
  }
}
