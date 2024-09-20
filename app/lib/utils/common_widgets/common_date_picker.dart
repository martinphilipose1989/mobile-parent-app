import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CommonDatePickerWidget extends StatefulWidget {
  final String? labelName;
  DateTime? initialDate;
  final bool isDisabled;
  final bool showAstreik;
  final Function(DateTime?) onDateSelected;
  CommonDatePickerWidget(
      {super.key, this.labelName, this.initialDate, this.isDisabled = false, this.showAstreik = false,required this.onDateSelected});

  @override
  CommonDatePickerWidgetState createState() => CommonDatePickerWidgetState();
}

class CommonDatePickerWidgetState extends State<CommonDatePickerWidget> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    if (widget.initialDate != null) {
      _dateController.text =
          DateFormat('dd/MM/yyyy').format(widget.initialDate!);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonDatePickerWidget oldWidget) {
    if (oldWidget.initialDate != widget.initialDate &&
        widget.initialDate != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dateController.text =
            DateFormat('dd/MM/yyyy').format(widget.initialDate!);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:widget.initialDate??DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        widget.onDateSelected(picked);
        widget.initialDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          controller: _dateController,
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
