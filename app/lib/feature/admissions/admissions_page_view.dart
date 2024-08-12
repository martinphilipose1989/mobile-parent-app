import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/molecules/tracker/admissions/admissions_list.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsPageView extends BasePageViewWidget<AdmissionsViewModel> {
  AdmissionsPageView(super.providerBase);

  @override
  Widget build(BuildContext context, AdmissionsViewModel model) {
    return StreamBuilder<bool>(
      stream: model.isLoading,
      builder: (context, isLoadingSnapshot) {
        return StreamBuilder<List<AdmissionListDetailModel>>(
          stream: model.admissionList,
          builder: (context, admissionListSnapshot) {
            final isLoading = isLoadingSnapshot.data ?? false;
            final admissions = admissionListSnapshot.data ?? [];

            if (isLoading && admissions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  AdmissionsList(admissionList: admissions,scrollController: model.scrollController,onRefresh: ()=> model.fetchAdmissionList(isRefresh: true),),
                  if(isLoading && model.pageNumber > 1)...[const CircularProgressIndicator(),
                  SizedBox(height: 5.h,)]
                ],
              );
            }
          }
        );
      }
    );
  }
}
