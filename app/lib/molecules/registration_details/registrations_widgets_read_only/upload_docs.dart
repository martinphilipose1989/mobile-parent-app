import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadDocs extends StatelessWidget {
  final EnquiryDetail? enquiryDetail;
  final RegistrationsDetailsViewModel model;
  final String? enquiryID;
  const UploadDocs({super.key, this.enquiryDetail, required this.model, this.enquiryID});

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
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: List.generate((enquiryDetail?.enquiryDocuments??[]).length, (index)=> (enquiryDetail?.enquiryDocuments?[index].stage == "Registration") ?  documentsNameAndIcons(context,title: enquiryDetail?.enquiryDocuments?[index].documentName??'',enquiryDocument: enquiryDetail?.enquiryDocuments?[index],isUploaded: model.isDocumentUploaded[index],index: index) : const SizedBox.shrink()),
          ),
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
                  child: Text.rich(
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$title ',
                          style: AppTypography.subtitle2,
                        ),
                        TextSpan(
                          text: enquiryDocument?.isMandatory == 1 ? '*' : '',
                          style: AppTypography.subtitle2.copyWith(color: Colors.red),
                        ),
                      ],
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
                          // if(!model.editRegistrationDetails.value){
                          //   return;
                          // }
                          showImagePickerBottomSheet(enquiryDocument: enquiryDocument,enquiryID: enquiryID,index: index);
                        },
                        behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset(
                            AppImages.uploadIcon,
                            colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                        )
                      ),
                       CommonSizedBox.sizedBox(height: 5, width: 8),
                      GestureDetector(
                        onTap: (){
                          model.downloadEnquiryDocument(enquiryID: enquiryID??'', documentID: (enquiryDocument?.documentId??0).toString());
                        },
                        behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset(
                          AppImages.import,
                          colorFilter: ColorFilter.mode(
                            model.isDocumentUploaded[index ?? 0].value
                                ? Colors.black
                                : Colors.black26,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      CommonSizedBox.sizedBox(height: 5, width: 8),
                      GestureDetector(
                        child: SvgPicture.asset(
                          AppImages.delete,
                          colorFilter: ColorFilter.mode(
                            model.isDocumentUploaded[index??0].value? Colors.black : Colors.black26,
                            BlendMode.srcIn,
                          ),
                        ),
                        onTap: (){
                          if(!model.isDocumentUploaded[index ?? 0].value){
                            return;
                          }
                          CommonPopups().showAlert(
                                context, "Are you sure, you want to delete?",
                                (shouldRoute) {
                              model.deleteEnquiryDocument(
                                  enquiryID: enquiryID ?? "",
                                  documentID: (enquiryDocument?.documentId ?? 0)
                                      .toString(),
                                  index: index);
                          });
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

  void showImagePickerBottomSheet({String? enquiryID,EnquiryDocument? enquiryDocument,int? index}){
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context){
        return Container(
          height: 150,
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          width: MediaQuery.of(navigatorKey.currentContext!).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(navigatorKey.currentContext!);
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    bool cameraPermissionGranted = await model
                        .permissionHandler
                        .checkCameraPermission(
                      (value) {
                        if (value) {
                          CommonPopups().showGallerySettingPermission(
                            navigatorKey.currentContext!,
                            'To continue, please allow access to your camera. These permissions are necessary for capturing and selecting images. You can enable them in your device settings.',
                            true,
                            Icons.camera_alt,
                            (shouldRoute) {
                              openAppSettings();
                            },
                          );
                        }
                      },
                    );
                    if (cameraPermissionGranted) {
                      model.pickFile(UpoladFileTypeEnum.camera,(enquiryDocument?.documentId??0).toString(),enquiryID??'',index??0);
                      Navigator.pop(navigatorKey.currentContext!);
                    }
                  },
                  child: const CommonText(text: "Take A Photo"),
                ),
                const Divider(),
                InkWell(
                  onTap: () async {
                    bool galleryPermissionGranted = await model
                        .permissionHandler
                        .checkGalleryPermission(
                      (value) {
                        if (value) {
                          CommonPopups().showGallerySettingPermission(
                            navigatorKey.currentContext!,
                            'To continue, please allow access to your gallery. These permissions are necessary for capturing and selecting images. You can enable them in your device settings.',
                            true,
                            Icons.photo,
                            (shouldRoute) {
                              openAppSettings();
                            },
                          );
                        }
                      },
                    );
                    if (galleryPermissionGranted) {
                      model.pickFile(UpoladFileTypeEnum.image,(enquiryDocument?.documentId??0).toString(),enquiryID??'',index??0);
                      Navigator.pop(navigatorKey.currentContext!);
                    }
                  },
                  child: const CommonText(text: "Choose From Gallery"),
                ),
              ],
            ),
          ),
        );  
      }
    );
  }
}
