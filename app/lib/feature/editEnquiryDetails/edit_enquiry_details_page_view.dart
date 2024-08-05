import 'package:app/feature/editEnquiryDetails/edit_enquiry_details_page_model.dart';
import 'package:app/molecules/enquiries/edit_enquiry_details.dart';
import 'package:app/molecules/enquiries/list_item.dart';
import 'package:app/molecules/enquiries/upload_documents.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_tab_page.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EditEnquiriesDetailsPageView
    extends BasePageViewWidget<EditEnquiriesDetailsPageModel> {
  EditEnquiriesDetailsPageView(super.providerBase);
  @override
  Widget build(BuildContext context, EditEnquiriesDetailsPageModel model) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListItem(
                          image: AppImages.personIcon,
                          name: "Rajeev",
                          year: "AY 2024-2025",
                          id: "ENADMS#4402",
                          title: "Vibgyor Kids & High - Malad West",
                          subtitle: "Grade V | CBSE",
                          buttontext: "School Visit"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTabPage(
                        firstTabTitle: "Enquiry Details",
                        secondTabTitle: "Upload Documents",
                        tabController: model.tabController,
                        selectedValue: model.selectedValue,
                      ),
                      AppStreamBuilder(
                        stream: model.selectedValue,
                        initialData: model.selectedValue.value,
                        dataBuilder: (context, data) {
                          return Container();
                          // return data == 1
                          //     ? const UploadDocuments()
                          //     : EditEnquiriesDetailsWidget(model: model,);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                    onPressed: () {},
                    text: 'Cancel',
                    borderColor: Theme.of(context).primaryColor,
                    borderWidth: 1,
                    width: 171.w,
                    height: 40.h,
                    textColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CommonElevatedButton(
                    onPressed: () {},
                    text: 'Next',
                    backgroundColor: AppColors.accent,
                    width: 171.w,
                    height: 40.h,
                    textColor: AppColors.accentOn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
