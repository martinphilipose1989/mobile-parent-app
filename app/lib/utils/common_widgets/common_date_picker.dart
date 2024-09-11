import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CommonDatePickerWidget extends StatefulWidget {
  final String? labelName;
  final bool? showAstreik;
  final String? intialDate;
  final String? Function(String?)? validator;
  final TextEditingController? dateController;
  const CommonDatePickerWidget(
      {super.key,
      this.labelName,
      this.intialDate,
      this.showAstreik = false,
      this.validator,
      this.dateController});

  @override
  CommonDatePickerWidgetState createState() => CommonDatePickerWidgetState();
}

class CommonDatePickerWidgetState extends State<CommonDatePickerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.dateController!.text = formatDateToDDMMYYYY(DateTime.now());
  }

  String formatDateToDDMMYYYY(DateTime date) {
    if (widget.intialDate != null) {
      DateTime parsedDate =
          DateFormat('dd/MM/yyyy').parse(widget.intialDate ?? '');

      // Format the parsed date to 'YYYY-mm-dd'
      String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
      return formattedDate;
    } else {
      return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    }
  }

  @override
  void dispose() {
    widget.dateController!.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        widget.dateController?.text = DateFormat('yyyy-MM-dd').format(picked);
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
          controller: widget.dateController,
          decoration: InputDecoration(
            hintText: '[DD/MM/YYYY]',
            alignLabelWithHint: true,
            prefixIcon: IconButton(
              icon: const Icon(Icons.calendar_today_outlined),
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
            _selectDate(context);
          },
        ),
        Positioned(
          left: 6,
          top: -11,
          child: widget.labelName != ''
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
                      widget.showAstreik!
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
