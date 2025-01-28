import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Infotitlerow extends StatelessWidget {
  final String infoText;
  final VoidCallback? onTap;
  final bool? visible;
  Infotitlerow({super.key, required this.infoText ,this.onTap, this.visible, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: infoText,
          style: AppTypography.subtitle1,
        ),
        Visibility(visible: visible??false,
          child: InkWell(
            child: SvgPicture.asset(AppImages.editIcon),
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
