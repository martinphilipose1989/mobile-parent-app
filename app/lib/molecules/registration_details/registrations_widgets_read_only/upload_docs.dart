import 'package:app/dependencies.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

class UploadDocs extends StatelessWidget {
  EnquiryDetail? enquiryDetail;
  RegistrationsDetailsViewModel model;
  String? enquiryID;
  UploadDocs({super.key, this.enquiryDetail, required this.model, this.enquiryID});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Documents",
                style: AppTypography.subtitle2,
              ),
              CommonText(
                text: 'Action',
                style: AppTypography.subtitle2,
              ),
            ],
          ),
        ),
        Column(
          children: List.generate((enquiryDetail?.enquiryDocuments??[]).length, (index)=> documentsNameAndIcons(context,title: enquiryDetail?.enquiryDocuments?[index].documentName??'',enquiryDocument: enquiryDetail?.enquiryDocuments?[index],isUploaded: model.isDocumentUploaded[index],index: index)),
        ),
      ],
    );
  }

  Widget documentsNameAndIcons(BuildContext context,{required String title,EnquiryDocument? enquiryDocument,required ValueNotifier<bool> isUploaded,int? index}) {
    return ValueListenableBuilder(
      valueListenable: isUploaded,
      builder: (context,value,child) {
        return Column(
          children: [
            CommonSizedBox.sizedBox(height: 10, width: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: CommonText(
                    text: title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.subtitle2,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async{
                          // if(!model.editRegistrationDetails.value){
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
                        behavior: HitTestBehavior.opaque,
                        child: Icon(
                          Icons.cloud_upload_outlined,
                          color: model.isDocumentUploaded[index??0].value ? AppColors.primary : Colors.black26,
                        ),
                      ),
                       CommonSizedBox.sizedBox(height: 5, width: 8),
                      GestureDetector(
                        onTap: (){
                          model.downloadEnquiryDocument(enquiryID: enquiryID??'', documentID: (enquiryDocument?.documentId??0).toString());
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Icon(
                          Icons.cloud_download_outlined,
                           color: model.isDocumentUploaded[index??0].value ? AppColors.primary : Colors.black26,
                        ),
                      ),
                      CommonSizedBox.sizedBox(height: 5, width: 8),
                      GestureDetector(
                        child: Icon(
                          Icons.delete_outlined,
                          color: model.isDocumentUploaded[index??0].value ? AppColors.primary : Colors.black26
                        ),
                        onTap: (){
                          if(model.isDocumentUploaded[index ?? 0].value){
                            return;
                          }
                          model.deleteEnquiryDocument(enquiryID: enquiryID??'', documentID: (enquiryDocument?.documentId??0).toString(),index: index);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      }
    );
  }
}
