// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/subjects.dart';

class Menu extends StatelessWidget {
  final List menuData;
  final Function(int index) onTap;
  final double height;
  final BehaviorSubject<bool> showMenuOnFloatingButton;
  const Menu(
      {super.key,
      required this.menuData,
      required this.onTap,
      required this.showMenuOnFloatingButton,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      height: height,
      width: 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(
            text: 'Apply Action',
            style: AppTypography.subtitle2,
          ),
          Column(
            children: List.generate(
              menuData.length,
              (index) => InkWell(
                onTap: () {
                  onTap.call(index);
                },
                child: menuItem(
                    menuData[index]['image'], menuData[index]['name'], context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuItem(String image, String menuTitle, BuildContext cxt) {
    return Column(
      children: [
        CommonSizedBox.sizedBox(height: 15, width: 10),
        Row(
          children: [
            SvgPicture.asset(
              image,
              height: 36.r,
            ),
            CommonSizedBox.sizedBox(height: 10, width: 10),
            CommonText(
              text: menuTitle,
              style: AppTypography.subtitle2
                  .copyWith(color: Theme.of(cxt).primaryColor),
            )
          ],
        )
      ],
    );
  }
}
