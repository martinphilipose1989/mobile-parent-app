import 'package:app/dependencies.dart';
import 'package:app/feature/enquiryDetails/enquiry_details_page_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDocuments extends StatelessWidget {
  EnquiriesDetailsPageModel model;
  EnquiryDetail? enquiryDetail;
  String? enquiryID;
  // BehaviorSubject<bool> isUpdate = BehaviorSubject<bool>.seeded(false);
  UploadDocuments({super.key,this.enquiryDetail,required this.model,this.enquiryID});

  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Container(
              height: 54,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffF0F2F4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CommonText(text: "Documents",
                          style: AppTypography.body2.copyWith(
                            fontFamily: 'Poppins',
                            color: AppColors.textGray
                          ),
                        ),
                        const Icon(
                          Icons.arrow_upward,
                          color: AppColors.textGray,
                          size: 16,
                        ),
                      ],
                    ),
                    CommonText(text: "Action",
                      style: AppTypography.body2.copyWith(
                          fontFamily: 'Poppins',
                          color: AppColors.textGray
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: List.generate((enquiryDetail?.enquiryDocuments??[]).length, (index)=> _uploadItem(context,title: enquiryDetail?.enquiryDocuments?[index].documentName??'',enquiryDocument: enquiryDetail?.enquiryDocuments?[index],isUploaded: model.isDocumentUploaded[index],index: index)),
            ),
            const SizedBox(height: 100,),
          ],
        );
          
      }
    );
  }

  _uploadItem(BuildContext context,{required String title,EnquiryDocument? enquiryDocument,required ValueNotifier<bool> isUploaded,int? index}){
    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, snapshot) {
        return ValueListenableBuilder(
          valueListenable: isUploaded,
          builder: (context,value,child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CommonText(text: title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppTypography.button.copyWith(
                            color: AppColors.textDark
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async{
                                // if(!model.editRegistrationDetails.value || model.isDocumentUploaded[index??0].value){
                                //   return;
                                // }
                                var file = await getIt.get<FileUtilityPort>().pickFile();
                                file.fold(
                                  (l) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: CommonText(text: l.error.message))
                                    );
                                  },
                                  (r) {
                                    if(r!=null){
                                      model.uploadEnquiryDocument(enquiryID: enquiryID??'', documentID: (enquiryDocument?.documentId??0).toString(), file: r,index: index);
                                    }
                                  }
                                );
                              },
                              child: SvgPicture.asset(
                                AppImages.uploadIcon,
                                colorFilter: const ColorFilter.mode(
                                  Colors.black, 
                                  BlendMode.srcIn, 
                                ),
                              )
                            ),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){
                                if(!model.isDocumentUploaded[index??0].value){
                                  return;
                                }
                                model.downloadEnquiryDocument(enquiryID: enquiryID??'', documentID: (enquiryDocument?.documentId??0).toString());
                              },
                              behavior: HitTestBehavior.opaque,
                              child: SvgPicture.asset(
                                AppImages.import,
                                colorFilter: ColorFilter.mode(
                                  model.isDocumentUploaded[index??0].value ? Colors.black : Colors.black26,
                                  BlendMode.srcIn, 
                                ),
                              )
                            ),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){
                                if(!model.isDocumentUploaded[index??0].value){
                                  return;
                                }
                                CommonPopups().showAlert(
                                  context,
                                  "Are you sure, you want to delete?",
                                  (shouldRoute) {
                                    model.deleteEnquiryDocument(enquiryID: enquiryID??"", documentID: (enquiryDocument?.documentId??0).toString(),index: index);
                                  }
                                );
                              },
                              behavior: HitTestBehavior.opaque,
                              child: SvgPicture.asset(
                                AppImages.delete,
                                colorFilter: ColorFilter.mode(
                                  model.isDocumentUploaded[index??0].value? Colors.black : Colors.black26,
                                  BlendMode.srcIn,
                                ),
                              )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}
