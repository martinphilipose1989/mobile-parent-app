import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoEditRow extends StatelessWidget {
  final String labelText;
  final String? labelText2;
  final FormFieldValidator<String>? validatorleft;
  final FormFieldValidator<String>? validatorright;
  final TextEditingController? controllerleft;
  final TextEditingController? controllerRight;
  final bool readOnly;

  InfoEditRow(
      {super.key,
      required this.labelText,
  this.labelText2,
      this.controllerleft,
      this.controllerRight,
      required this.readOnly, this.validatorleft, this.validatorright});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: CommonTextFormField(
              showAstreik: true,
              readOnly: readOnly,
              labelText: labelText,
              controller: controllerleft,
              validator: validatorleft,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: CommonTextFormField(
              showAstreik: true,
              readOnly: readOnly,
              labelText: labelText2,
              controller: controllerRight,
              validator: validatorright,
            ),
          )
        ],
      ),
    );
  }
}
