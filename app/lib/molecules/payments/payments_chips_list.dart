import 'package:app/feature/payments/payments_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

class PaymentsChipsList extends StatefulWidget {
  final List<Chips> chipValues;
  final Function(int index) onCallBack;

  const PaymentsChipsList(
      {super.key, required this.chipValues, required this.onCallBack});

  @override
  ChipsListState createState() => ChipsListState();
}

class ChipsListState extends State<PaymentsChipsList> {
  final BehaviorSubject<int> _highlightIndex = BehaviorSubject<int>.seeded(0);

  @override
  void dispose() {
    _highlightIndex.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.chipValues.length,
      itemBuilder: (context, index) {
        return StreamBuilder<int>(
          stream: _highlightIndex.stream,
          builder: (context, snapshot) {
            final isSelected = snapshot.data == index;
            return GestureDetector(
              onTap: () {
                _highlightIndex.add(index);
                widget.onCallBack(index);
              },
              child: Container(
                height: 38.h,
                width: 129.w,
                //padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : AppColors.textNeutral35),
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : Colors.white),
                child: Text(widget.chipValues[index].name ?? "",
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
  }
}
