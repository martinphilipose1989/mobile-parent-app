import 'package:app/di/states/viewmodels.dart';
import 'package:app/model/resource.dart';

import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/extension/string_formatter.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final PreferredSizeWidget? bottom;
  const CommonAppBar(
      {super.key,
      required this.appbarTitle,
      this.showBackButton = false,
      this.leading,
      this.notShowNotificationAndUserBatch = false,
      this.onBackPressed,
      this.bottom})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: AppColors.primaryLighter),
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
                  child: const Icon(Icons.menu_outlined),
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
                    //  Scaffold.of(context).openDrawer();
                    Navigator.pushNamed(context, RoutePaths.notification);
                    // Navigator.of(context).push(MaterialPageRoute<void>(
                    // fullscreenDialog: true,
                    // builder: (BuildContext context) {}

                    // ProviderScope.containerOf(context)
                    //                    //     .read(notificationProvider).fetchNotification(notificationRequestModel: NotificationRequestModel(userId: 305, userType: 2, type: type, limit: limit, page: page))
                    //    showBottomSheet(backgroundColor: Colors.white,
                    //    context: context,
                    // // Makes the bottom sheet full-screen
                    //    shape: RoundedRectangleBorder(
                    //    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    //    ),
                    //  builder: (context) => NotificationPage(), // Your custom page widget
                    //    );
                  },
                  child: SvgPicture.asset(AppImages.notificationLogo),
                ),
              ),
              BaseWidget(
                providerBase: userViewModelProvider,
                builder: (context, model, _) => GestureDetector(
                  onTap: () {
                    CommonPopups().showActions(context,      (shouldRoute) {
                      model?.logOut();
                    }, (){
                      Navigator.pushNamed(context, RoutePaths.profile);
                    });
                    // CommonPopups().showError(
                    //   context,
                    //   "Are you sure you want to logout?",

                    // );
                  },
                  child: Container(
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
                        providerBase: dashboardViewModelProvider,
                        builder: (context, dasboardModel, _) =>
                            AppStreamBuilder<Resource<User>>(
                                stream: dasboardModel!.userStream,
                                initialData: Resource.none(),
                                dataBuilder: (context, data) {
                                  return CommonText(
                                    text: data?.data?.userName?.getInitials() ??
                                        '',
                                    style: const TextStyle(
                                        color: AppColors.primary),
                                  );
                                }),
                      )),
                ),
              )
            ],
      bottom: bottom,
    );
  }
}
