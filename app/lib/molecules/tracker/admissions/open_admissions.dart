import 'package:app/feature/admissions/admissions_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/tracker/admissions/admissions_list.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class OpenAdmissionsPage extends StatelessWidget {
  final AdmissionsViewModel model;
  const OpenAdmissionsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: model.isLoading,
        builder: (context, isLoadingSnapshot) {
          return AppStreamBuilder<Resource<AdmissionListBaseModel>>(
              stream: model.getAdmissionListResponse,
              initialData: Resource.none(),
              dataBuilder: (context, result) {
                if (result?.status == Status.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (result?.status == Status.success) {
                  return AppStreamBuilder<List<AdmissionListDetailModel>>(
                    stream: model.admissions,
                    initialData: model.admissions.value,
                    dataBuilder: (context, data) {
                      return Visibility(
                          visible: data?.isNotEmpty ?? false,
                          replacement:
                              NoDataFoundWidget(title: "No Admissions found"),
                          child: AdmissionsList(
                            admissionList: model.admissions.value,
                            scrollController: model.scrollController,
                            onRefresh: () =>
                                model.fetchAdmissionList(isRefresh: true),
                          ));
                    },
                  );
                }
                if (result?.status == Status.error && model.pageNumber == 1) {
                  return const Center(
                    child: CommonText(text: 'Admissions not found'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        });
  }
}
