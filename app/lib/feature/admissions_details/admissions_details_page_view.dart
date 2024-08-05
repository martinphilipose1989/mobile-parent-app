import 'package:app/feature/admissions_details/admissions_details_view_model.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_stepper/common_stepper_page.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsDetailsPageView
    extends BasePageViewWidget<AdmissionsDetailsViewModel> {
  AdmissionsDetailsPageView(super.providerBase);

  actionOnMenu(int index, BuildContext context) {
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
  Widget build(BuildContext context, AdmissionsDetailsViewModel model) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                CommonSizedBox.sizedBox(height: 10, width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonText(
                      text: 'Admission Journey',
                      style: AppTypography.subtitle1,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, RoutePaths.registrationDetails),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.eyeIcon,
                            color: Theme.of(context).primaryColor,
                          ),
                          CommonSizedBox.sizedBox(height: 10, width: 10),
                          CommonText(
                            text: 'View Details',
                            style: AppTypography.subtitle1.copyWith(
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                CommonSizedBox.sizedBox(height: 10, width: 10),
                CommonStepperPage(
                    stepperList: List.generate(
                      model.stepperData.length,
                      (index) {
                        return Step(
                            subtitle: model.stepperData[index]['subtitle'] == ''
                                ? null
                                : CommonText(
                                    text: model.stepperData[index]['subtitle']),
                            title: CommonText(
                              text: model.stepperData[index]['name'],
                            ),
                            state: model.activeStep.value > index
                                ? StepState.complete
                                : StepState.indexed,
                            isActive: model.activeStep.value >= index,
                            content: const SizedBox.shrink());
                      },
                    ),
                    activeStep: model.activeStep.value)
              ],
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
                          onTap: (index) {
                            actionOnMenu(index, context);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                          menuData: model.menuData,
                        )
                      : SizedBox.fromSize());
            })
      ],
    );
  }
}
