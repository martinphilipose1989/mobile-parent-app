import 'package:app/feature/enquiries/enquiries_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/enquiries/list.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiriesPageView extends BasePageViewWidget<EnquiriesPageModel> {
  EnquiriesPageView(super.providerBase);

  @override
  Widget build(BuildContext context, EnquiriesPageModel model) {

    return AppStreamBuilder<Resource<EnquiryListModel>>(
      stream: model.getEnquiryResponseStream,
      initialData: Resource.none(),
      dataBuilder: (context, result) {
        if(result?.status == Status.loading && model.pageNumber == 1){
          return const Center(child: CircularProgressIndicator(),);
        }
        
        if(result?.status == Status.error && model.pageNumber == 1) {
          return const Center(child: Text('Enquiries not found'),);
        }
        else{
          return Column(
            children: [
              ListV(enquiries: result?.data?.data?.data,scrollController: model.scrollController,onRefresh: ()=> model.fetchEnquiries(isRefresh: true),),
              if(result?.status == Status.loading)...[
                    const Center(child: CircularProgressIndicator(),),
                    SizedBox(height: 15.h,),
              ]
            ],
          );
        }
      }
    );
  }
}
