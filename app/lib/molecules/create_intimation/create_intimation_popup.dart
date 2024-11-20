

import 'package:app/molecules/create_intimation/create_intimation_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_date_picker.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:data/data.dart'hide State;
import 'package:domain/domain.dart' hide State;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart' ;
import '../../utils/common_widgets/app_images.dart';

class CreateIntimationPopup extends StatefulWidget {
  final int userid;
  final int schoolId;
  CreateIntimationPopup(
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
                const Text(
                  "Raise Intimation",
                  style: AppTypography.h5,
                ),

                SizedBox(
                  height: 20.h,
                ),

                CommonDatePickerWidget(
                  isDisabled: true,
                  controller: model!.dateController,

                ),

                // CommonTextFormField( decoration: InputDecoration(suffixIcon: IconButton(onPressed: () { _selectDate(context); }, icon: Icon(Icons.calendar_month,),),
                //
                //
                //    // Default border when not focused
                //    border: OutlineInputBorder(
                //    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                //    borderSide: BorderSide(
                //    color: Colors.grey,
                //    width: 1.0,
                //    ))),
                //     validator: (value) {
                //       if (value == null || value.trim().isEmpty) {
                //         return "date cannot be empty"; // Error message
                //       }
                //       return null; // Input is valid
                //     }
                //    ,controller:dateController,showAstreik: true,hintText: 'DD/MM/YYYY',labelText: "Request Date",)
                //    ,

                SizedBox(
                  height: 16.h,
                ),
                CommonTextFormField(
                  showAstreik: true,
                  labelText: "Note",
                  controller: model.noteController,
                  decoration: InputDecoration(

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
                      return "Note cannot be empty"; // Error message
                    }
                    return null; // Input is valid
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CommonTextFormField(
                    showAstreik: false,
                    labelText: "Attachment",
                    controller: model.attachmentController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            print("on preseed");
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
                        ),),),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonElevatedButton(
                      width: 90.w,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "Cancel",
                      backgroundColor: AppColors.disableNeutral80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CommonElevatedButton(
                      padding: EdgeInsets.only(left: 5,right: 5),
                      textStyle: AppTypography.button.copyWith(color: AppColors.surface_1),
                      width: 90.w,
                      onPressed: () {
                        model.createIntimation();
                            //createIntimationmodel: CreateIntimationRequestModel(globalUserId: 1,globalStudentId: 10,fromDate:model.dateController.text,toDate: model.dateController.text,status: 0,note: model.noteController.text,approvalFlag: "1",approvedById: 0 ,initimationType: 3,));

                   print("done");
                 //    Navigator.pop(context);
                      },
                      text: "Submit",
                      textColor: Colors.white,
                      backgroundColor: AppColors.primary,
                    )
                  ],
                ),
              ],
            ),
          );
        },
        providerBase: createIntimationProvider);
  }
}
