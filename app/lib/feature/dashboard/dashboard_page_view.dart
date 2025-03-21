import 'package:app/dependencies.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/feature/dashboard/widgets/chips.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/gate_pass/visitor_details/visitor_details_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/feature/webview/webview_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/dashboard/tracker.dart';

import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';

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
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../utils/common_widgets/dialog/add_new_bearer/add_new_bearer.dart';

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
          AppStreamBuilder<Resource<User>>(
              stream: model.userSubject,
              initialData: Resource.none(),
              dataBuilder: (context, userData) {
                return Visibility(
                  visible: userData?.data?.statusId == 0,
                  child: const Tracker(),
                );
              }),
          CommonSizedBox.sizedBox(height: 15, width: 10),
          AppStreamBuilder<Resource<bool>>(
              stream: model.loadAdmissionMenus,
              initialData: Resource.none(),
              dataBuilder: (context, value) {
                if (model.trackerTemp
                    .where((tracker) => tracker['isActive'] == true)
                    .isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title('Tracker'),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      chipsList(
                          context,
                          model.trackerTemp
                              .where((e) => e['isActive'] == true)
                              .map((track) => Chips(
                                    name: track['name'],
                                    image: track['image'],
                                    isSelected: track['isSelected'],
                                  ))
                              .toList(),
                          model)
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
  // title('Child Progreess/Academics'),
          AppStreamBuilder<Resource<bool>>(
              stream: model.loadAdmissionMenus,
              initialData: Resource.none(),
              dataBuilder: (context, value) {
                if (model.progress
                    .where((p) => p['isActive'] == true)
                    .isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(Strings.of(context).child_progress),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      chipsList(
                          context,
                          List.generate(
                            model.progress.length,
                            (i) => Chips(
                                name: model.progress[i]['name'],
                                image: model.progress[i]['image'],
                                isSelected: model.progress[i]['isSelected']),
                          ),
                          model),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          // title('Enquiry & Admission'),
          // CommonSizedBox.sizedBox(height: 10, width: 10),
          // chipsList(
          //     context,
          //     List.generate(
          //       model.enquiryAndAdmissionTemp.length,
          //       (i) => Chips(
          //           name: model.enquiryAndAdmissionTemp[i]['name'],
          //           image: model.enquiryAndAdmissionTemp[i]['image'],
          //           isSelected: model.enquiryAndAdmissionTemp[i]['isSelected']),
          //     ),
          //     model),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          AppStreamBuilder<Resource<bool>>(
              stream: model.loadAdmissionMenus,
              initialData: Resource.none(),
              dataBuilder: (context, value) {
                if (model.feesTemp
                    .where((fees) => fees['isActive'] == true)
                    .isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(Strings.of(context).fees),
                      CommonSizedBox.sizedBox(height: 10, width: 10),
                      chipsList(
                          context,
                          model.feesTemp
                              .where((e) => e['isActive'] == true)
                              .map(
                                (fees) => Chips(
                                  name: fees['name'],
                                  image: fees['image'],
                                  isSelected: fees['isSelected'],
                                ),
                              )
                              .toList(),
                          model)
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
          CommonSizedBox.sizedBox(height: 10, width: 10),
          AppStreamBuilder<Resource<bool>>(
              stream: model.loadAdmissionMenus,
              initialData: Resource.none(),
              dataBuilder: (context, value) {
                if (model.parentServices
                    .where((fees) => fees['isActive'] == true)
                    .isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(Strings.of(context).parent_service),
                      CommonSizedBox.sizedBox(height: 10.h, width: 10.w),
                      chipsList(
                          context,
                          model.parentServices
                              .where((e) => e['isActive'] == true)
                              .map(
                                (services) => Chips(
                                  name: services['name'],
                                  image: services['image'],
                                  isSelected: services['isSelected'],
                                ),
                              )
                              .toList(),
                          model),
                    ],
                  );
                }
                return SizedBox.shrink();
              }),
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
          var receivedRoutePath = model.returnRouteValue(routeName);

          if (receivedRoutePath == RoutePaths.visitorDetailsPage) {
            Navigator.pushNamed(
              context,
              receivedRoutePath,
              arguments: VisitorDetailsPageParams(
                  mobileNo: "+91${model.mobileNo}",
                  studentId: model.dashboardState.selectedStudent?.id),
            );
          } else if (receivedRoutePath == RoutePaths.webview) {
            final String subjectSelectionUrl =
                getIt.get<String>(instanceName: "SubjectSelectionUrl");
            final selectedStudent = model.dashboardState.selectedStudent;

            Navigator.pushNamed(
              context,
              receivedRoutePath,
              arguments: WebviewArguments(
                  enquiryDetailArgs: EnquiryDetailArgs(),
                  paymentsLink:
                      '$subjectSelectionUrl?platform=mobile&authToken=${model.userSubject.value.data?.token}&unique_url_key=${selectedStudent?.urlKey}&date=0101${DateTime.now().year}'),
            );
          } else if (receivedRoutePath == 'Add Bearer') {
            final selectedStudentid = model.dashboardState.selectedStudent?.id;
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AddNewBearer(
                      studentId: selectedStudentid,
                      cancelCallback: () {
                        Navigator.pop(context);
                      },
                      addNewBearerCallback: () {});
                });
          } else {
            Navigator.pushNamed(
              context,
              receivedRoutePath,
              arguments: PaymentArguments(phoneNo: model.mobileNo),
            );
          }
        },
      ),
    );
  }

  Widget title(String titleValue) {
    return CommonText(
      text: titleValue,
      style: AppTypography.subtitle1,
      color: AppColors.textDark,
    );
  }

  Widget bannerPage(List<String> images) {
    return SizedBox(
        height: 220.h,
        width: double.infinity,
        child: CommonPageView(images: images));
  }

  Widget introductionTile(DashboardPageModel model, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 32.h,
                width: 32.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.person,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: BaseWidget(
                  providerBase: dashboardViewModelProvider,
                  builder: (context, model, _) {
                    return AppStreamBuilder<Resource<User>>(
                      stream: model!.userStream,
                      initialData: Resource.none(),
                      dataBuilder: (context, userModel) {
                        return CommonText(
                          text:
                              ' ${Strings.of(context).hello}, ${userModel?.data?.userName ?? ""}',
                          style: AppTypography.subtitle2,
                          maxLines: 2,
                          overflow: TextOverflow
                              .ellipsis, // ✅ Prevents breaking layout
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: AppStreamBuilder<ParentStudentStatusEnum>(
            stream: model.statusSubject.stream,
            initialData: model.statusSubject.value,
            dataBuilder: (context, status) {
              return Visibility(
                visible: status == ParentStudentStatusEnum.admission,
                child:
                    AppStreamBuilder<Resource<GetGuardianStudentDetailsModel>>(
                  stream: model.getGuardianStudentDetailsModel,
                  initialData: Resource.none(),
                  dataBuilder: (context, data) {
                    return data!.status == Status.loading
                        ? const SizedBox(
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : data.data?.data?.students == null
                            ? const SizedBox.shrink()
                            : CustomDropdownButton(
                                singleSelectItemSubject: model.selectedStudent,
                                dropdownName: '',
                                showAstreik: false,
                                width: 0.8.sw,
                                showBorderColor: true,
                                items: data.data?.data?.students!
                                        .map((e) => e.studentDisplayName)
                                        .toList() ??
                                    [],
                                isMutiSelect: false,
                                onMultiSelect: (selectedValues) {
                                  // model.getSelectedStudentid(selectedValues);
                                },
                                onSingleSelect: (selectedValue) {
                                  model.getSelectedStudentid([selectedValue]);
                                },
                              );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
