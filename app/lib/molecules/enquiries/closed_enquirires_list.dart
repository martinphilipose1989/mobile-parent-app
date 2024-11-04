import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/enquiries/list.dart';
import 'package:app/molecules/tracker/admissions/admissions_list.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ClosedEnquiriesListPage extends StatelessWidget {
  final EnquiriesPageModel model;
  const ClosedEnquiriesListPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
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
                return AdmissionsList(
                  admissionList: model.admissions.value,
                  scrollController: model.scrollController,
                  onRefresh: () =>
                      model.closedEnquiryAdmissionList(isRefresh: true),
                );
              },
            );
          }
          if (result?.status == Status.error &&
              model.closedEnquiryPageNumber == 1) {
            return const Center(
              child: CommonText(text: 'Enquiries not found'),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
