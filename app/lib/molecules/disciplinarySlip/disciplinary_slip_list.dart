import 'package:app/model/resource.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import '../../feature/disciplinarySlip/disciplinary_details_view_model.dart';
import 'disciplinary_slip_list_item.dart';

class DisciplinarySlipList extends StatelessWidget {
  const DisciplinarySlipList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BaseWidget(
          providerBase: disciplinarySlipProvider,
          builder: (BuildContext context, DisplinaryDetailsViewModel? model, Widget? child) {


            return

              AppStreamBuilder<Resource<DisciplinaryListModel>>(
              stream: model!.getDisciplinarySlipModel,
              initialData: Resource.none(),
              dataBuilder: (BuildContext context, Resource<DisciplinaryListModel>? data) {
                return
                  data?.status==Status.loading?const Center(child: CircularProgressIndicator(),):
                  ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if(data?.data!=null)
                    return DisciplinarySlipListItem(date: data?.data!.data.data[index].date.toString(), discription:data?.data!.data.data[index].description, id: data?.data!.data.data[index].disciplinarySlipId ,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                  itemCount: data!.data!.data.data.length,
                );

              },

            );
          },

        ));
  }
}
