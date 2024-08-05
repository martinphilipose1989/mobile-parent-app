import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/bank_details_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/contact_info_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/enquiry_and_student_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/medical_details_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/parent_info_editing.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/bank_details.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/contact_info.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/enquiry_and%20_student_details.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/medical_details.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/parent_info.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/upload_docs.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_page.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class RegistrationsDetailsPageView
    extends BasePageViewWidget<RegistrationsDetailsViewModel> {
  RegistrationsDetailsPageView(super.providerBase);

  actionOnMenu(
      int index, BuildContext context, RegistrationsDetailsViewModel model) {
    switch (index) {
      case 0:
        return Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage);
      case 1:
        return Navigator.of(context).pushNamed(RoutePaths.payments);
      case 2:
        return UrlLauncher.launchPhone('+1234567890', context: context);
      case 3:
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 4:
        model.editRegistrationDetails.add(true);
        model.showMenuOnFloatingButton.add(false);
        return null;
      case 5:
        return Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage);
      case 6:
        return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, RegistrationsDetailsViewModel model) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
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
                compeletion: '25% Completed',
              ),
              CommonSizedBox.sizedBox(height: 20, width: 10),
              SizedBox(
                height: 40,
                child: CommonChipListPage(
                  chipValues: List.generate(
                    model.registrationDetails.length,
                    (index) => CommonChips(
                      isSelected: model.registrationDetails[index]
                          ['isSelected'],
                      name: model.registrationDetails[index]['name'],
                    ),
                  ),
                  onCallBack: (index) {
                    if (model.editRegistrationDetails.value) {
                    } else {
                      model.showWidget.add(index);
                    }
                  },
                ),
              ),
              CommonSizedBox.sizedBox(height: 20, width: 10),
              AppStreamBuilder<bool>(
                  stream: model.editRegistrationDetails,
                  initialData: model.editRegistrationDetails.value,
                  dataBuilder: (context, editRegistrationDetailsData) {
                    return AppStreamBuilder<int>(
                      stream: model.showWidget,
                      initialData: model.showWidget.value,
                      dataBuilder: (context, data) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 300,
                          width: double.infinity,
                          child: SingleChildScrollView(
                              child: editRegistrationDetailsData!
                                  ? registrationsEditingWidgetAsPerIndex(
                                      model.showWidget.value, model)
                                  : registrationsWidgetAsPerIndex(
                                      model.showWidget.value)),
                        );
                      },
                    );
                  })
            ],
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
                          height: 453.h,
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

  Widget registrationsEditingWidgetAsPerIndex(
      int index, RegistrationsDetailsViewModel model) {
    switch (index) {
      case 0:
        return const EnquiryAndStudentEditing();
      case 1:
        return ParentInfoEditing(model: model);
      case 2:
        return ContactInfoEditing(
          model: model,
        );
      case 3:
        return MedicalDetailsEditing(
          model: model,
        );
      case 4:
        return BankDetailsEditing(
          model: model,
        );
      case 5:
        return const UploadDocs();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget registrationsWidgetAsPerIndex(int index) {
    switch (index) {
      case 0:
        return const EnquiryAndStudentDetails();
      case 1:
        return const ParentInfo();
      case 2:
        return const ContactInfo();
      case 3:
        return const MedicalDetails();
      case 4:
        return const BankDetails();
      case 5:
        return const UploadDocs();
      default:
        return const SizedBox.shrink();
    }
  }
}
