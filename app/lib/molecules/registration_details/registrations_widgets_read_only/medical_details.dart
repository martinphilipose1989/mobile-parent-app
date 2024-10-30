import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MedicalDetail extends StatelessWidget {
  final MedicalDetails? medicalDetails;
  const MedicalDetail({super.key, this.medicalDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonText(
          text: "Medical Information",
          style: AppTypography.subtitle1,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(
            title: 'Has the child ever been hospitalized?', subtitle: medicalDetails?.isChildHospitalised??false ? "Yes" : "No"),
        if(medicalDetails?.isChildHospitalised??false)...[
          DetailsItem(title: 'Year of last hospitalisation', subtitle: medicalDetails?.yearOfHospitalization??''),
          DetailsItem(
            title: 'The reason for hospitalisation', subtitle: medicalDetails?.reasonOfHopitalization??''),
          CommonSizedBox.sizedBox(height: 10, width: 10),
        ],
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Physical Disabilities', subtitle: medicalDetails?.hasPhysicalDisability??false ? "Yes" : "No"),
        if(medicalDetails?.hasPhysicalDisability??false)...[
          DetailsItem(title: 'Special Disability', subtitle: medicalDetails?.physicalDisabilityDescription??''),
          CommonSizedBox.sizedBox(height: 10, width: 10),
        ],
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Medical History', subtitle: medicalDetails?.hasMedicalHistory??false ? "Yes" : "No"),
        if(medicalDetails?.hasMedicalHistory??false)...[
          DetailsItem(title: 'Special Medical History', subtitle: medicalDetails?.medicalHistoryDescription??''),
          CommonSizedBox.sizedBox(height: 10, width: 10),
        ],
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Allergies', subtitle: medicalDetails?.hasAllergy??false ? "Yes" : "No"),
        if(medicalDetails?.hasAllergy??false)...[
          DetailsItem(title: 'Specify Allergies', subtitle: medicalDetails?.allergyDescription??''),
          CommonSizedBox.sizedBox(height: 10, width: 10),
        ],
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Blood Group', subtitle: medicalDetails?.bloodGroup??''),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.textPaleGray,
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        DetailsItem(title: 'Personalized Learning Needs', subtitle: medicalDetails?.hasPersonalisedLearningNeeds??false ?  "Yes" : "No"),
        if(medicalDetails?.hasPersonalisedLearningNeeds??false)...[
          DetailsItem(title: 'Personalized Learning Needs', subtitle:
          (medicalDetails?.personalisedLearningNeedsDescription is CommonDataClass) ? medicalDetails?.personalisedLearningNeedsDescription?.value??'' : 
              medicalDetails?.personalisedLearningNeedsDescription??''
          ),
        ]
      ],
    );
  }
}
