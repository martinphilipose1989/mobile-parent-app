//

import 'package:app/di/states/viewmodels.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonChipListPage extends StatelessWidget {
  final List<CommonChips> chipValues;
  final Function(int index) onCallBack;
  const CommonChipListPage(
      {super.key, required this.chipValues, required this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommonChipListViewModel>(
        builder: (context, model, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chipValues.length,
            itemBuilder: (context, index) {
              return AppStreamBuilder(
                stream: model!.highlightIndex,
                initialData: model.highlightIndex.value,
                dataBuilder: (context, data) {
                  final isSelected = data == index;
                  return GestureDetector(
                    onTap: () {
                      print(index);
                      onCallBack.call(index);
                      model.highlightIndex.add(index);
                    },
                    child: Container(
                      height: 38.h,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : AppColors.textNeutral35),
                          borderRadius: BorderRadius.circular(12),
                          color: isSelected
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2)
                              : Colors.white),
                      child: Text(chipValues[index].name ?? "",
                          style: AppTypography.subtitle2.copyWith(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : AppColors.textNeutral35,
                          )),
                    ),
                  );
                },
              );
            },
          );
        },
        providerBase: commonChipListProvider);
  }
}
