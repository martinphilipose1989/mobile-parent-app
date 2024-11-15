import 'dart:async';

import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateIntimationPopup extends StatelessWidget {
 CreateIntimationPopup({super.key});
  final TextEditingController dateController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
 final StreamController<String> _dateStreamController = StreamController<String>.broadcast();

 Future<void> _selectDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime(2000),
     lastDate: DateTime(2100),
   );

   if (picked != null) {
     // Add the selected date to the stream
     _dateStreamController.sink.add(DateFormat('dd/MM/yyyy').format(picked));
   }
 }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
   AppStreamBuilder(
        dataBuilder: (context,date) {
          return CommonTextFormField(controller:dateController,showAstreik: true,hintText: 'DD/MM/YYYY',labelText: "Request Date",
            prefix: IconButton(onPressed: () { _selectDate(context); }, icon: Icon(Icons.calendar_month,),),);
        },   stream: _dateStreamController.stream,
     initialData: "DD/MM/YYYY",
      ),

      CommonTextFormField(showAstreik: true,controller: noteController, )

    ],);
  }
}
