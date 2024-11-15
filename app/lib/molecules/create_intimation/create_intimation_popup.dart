import 'dart:async';

import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../utils/common_widgets/app_images.dart';

class CreateIntimationPopup extends StatefulWidget {
 final  int userid;
final  int schoolId;
 CreateIntimationPopup({super.key, required this.userid, required this.schoolId});

  @override
  State<CreateIntimationPopup> createState() => _CreateIntimationPopupState();
}

class _CreateIntimationPopupState extends State<CreateIntimationPopup> {
  final TextEditingController dateController = TextEditingController();

  final TextEditingController noteController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();

 final StreamController<String> _dateStreamController = StreamController<String>.broadcast();

 Future<void> _selectDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime(2000),
     lastDate: DateTime(2100),
   );

   if (picked != null) {

       setState(() {
         // Format and set the date in dd/MM/yyyy format
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
       });

 }}

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 16.h,),
      const Text("Create Intimation",style: AppTypography.h5,),

      SizedBox(height: 20.h,),



 CommonTextFormField( decoration: InputDecoration(suffixIcon: IconButton(onPressed: () { _selectDate(context); }, icon: Icon(Icons.calendar_month,),),


    // Default border when not focused
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0), // Rounded corners
    borderSide: BorderSide(
    color: Colors.grey,
    width: 1.0,
    ))),
     validator: (value) {
       if (value == null || value.trim().isEmpty) {
         return "date cannot be empty"; // Error message
       }
       return null; // Input is valid
     }
    ,controller:dateController,showAstreik: true,hintText: 'DD/MM/YYYY',labelText: "Request Date",)
    ,





SizedBox(height: 16.h,),
      CommonTextFormField(showAstreik: true,labelText:"Note",controller: noteController,decoration: InputDecoration(

    // Default border when not focused
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0), // Rounded corners
    borderSide: BorderSide(
    color: Colors.grey,
    width: 1.0,
    ),
    ) ),
    validator: (value) {
    if (value == null || value.trim().isEmpty) {
    return "Note cannot be empty"; // Error message
    }
    return null; // Input is valid
    },
      ),
      SizedBox(height: 16.h,),
      CommonTextFormField(showAstreik: false,labelText:"Attachment",controller: attachmentController,
          decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.upload),),

        // Default border when not focuse
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ) )

      ),
        SizedBox(height: 16.h,),
Row(mainAxisAlignment: MainAxisAlignment.end,
  children: [
  CommonElevatedButton(width:100.w,onPressed: (){
    Navigator.pop(context);
  }, text: "Cancel",backgroundColor: AppColors.disableNeutral80,)
  ,
    const SizedBox(width: 10,),
    CommonElevatedButton(width:100.w,onPressed: (){}, text: "Submit",textColor:Colors.white,backgroundColor: AppColors.primary,)


],)

    ],);

  }
}
