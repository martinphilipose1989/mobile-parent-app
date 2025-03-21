import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/molecules/enquiries/closed_enquirires_list.dart';
import 'package:app/molecules/enquiries/open_enquiries_list.dart';

import 'package:app/utils/common_widgets/toggle_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesPageView extends BasePageViewWidget<EnquiriesPageModel> {
  EnquiriesPageView(super.providerBase);

  @override
  Widget build(BuildContext context, EnquiriesPageModel model) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        AppStreamBuilder<int>(
            stream: model.selectedTab,
            initialData: model.selectedTab.value,
            dataBuilder: (context, data) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: model.controller,
                    onTap: (index) {
                      model.selectedTab.add(index);
                      if (index == 0) {
                        if (model.enquiries.value.isEmpty) {
                          model.fetchEnquiries();
                        }
                      }
                      if (index == 1) {
                        if (model.admissions.value.isEmpty) {
                          model.closedEnquiryAdmissionList();
                        }
                      }
                    },
                    indicator: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    labelPadding: EdgeInsets.all(8),
                    tabs: [
                      Tab(
                        child: ToggleButton(
                            toggleCondition: model.selectedTab.value == 0,
                            title: Strings.of(context).open_enquiry),
                      ),
                      Tab(
                        child: ToggleButton(
                            toggleCondition: model.selectedTab.value == 1,
                            title: Strings.of(context).closed_enquiries),
                      ),
                    ],
                  ),
                ),
              );
            }),
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: TabBarView(
            controller: model.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OpenedEnquiriesListPage(
                model: model,
              ),
              ClosedEnquiriesListPage(
                model: model,
              ),
            ],
          ),
        )
      ],
    );
  }
}
