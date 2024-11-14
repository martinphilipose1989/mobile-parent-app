import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CommonDatePickerWidget extends StatefulWidget {
  final String? labelName;
  DateTime? initialDate;
  DateTime? lastDate;
  final bool isDisabled;
  final bool showAstreik;
  final Function(DateTime?) onDateSelected;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isDOB;
  CommonDatePickerWidget(
      {super.key,
      this.labelName,
      this.initialDate,
      this.isDisabled = false,
      this.showAstreik = false,
      required this.onDateSelected,
      this.validator,
      required this.controller,
      this.isDOB = false,
      this.lastDate});

  @override
  CommonDatePickerWidgetState createState() => CommonDatePickerWidgetState();
}

class CommonDatePickerWidgetState extends State<CommonDatePickerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.controller.text = formatDateToDDMMYYYY(DateTime.now());
  }

  String formatDateToDDMMYYYY(DateTime date) {
    if(!widget.isDOB){
      if (widget.initialDate != null) {
        DateTime parsedDate =
            DateFormat('dd/MM/yyyy').parse(widget.initialDate.toString());

        // Format the parsed date to 'YYYY-mm-dd'
        String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
        return formattedDate;
      } else {
        return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      }      
    }
    else{
      if (widget.initialDate != null) {
        return DateFormat('dd/MM/yyyy').format(widget.initialDate!);
      }
      else{
        return "";
      }
    }
  }

  // @override
  // void dispose() {
  //   widget.dateController!.dispose();
  //   super.dispose();
  // }

  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   super.dispose();
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: widget.isDOB? widget.lastDate??DateTime(DateTime.now().year-1) : DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        widget.onDateSelected(picked);
        widget.initialDate = picked;
        widget.controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: '[DD/MM/YYYY]',
            suffixIcon: IconButton(
              icon: SvgPicture.asset(AppImages.calendarIcon),
              onPressed: () {
                _selectDate(context);
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          readOnly: true,
          onTap: () {
            if (!widget.isDisabled) {
              _selectDate(context);
            }
          },
        ),
        Positioned(
          left: 6,
          top: -11,
          child: widget.labelName != null
              ? Container(
                  color: Colors
                      .white, // Match the background color to avoid overlap
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      CommonText(
                        text: widget.labelName ?? "",
                        style: AppTypography.caption
                            .copyWith(color: AppColors.textNeutral35),
                      ),
                      widget.showAstreik
                          ? CommonText(
                              text: ' *',
                              style: AppTypography.caption.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.failure,
                                  fontSize: 12.sp),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
