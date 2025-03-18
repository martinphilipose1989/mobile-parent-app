import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/enquiries/list.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/no_data_found_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localisation/strings.dart';
import 'package:rxdart/rxdart.dart';

class OpenedEnquiriesListPage extends StatelessWidget {
  final EnquiriesPageModel model;
  const OpenedEnquiriesListPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<Resource<EnquiryListModel>>(
        stream: model.getEnquiryResponseStream,
        initialData: Resource.none(),
        dataBuilder: (context, result) {
          if (result?.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (result?.status == Status.success) {
            return AppStreamBuilder<
                List<BehaviorSubject<EnquiryListDetailModel>>>(
              stream: model.enquiries,
              initialData: model.enquiries.value,
              dataBuilder: (context, data) {
                return Visibility(
                    visible: data?.isNotEmpty ?? false,
                    replacement: NoDataFoundWidget(title: Strings.of(context).no_enquiry_found),
                    child: ListV(
                      enquiries: data,
                      scrollController: model.scrollController,
                      onRefresh: () => model.fetchEnquiries(isRefresh: true),
                    ));
              },
            );
          }
          if (result?.status == Status.error && model.pageNumber == 1) {
            return Center(
              child: CommonText(text: Strings.of(context).enquiry_not_found),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
