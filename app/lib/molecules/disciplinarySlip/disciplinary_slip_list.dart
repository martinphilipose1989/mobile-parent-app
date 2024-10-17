import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'disciplinary_slip_list_item.dart';

class DisciplinarySlipList extends StatelessWidget {
  const DisciplinarySlipList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (BuildContext context,int index){
      return DisciplinarySlipListItem();

    }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 16.h,);
    }, itemCount: 10,);
  }
}
