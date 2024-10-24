import 'package:app/di/states/viewmodels.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';

import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import '../../../utils/common_widgets/app_images.dart';

class CommonTicketReviewContainer extends StatelessWidget {
  final String ticketNo;
  final String? statusIcon;
  final String? status;
  final String time;
  final String title;
  final String subtitle;
  final String? image;
  final String name;
  final String? id;
  final int? communicationCount;
  const CommonTicketReviewContainer(
      {super.key,
      required this.ticketNo,
      required this.status,
      required this.statusIcon,
      required this.time,
      required this.title,
      required this.subtitle,
      required this.communicationCount,
      this.image,
      required this.name,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.listItem,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SvgPicture.asset(AppImages.ticket),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    ticketNo,
                    style: AppTypography.caption.copyWith(
                        color: AppColors.textGray, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Divider(
                    thickness: 2,
                    height: 2.h,
                    color: AppColors.divider,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  SvgPicture.asset(AppImages.status_open),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    status ?? "Open",
                    style: AppTypography.caption.copyWith(
                        color: AppColors.textGray, fontWeight: FontWeight.w400),
                  ),
                ]),
                SizedBox(
                  height: 20.h,
                ),
                Flexible(
                  child: Text(
                    time,
                    style: AppTypography.caption.copyWith(
                        color: AppColors.textGray, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            CommonText(
              text: title,
              style: AppTypography.subtitle2,
            ),
            const SizedBox(
              height: 2,
            ),
            CommonText(
              text: subtitle,
              style: AppTypography.body2.copyWith(color: AppColors.textGray),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 32.h,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(children: [
                          CircleAvatar(
                            child: SvgPicture.asset(
                              AppImages.avatar,
                              height: 32,
                              width: 32,
                            ),
                          ),
                          CommonText(
                            text: name,
                            style: AppTypography.subtitle2
                                .copyWith(color: AppColors.textGray),
                          )
                        ]),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                    context, RoutePaths.communicationPage,
                                    arguments: id)
                                .then(
                              (value) {
                                ProviderScope.containerOf(context)
                                    .read(ticketListProvider)
                                    .getTicketStatus();
                              },
                            );
                          },
                          child: badges.Badge(
                            showBadge: communicationCount == 0 ? false : true,
                            position:
                                badges.BadgePosition.topEnd(top: -10, end: -8),
                            badgeStyle: badges.BadgeStyle(
                                badgeColor:
                                    Theme.of(context).colorScheme.secondary),
                            badgeContent: Text(communicationCount.toString()),
                            child: SvgPicture.asset(AppImages.messages),
                          )),
                    ])),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                ),
                CommonText(
                    text: "Mark as Closed",
                    style: AppTypography.subtitle2.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
