import 'package:app/feature/dashboard/dashbaord_view_model.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart';

class HighlightList extends StatefulWidget {
  final List<Chips> chipValues;
  final Function(String routeName) onCallBack;

  const HighlightList(
      {super.key, required this.chipValues, required this.onCallBack});

  @override
  HighlightListState createState() => HighlightListState();
}

class HighlightListState extends State<HighlightList> {
  final BehaviorSubject<int> _highlightIndex = BehaviorSubject<int>.seeded(-1);

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
                widget.onCallBack(
                    widget.chipValues[index].name?.toLowerCase() ?? "");
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  //color: isSelected ? Colors.blue.shade100 : Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  // border: isSelected ? Border.all(color: Colors.blue) : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        height: 56.h,
                        width: 56.w,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2)),
                        child: SvgPicture.asset(
                          widget.chipValues[index].image ?? "",
                          color: isSelected ? Colors.white : null,
                          height: 24.h,
                        )),
                    CommonSizedBox.sizedBox(height: 10, width: 10),
                    Text(
                      widget.chipValues[index].name ?? "",
                      style: TextStyle(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
