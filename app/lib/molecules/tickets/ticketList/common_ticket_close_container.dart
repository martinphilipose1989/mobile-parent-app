import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tickets/ticket_list_view_model.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../../../utils/common_widgets/app_images.dart';

class CommonTicketCloseContainer extends StatelessWidget {
  final String ticketNo;
  final String? statusIcon;
  final String? status;
  final String time;
  final String title;
  final String subtitle;
  final String? image;
  final String name;
  final String? id;
  final int? index;
  final bool? showTextField;
  final int? communicationCount;
  const CommonTicketCloseContainer(
      {super.key,
      required this.ticketNo,
      required this.status,
      required this.statusIcon,
      required this.time,
      required this.title,
      required this.subtitle,
      required this.communicationCount,
      this.showTextField = false,
      this.image,
      required this.name,
      required this.id,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TicketListViewModel>(
        providerBase: ticketListProvider,
        builder: (context, model, child) {
          return Card(
            color: AppColors.closeTile,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
             SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SvgPicture.asset(AppImages.ticket,height: 14.h,),
                                             SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          ticketNo,
                          style: AppTypography.caption.copyWith(
                              color: AppColors.textGray,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Divider(
                          thickness: 2.w,
                          height: 2.h,
                          color: AppColors.divider,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        SvgPicture.asset(AppImages.stop,height: 14.h,),
                  SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          status ?? "Open",
                          style: AppTypography.caption.copyWith(
                              color: AppColors.textGray,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),

                      SizedBox(
                        width: 70.h,
                      ),
                    Expanded(
                        child: Text(
                          time,
                          style: AppTypography.caption.copyWith(
                              color: AppColors.textGray,
                              fontWeight: FontWeight.w400),
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
               SizedBox(
                    height: 2.h,
                  ),
                  CommonText(
                    text: subtitle,
                    style:
                        AppTypography.body2.copyWith(color: AppColors.textGray),
                  ),
               SizedBox(
                    height: 10.h,
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
                                    height: 32.h,
                                    width: 32.w,
                                  ),
                                ),
                                SizedBox(width: 5.w,),
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
                                  showBadge:
                                      communicationCount == 0 ? false : true,
                                  position: badges.BadgePosition.topEnd(
                                      top: -10, end: -8),
                                  badgeStyle: badges.BadgeStyle(
                                      badgeColor: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  badgeContent:
                                      Text(communicationCount.toString()),
                                  child: SvgPicture.asset(AppImages.messages,height: 20.h,),
                                )),
                          ])),
               Divider(
                    thickness: 2.w,
                  ),
       SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                      onTap: () {
                        model?.isReopenedCliked(index ?? 0);
                      },
                      child: AbsorbPointer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.sync,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            CommonText(
                                text: "ReOpen",
                                style: AppTypography.subtitle2.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ))
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  showTextField == false
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonTextFormField(
                            showAstreik: false,
                            maxLines: 1,
                            controller: model?.closeCommentController,
                            labelText: '',
                            hintText: 'Add Comments',
                            keyboardType: TextInputType.multiline,
                            suffix: InkWell(
                              onTap: () {
                                model?.sendCommunication(
                                    id ?? '',
                                    model.closeCommentController.text,
                                    'reopen');
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Icon(Icons.send_rounded),
                              ),
                            ),
                          ))
                ],
              ),
            ),
          );
        });
  }
}
