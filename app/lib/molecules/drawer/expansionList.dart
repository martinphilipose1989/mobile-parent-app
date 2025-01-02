import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tabbar/tabbar_page.dart';
import 'package:app/feature/tabbar/tabbar_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../feature/tabbar/tabbar_class.dart';
import '../../themes_setup.dart';
import '../../utils/app_typography.dart';

class CustomExpansionList extends StatelessWidget {
  final List<DrawerItems>? nameList;
  final VoidCallback? onTap;
  final String title;

  const CustomExpansionList({
    super.key,
    this.nameList,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TabbarViewModel>(
      builder: (BuildContext context, TabbarViewModel? model, Widget? child) {
        return ExpansionTile(
          showTrailingIcon: true,
          title: Container(
              child: Text(
            title,
            style: AppTypography.h6,
          )),
          children: nameList!
              .map((e) => Visibility(
                    visible: e.isActive ?? true,
                    child: AppStreamBuilder(
                        stream: model!.selectedIndexStream,
                        initialData: Resource.none(),
                        dataBuilder: (context, data) {
                          return ListTile(
                            leading: Container(
                                width: 50.w,
                                child: SvgPicture.asset(e.icon ?? "")),
                            selected: model.selectedMenu.value == e,
                            // selected: isSelected,
                            selectedTileColor: AppColors.listItem,
                            title: Text(e.menu ?? ""),
                            onTap: () {
                              //model.isSelected.value=true;n
                              model?.selectedMenu.value = e;

                              if (e.onTap != null) {
                                e.onTap?.call();
                              }

                              if (e.route != null && e.route!.isNotEmpty) {
                                Navigator.pushNamed(
                                    context, e.route!); // Navigate to the route
                              }
                            },
                          );
                        }),
                  ))
              .toList(),
        );
      },
      providerBase: tabbarViewModelProvider,
    );
  }
}
