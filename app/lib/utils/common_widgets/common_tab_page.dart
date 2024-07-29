import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/subjects.dart';

class CommonTabPage<T> extends StatelessWidget {
  final BehaviorSubject<int> selectedValue;
  final TabController tabController;
  final String? firstTabTitle;
  final String? secondTabTitle;

  const CommonTabPage(
      {super.key,
      required this.tabController,
      required this.selectedValue,
      this.firstTabTitle,
      this.secondTabTitle});

  @override
  Widget build(BuildContext context) {
    return AppStreamBuilder<int>(
      stream: selectedValue,
      initialData: selectedValue.value,
      dataBuilder: (context, data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedValue.add(0);
                },
                child: Container(
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: data == 0
                          ? AppColors.primaryLight.withOpacity(0.2)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1)),
                  child: CommonText(
                    text: firstTabTitle ?? 'Tab 1',
                    style: AppTypography.subtitle2.copyWith(
                        color: data == 0
                            ? AppColors.primaryLight
                            : AppColors.inactiveNeutral60),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  selectedValue.add(1);
                },
                child: Container(
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: data == 1
                          ? AppColors.primaryLight.withOpacity(0.2)
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1)),
                  child: CommonText(
                    text: secondTabTitle ?? 'Tab 2',
                    style: AppTypography.subtitle2.copyWith(
                        color: data == 1
                            ? AppColors.primaryLight
                            : AppColors.inactiveNeutral60),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
