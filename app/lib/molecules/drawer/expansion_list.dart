import 'package:app/dependencies.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/payments/payments_pages/payments.dart';
import 'package:app/feature/tabbar/tabbar_class.dart';

import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/feature/webview/webview_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CustomExpansionList extends StatelessWidget {
  final List<DrawerItems>? nameList;
  final VoidCallback? onTap;
  final String title;

  const CustomExpansionList({
    super.key,
    this.nameList,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TabbarViewModel>(
      builder: (BuildContext context, TabbarViewModel? model, Widget? child) {
        return ExpansionTile(
          showTrailingIcon: true,
          title: Text(
            title,
            style: AppTypography.h6,
          ),
          children: nameList!
              .map((e) => Visibility(
                    visible: e.isActive ?? true,
                    child: AppStreamBuilder(
                        stream: model!.selectedIndexStream,
                        initialData: Resource.none(),
                        dataBuilder: (context, data) {
                          return ListTile(
                            leading: SizedBox(
                                width: 50.w,
                                child: SvgPicture.asset(e.icon ?? "")),
                            selected: model.selectedMenu.value == e,
                            // selected: isSelected,
                            selectedTileColor: AppColors.listItem,
                            title: Text(e.menu ?? ""),
                            onTap: () async {
                              model.selectedMenu.value = e;

                              if (e.key == "payments") {
                                Navigator.pushNamed(
                                  navigatorKey.currentContext!,
                                  RoutePaths.payments,
                                  arguments: PaymentArguments(
                                      phoneNo:
                                          "+91${model.userSubject.value.phoneNumber}"),
                                );
                              } else if (e.key == "subject_selection") {
                                final String subjectSelectionUrl =
                                    getIt.get<String>(
                                        instanceName: "SubjectSelectionUrl");
                                final selectedStudent =
                                    ProviderScope.containerOf(context,
                                            listen: false)
                                        .read(dashboardViewModelProvider)
                                        .dashboardState
                                        .selectedStudent;

                                Navigator.pushNamed(
                                  context,
                                  RoutePaths.webview,
                                  arguments: WebviewArguments(
                                      enquiryDetailArgs: EnquiryDetailArgs(),
                                      paymentsLink:
                                          '$subjectSelectionUrl?platform=mobile&authToken=${model.userSubject.value.token}&unique_url_key=${selectedStudent?.urlKey}&date=0101${DateTime.now().year}'),
                                );
                              } else {
                                Navigator.pushNamed(context, e.route!);
                              }
                            },
                          );
                        }),
                  ))
              .toList(),
        );
      },
      providerBase: tabbarViewModelProvider,
    );
  }
}
