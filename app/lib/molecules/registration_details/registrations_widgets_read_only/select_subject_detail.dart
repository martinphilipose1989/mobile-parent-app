import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_page.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSubjectDetail extends StatelessWidget {
  final RegistrationsDetailsViewModel model;
  const SelectSubjectDetail({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Select Subject",
          style: AppTypography.subtitle1.copyWith(color: AppColors.textDark),
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0),
          child: const Divider(color: AppColors.dividerColor),
        ),
        const PreSelectedSubject(
            crossAxisAlignment: CrossAxisAlignment.center,
            type: "Grade",
            value: "6"),
        PreSelectedSubject(
            type: "Compulsory Subject",
            value: model.complusorySubjectList.value.join(',')),
        const PreSelectedSubject(
            type: "SPA", value: "Selection of SPA will be done..."),
        Padding(
          padding: REdgeInsets.only(bottom: 16.0),
          child: const Divider(color: AppColors.dividerColor),
        ),
        CommonText(
          text: "Optional Subject",
          style: AppTypography.subtitle2.copyWith(color: AppColors.textDark),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          height: 40,
          child: CommonChipListPage(
            controller: model.controller,
            chipValues: List.generate(
              model.optionalSubjects.length,
              (index) => CommonChips(
                isSelected: model.optionalSubjects[index]
                    ['isSelected'],
                name: model.optionalSubjects[index]['name'],
              ),
            ),
            onCallBack: (index) {},
          ),
        )
      ],
    );
  }
}

class PreSelectedSubject extends StatelessWidget {
  const PreSelectedSubject(
      {super.key,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      required this.type,
      required this.value});

  final CrossAxisAlignment crossAxisAlignment;
  final String type;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Expanded(
            child: CommonText(
              text: type,
              style: AppTypography.body2.copyWith(color: AppColors.textGray),
            ),
          ),
          Expanded(
              child: CommonText(
            text: value,
            textAlign: TextAlign.end,
            style: AppTypography.subtitle2.copyWith(color: AppColors.textDark),
          )),
        ],
      ),
    );
  }
}
