import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/common_widgets/app_images.dart';

class CommonTicketCloseContainer extends StatefulWidget {
  final String ticketNo;
  final String? statusIcon;
  final String? status;
  final String time;
  final String title;
  final String subtitle;
  final String? image;
  final String name;
  const CommonTicketCloseContainer(
      {super.key,
      required this.ticketNo,
      required this.status,
      required this.statusIcon,
      required this.time,
      required this.title,
      required this.subtitle,
      this.image,
      required this.name});

  @override
  State<CommonTicketCloseContainer> createState() =>
      _CommonTicketCloseContainerState();
}

class _CommonTicketCloseContainerState
    extends State<CommonTicketCloseContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: AppColors.closeTile,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(children: [
                      SvgPicture.asset(AppImages.ticket),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.ticketNo,
                        style: AppTypography.caption.copyWith(
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w400),
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
                      SvgPicture.asset(AppImages.stop),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.status ?? "Open",
                        style: AppTypography.caption.copyWith(
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Flexible(
                    child: Text(
                      widget.time,
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
                text: widget.title,
                style: AppTypography.subtitle2,
              ),
              const SizedBox(
                height: 2,
              ),
              CommonText(
                text: widget.subtitle,
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
                              text: widget.name,
                              style: AppTypography.subtitle2
                                  .copyWith(color: AppColors.textGray),
                            )
                          ]),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        SvgPicture.asset(AppImages.close),
                      ])),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
