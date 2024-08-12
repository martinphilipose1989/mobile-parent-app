import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/enquiries/list.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesPageView extends BasePageViewWidget<EnquiriesPageModel> {
  EnquiriesPageView(super.providerBase);

  @override
  Widget build(BuildContext context, EnquiriesPageModel model) {

    return AppStreamBuilder<Resource<List<EnquiryListDetailModel>>>(
      stream: model.enquiryList,
      initialData: Resource.none(),
      dataBuilder: (context, result) {
        switch(result?.status){
          case Status.loading:
            return const Center(child: CircularProgressIndicator(),);
          case Status.success:
            return Column(
                children: [
                  ListV(enquiries: result?.data ?? [],scrollController: model.scrollController,onRefresh: ()=> model.fetchEnquiries(isRefresh: true),),
                  ValueListenableBuilder(
                    valueListenable: model.isLoading,
                    builder: (context,value,child){
                      return model.isLoading.value ? const CircularProgressIndicator() : const SizedBox.shrink();
                    }
                  )
                ],
              );
          case Status.error:
            return const Center(child: Text('Enquiries not found'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}
