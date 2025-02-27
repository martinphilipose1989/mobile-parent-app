import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';

import 'package:app/utils/common_widgets/common_image_widget.dart';
import 'package:app/utils/common_widgets/common_primary_elevated_button.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/common_widgets/dialog/add_new_bearer/add_new_bearer_viewmodel.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

// ignore: must_be_immutable
class AddNewBearer extends StatelessWidget {
  const AddNewBearer(
      {super.key,
      required this.cancelCallback,
      required this.addNewBearerCallback,
      required this.studentId});

  final VoidCallback cancelCallback;
  final VoidCallback addNewBearerCallback;

  final int studentId;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      insetPadding: const EdgeInsets.all(16),
      child: BaseWidget(
        providerBase: addNewBearerViewmodelProvider,
        builder: (context, model, _) =>
            AppStreamBuilder<Resource<MapStudenttoBearerResponse>>(
                stream: model!.bearerStream,
                initialData: Resource.none(),
                onData: (data) {
                  if (data.status == Status.success) {
                    Navigator.pop(context, true);
                  }
                },
                dataBuilder: (context, data) {
                  return Container(
                    width: double.infinity,
                    padding: REdgeInsets.all(24),
                    child: Form(
                      key: model.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                              text: "Add New Bearer", style: AppTypography.h5),
                          const SizedBox(height: 16),
                          CommonText(
                              text: "Add Profile Photo",
                              style: AppTypography.caption),
                          AddBearerImagePicker(
                              callback: (value) {}, model: model),
                          CommonTextFormField(
                            controller: model.firstNameController,
                            topPadding: 16,
                            showAstreik: false,
                            labelText: "First Name",
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[a-zA-Z\s]+$'))
                            ],
                            validator: (value) {
                              if (Validator.isEmpty(value!)) {
                                return "First name cannot be empty";
                              }
                              return null;
                            },
                          ),
                          CommonTextFormField(
                            controller: model.lastNameController,
                            topPadding: 16,
                            showAstreik: false,
                            labelText: "Last Name",
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[a-zA-Z\s]+$'))
                            ],
                            validator: (value) {
                              if (Validator.isEmpty(value!)) {
                                return "Last name cannot be empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonPrimaryElevatedButton(
                                title: "Cancel",
                                titleTextStyle: AppTypography.body2,
                                onPressed: () {
                                  cancelCallback.call();
                                },
                                backgroundColor: AppColors.textPalerGray,
                                foregroundColor: AppColors.textGray,
                              ),
                              SizedBox(width: 8.w),
                              CommonPrimaryElevatedButton(
                                isLoading: data?.status == Status.loading,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                title: "Add Bearer",
                                titleTextStyle: AppTypography.body2,
                                onPressed: () {
                                  model.createBearer(studentId: studentId);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}

class AddBearerImagePicker extends StatelessWidget {
  const AddBearerImagePicker(
      {super.key, required this.callback, required this.model});

  final Function(String value) callback;
  final AddNewBearerViewmodel model;

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
              child: AppStreamBuilder<Resource<UploadFileResponseModel>>(
                  initialData: Resource.none(),
                  stream: model.uploadedFileResponse,
                  dataBuilder: (context, data) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Visibility(
                          visible: data?.status == Status.loading,
                          replacement: ClipOval(
                            child: CommonImageWidget(
                              imageUrl: "${data?.data?.data?.url}",
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
                    );
                  })),
          AppStreamBuilder<Resource<UploadFileResponseModel>>(
            initialData: Resource.none(),
            stream: model.uploadedFileResponse,
            dataBuilder: (context, data) {
              return Positioned(
                bottom: 10.h,
                right: 0,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: data?.status == Status.loading
                      ? null
                      : () {
                          model.pickImage(UpoladFileTypeEnum.camera);
                        },
                  child: Container(
                    height: 35.w,
                    width: 35.w,
                    padding: REdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: data?.status == Status.loading
                            ? AppColors.textGray
                            : Colors.white,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(AppImages.editIcon,
                        height: 24.w, width: 24.w),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
