import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_image_widget.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_searchable_dropdown/searchable_dropdown_list.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/common_primary_elevated_button.dart';

class BearerEditPopup extends StatelessWidget {
  BearerEditPopup({super.key, this.update});

  VoidCallback? update;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(24),
      child: Form(
        // key: model.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(text: "Edit Bearer", style: AppTypography.h5),
            const SizedBox(height: 16),
            CommonText(
                text: "Edit Profile Photo", style: AppTypography.caption),
            AddBearerImagePicker(
              callback: (value) {},
              //model: model
            ),
            CommonTextFormField(
              // controller: model.firstNameController,
              topPadding: 16,
              showAstreik: false,
              labelText: "Bearer Name",
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$'))
              ],
              validator: (value) {
                if (Validator.isEmpty(value!)) {
                  return "First name cannot be empty";
                }
                return null;
              },
            ),
            CommonSearchableDropDown(
              items: ["Male", "Female"],
              isMutiSelect: false,
              dropdownName: "Gender",
              showAstreik: true,
              showBorderColor: true,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonPrimaryElevatedButton(
                  title: "Cancel",
                  titleTextStyle: AppTypography.body2,
                  onPressed: () {
                    //  cancelCallback.call();
                  },
                  backgroundColor: AppColors.textPalerGray,
                  foregroundColor: AppColors.textGray,
                ),
                SizedBox(width: 8.w),
                CommonPrimaryElevatedButton(
                  //  isLoading: data?.status == Status.loading,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  title: "Update",
                  titleTextStyle: AppTypography.body2,
                  onPressed: () {
                    // model.createBearer(studentId: studentId);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddBearerImagePicker extends StatelessWidget {
  const AddBearerImagePicker({
    super.key,
    required this.callback,

    //required this.model
  });

  final Function(String value) callback;

  //final AddNewBearerViewmodel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Card(
              shadowColor: AppColors.shadowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.r),
              ),
              child:
                  // AppStreamBuilder<Resource<UploadFileResponseModel>>(
                  //     initialData: Resource.none(),
                  //     stream: model.uploadedFileResponse,
                  //     dataBuilder: (context, data) {
                  //  return
                  Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    //   visible: data?.status == Status.loading,
                    replacement: ClipOval(
                      child: CommonImageWidget(
                        imageUrl: "",
                        //  imageUrl: "${data?.data?.data?.url}",
                        imageHeight: 100.w,
                        imageWidth: 100.w,
                      ),
                    ),
                    child: const Center(
                      child:
                          CircularProgressIndicator(), // Progress indicator while loading
                    ),
                  ),
                ],
              )),

          // AppStreamBuilder<Resource<UploadFileResponseModel>>(
          //  initialData: Resource.none(),
          //  stream: model.uploadedFileResponse,
          //  dataBuilder: (context, data) {
          // return
          Positioned(
            bottom: 10.h,
            right: 0,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              // data?.status == Status.loading
              //            ? null
              //            : () {
              //         model.pickImage(UpoladFileTypeEnum.camera);
              //        },
              child: Container(
                height: 35.w,
                width: 35.w,
                padding: REdgeInsets.all(8),
                decoration: BoxDecoration(
                    // color: data?.status == Status.loading
                    //     ? AppColors.textGray
                    //     :
                    color: Colors.white,
                    shape: BoxShape.circle),
                child: SvgPicture.asset(AppImages.editIcon,
                    height: 24.w, width: 24.w),
              ),
            ),
          )
        ],
      ),
    );
  }
}
