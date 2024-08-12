import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/molecules/enquiries/list.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesPageView extends BasePageViewWidget<EnquiriesPageModel> {
  EnquiriesPageView(super.providerBase);

  @override
  Widget build(BuildContext context, EnquiriesPageModel model) {
    return StreamBuilder<bool>(
      stream: model.isLoading,
      builder: (context, isLoadingSnapshot) {
        return StreamBuilder<List<EnquiryListDetailModel>>(
          stream: model.enquiryList,
          builder: (context, enquiryListSnapshot) {
            final isLoading = isLoadingSnapshot.data ?? false;
            final enquiries = enquiryListSnapshot.data ?? [];

            if (isLoading && enquiries.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  ListV(enquiries: enquiries,scrollController: model.scrollController,onRefresh: ()=> model.fetchEnquiries(isRefresh: true),),
                  if(isLoading && model.pageNumber > 1)...[const CircularProgressIndicator(),
                  SizedBox(height: 5.h,)]
                ],
              );
            }
          },
        );
      },
    );
  }
}
