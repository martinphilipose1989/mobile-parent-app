import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String appbarTitle;
  final bool? showBackButton;
  final bool? notShowNotificationAndUserBatch;

  const CommonAppBar(
      {super.key,
      required this.appbarTitle,
      this.showBackButton = false,
      this.notShowNotificationAndUserBatch = false})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryLighter,
      leading: showBackButton == true
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(
                AppImages.menuHamburgerLogo,
                height: 24.h,
                width: 24.w,
              ),
            ),
      title: CommonText(
        text: appbarTitle,
        style: AppTypography.subtitle1,
      ),
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      actions: (notShowNotificationAndUserBatch ?? false)
          ? []
          : [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(AppImages.notificationLogo),
                ),
              ),
              Container(
                height: 32.h,
                width: 32.w,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.00),
                    border: Border.all(color: AppColors.primary),
                    color: AppColors.primary.withOpacity(0.2)),
                child: const CommonText(
                  text: 'ss',
                  style: TextStyle(color: AppColors.primary),
                ),
              )
            ],
    );
  }
}
