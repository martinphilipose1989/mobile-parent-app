import 'package:app/di/states/viewmodels.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/commonTime/common_time_model.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonTimePage extends StatelessWidget {
  const CommonTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseWidget<CommonTimeModel>(
            builder: (context, model, child) {
              return AppStreamBuilder<int>(stream: model!.selectedTime, initialData: model.selectedTime.value, dataBuilder: (context, data) {
                return  SizedBox(
                  height: 90,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 32
                      ),
                      itemCount: model.timeList.length, // Number of items
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            model.selectedTime.add(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index==model.selectedTime.value?AppColors.primaryLighter:Colors.white, //Color(0xffA3A3A3)
                                border: Border.all(width: 1,color: index==model.selectedTime.value?Theme.of(context).primaryColor:AppColors.textLightGray)
                            ),
                            child: CommonText(
                              text: model.timeList[index].toString(),
                              style: AppTypography.subtitle2.copyWith(
                                  color: index==model.selectedTime.value?Theme.of(context).primaryColor:AppColors.textGray
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },);
            },
          providerBase: commonTimeModelProvider,
        )
      ],
    );
  }
}
