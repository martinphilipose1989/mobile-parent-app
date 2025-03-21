import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/create_intimation/create_intimation_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/date_formatter.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart' hide State;
import 'package:domain/domain.dart' hide State;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateIntimationPopup extends StatefulWidget {
  final int userid;
  final int schoolId;
  const CreateIntimationPopup(
      {super.key, required this.userid, required this.schoolId});

  @override
  State<CreateIntimationPopup> createState() => _CreateIntimationPopupState();
}

class _CreateIntimationPopupState extends State<CreateIntimationPopup> {
  // final StreamController<String> _dateStreamController =
  //     StreamController<String>.broadcast();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        builder: (BuildContext context, CreateIntimationViewModel? model,
            Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  Strings.of(context).raise_Intimation,
                  style: AppTypography.h5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonDatePickerWidget(
                  labelName: Strings.of(context).request_date,
                  isDisabled: false,
                  controller: model!.dateController,
                  onDateSelected: (selectedDate) {
                    debugPrint("Selected Date: $selectedDate");
                    model.dateController.text =
                        DateFormatter.dateFormat(selectedDate.toString());
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonTextFormField(
                  showAstreik: true,
                  labelText: Strings.of(context).note,
                  controller: model.noteController,
                  decoration: InputDecoration(
                      hintText: Strings.of(context).enter_note,
                      // Default border when not focused
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // Rounded corners
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      )),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return Strings.of(context)
                          .note_cannot_be_empty; // Error message
                    }
                    return null; // Input is valid
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonTextFormField(
                  showAstreik: false,
                  labelText: Strings.of(context).attachment,
                  hintText: Strings.of(context).add_attachment,
                  controller: model.attachmentController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        debugPrint("on preseed");
                        model.pickImage(UpoladFileTypeEnum.image);
                      },
                      icon: SvgPicture.asset(AppImages.upload),
                    ),

                    // Default border when not focuse
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      // Rounded corners
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CommonElevatedButton(
                        // width: 90.w,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: Strings.of(context).cancel,
                        backgroundColor: AppColors.disableNeutral80,
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      child: AppStreamBuilder<
                          Resource<CreateIntimationResponseModel>>(
                        stream: model.intimationSubject
                            .stream, // Your stream to listen to
                        dataBuilder: (context, snapshot) {
                          // Check the state of the stream
                          if (snapshot?.status == Status.loading) {
                            // Show CircularProgressIndicator when loading
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          // else if (snapshot?.data?.status == Status.success) {
                          //   // Show success content (if applicable)
                          //   CommonPopups().showSuccess(context, "Raised Intimation",(tr){} );
                          //
                          // } else if (snapshot?.data?.status == Status.error) {
                          //   // Show error message (if applicable)
                          //   CommonPopups().showError(context, "something went Wrong",(tr){} );
                          //
                          // }

                          // Default UI
                          return ElevatedButton(
                            onPressed: model.createIntimation,
                            child: Text(Strings.of(context).submit),
                          );
                        },
                        initialData: Resource.none(),
                      ),
                    )
                    //    Expanded(
                    //          child: CommonElevatedButton(
                    //            padding: EdgeInsets.only(left: 5,right: 5),
                    //            textStyle: AppTypography.button.copyWith(color: AppColors.surface_1),
                    //          //  width: 90.w,
                    //            onPressed: () {
                    //              model.createIntimation();
                    //                  //createIntimationmodel: CreateIntimationRequestModel(globalUserId: 1,globalStudentId: 10,fromDate:model.dateController.text,toDate: model.dateController.text,status: 0,note: model.noteController.text,approvalFlag: "1",approvedById: 0 ,initimationType: 3,));
                    //
                    //                             debugPrint("done");
                    //                           //    Navigator.pop(context);
                    //            },
                    //            text: "Submit",
                    //            textColor: Colors.white,
                    //            backgroundColor: AppColors.primary,
                    //          ),
                    // )
                  ],
                ),
              ],
            ),
          );
        },
        providerBase: createIntimationProvider);
  }
}
