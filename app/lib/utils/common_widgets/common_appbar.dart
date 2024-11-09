import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/extension/string_formatter.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String appbarTitle;
  final bool? showBackButton;
  final Widget? leading;
  final bool? notShowNotificationAndUserBatch;
  final VoidCallback? onBackPressed; // Renamed for clarity

  const CommonAppBar({
    super.key,
    required this.appbarTitle,
    this.showBackButton = false,
    this.leading,
    this.notShowNotificationAndUserBatch = false,
    this.onBackPressed,
  }) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryLighter,
      leading: leading ??
          (showBackButton == true
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed!(); // Calls the provided callback if given
                    } else {
                      Navigator.pop(context); // Pops the page if no callback
                    }
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
                )),
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
                  color: AppColors.primary.withOpacity(0.2),
                ),
                child: BaseWidget(
                    providerBase: userViewModelProvider,
                    builder: (context, model, _) {
                      return AppStreamBuilder<Resource<User>>(
                          stream: model!.userStream,
                          initialData: Resource.none(),
                          dataBuilder: (context, data) {
                            return CommonText(
                              text: data?.data?.userName?.getInitials() ?? '',
                              style: const TextStyle(color: AppColors.primary),
                            );
                          });
                    }),
              )
            ],
    );
  }
}
