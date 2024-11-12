import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/dashboard/widgets/chips.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/dashboard/tracker.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_pageview.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/enums/parent_student_status_enum.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DashboardPageView extends BasePageViewWidget<DashboardPageModel> {
  DashboardPageView(super.providerBase);

  @override
  Widget build(BuildContext context, DashboardPageModel model) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          CommonSizedBox.sizedBox(height: 10, width: 10),
          introductionTile(model, context),
          CommonSizedBox.sizedBox(height: 15, width: 10),
          bannerPage(model.images),
          CommonSizedBox.sizedBox(height: 15, width: 10),
          const Tracker(),
          CommonSizedBox.sizedBox(height: 15, width: 10),
          title('Tracker'),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          chipsList(
              context,
              List.generate(
                model.trackerTemp.length,
                (i) => Chips(
                    name: model.trackerTemp[i]['name'],
                    image: model.trackerTemp[i]['image'],
                    isSelected: model.trackerTemp[i]['isSelected']),
              ),
              model),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          title('Enquiry & Admission'),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          chipsList(
              context,
              List.generate(
                model.enquiryAndAdmissionTemp.length,
                (i) => Chips(
                    name: model.enquiryAndAdmissionTemp[i]['name'],
                    image: model.enquiryAndAdmissionTemp[i]['image'],
                    isSelected: model.enquiryAndAdmissionTemp[i]['isSelected']),
              ),
              model),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          title('Fees'),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          chipsList(
              context,
              List.generate(
                model.feesTemp.length,
                (i) => Chips(
                    name: model.feesTemp[i]['name'],
                    image: model.feesTemp[i]['image'],
                    isSelected: model.feesTemp[i]['isSelected']),
              ),
              model),
          CommonSizedBox.sizedBox(height: 10, width: 10),
        ],
      ),
    );
  }

  Widget chipsList(
      BuildContext context, List<Chips> chipValues, DashboardPageModel model) {
    return SizedBox(
      height: 120.h,
      child: HighlightList(
        chipValues: chipValues,
        onCallBack: (routeName) {
          Navigator.pushNamed(context, RoutePaths.studentProfilePage,
              arguments: 10);
          return;

          var receivedRoutePath = model.returnRouteValue(routeName);
          Navigator.pushNamed(context, receivedRoutePath,
              arguments: PaymentArguments(
                phoneNo: model.mobileNo,
              ));
        },
      ),
    );
  }

  Widget title(String titleValue) {
    return CommonText(
      text: titleValue,
      style: AppTypography.subtitle1,
    );
  }

  Widget bannerPage(List<String> images) {
    return SizedBox(
        height: 220.h, width: 379.06.w, child: CommonPageView(images: images));
  }

  Widget introductionTile(DashboardPageModel model, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [
          Container(
              height: 32.h,
              width: 32.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2)),
              child: Icon(
                Icons.person,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              )),
          const SizedBox(
            width: 10,
          ),
          BaseWidget(
            providerBase: userViewModelProvider,
            builder: (context, model, _) {
              return AppStreamBuilder<Resource<User>>(
                stream: model!.userStream,
                initialData: Resource.none(),
                dataBuilder: (context, userModel) {
                  return CommonText(
                    text: 'Hello, ${userModel?.data?.userName ?? ''}',
                    style: AppTypography.subtitle2,
                  );
                },
              );
            },
          )
        ]),
        SizedBox(
          child: AppStreamBuilder<ParentStudentStatusEnum>(
              stream: model.statusSubject.stream,
              initialData: model.statusSubject.value,
              dataBuilder: (context, status) {
                return Visibility(
                  visible: status == ParentStudentStatusEnum.admission,
                  child: AppStreamBuilder<
                      Resource<GetGuardianStudentDetailsModel>>(
                    stream: model.getGuardianStudentDetailsModel,
                    initialData: Resource.none(),
                    dataBuilder: (context, data) {
                      return data!.status == Status.loading
                          ? const SizedBox(
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : data.data?.data?.students == null
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  height: 60.h,
                                  width: 128.w,
                                  child: CustomDropdownButton(
                                    dropdownName: '',
                                    width: 300,
                                    showAstreik: false,
                                    showBorderColor: true,
                                    displayZerothIndex: true,
                                    items: data.data?.data?.students!
                                            .map((e) => e.studentDisplayName)
                                            .toList() ??
                                        [],
                                    isMutiSelect: true,
                                    onMultiSelect: (selectedValues) {
                                      model
                                          .getSelectedStudentid(selectedValues);
                                    },
                                    onSingleSelect: (selectedValue) {},
                                  ),
                                );
                    },
                  ),
                );
              }),
        )
      ],
    );
  }
}
