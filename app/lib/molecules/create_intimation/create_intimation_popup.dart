import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateIntimationPopup extends StatelessWidget {
 CreateIntimationPopup({super.key});
  final TextEditingController _dateController = TextEditingController();
  final ValueNotifier<String> _selectedDate = ValueNotifier<String>("");
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommonTextFormField(showAstreik: true,hintText: 'DD/mm/yyyy',labelText: "Request Date",prefix: IconButton(onPressed: () {  }, icon: Icon(Icons.calendar_month,),),),
    ],);
  }
}
