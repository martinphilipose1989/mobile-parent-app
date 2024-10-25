import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class EnquiriesDetailsViewWidget extends StatelessWidget {
  PSADetail? psaDetail;
  IVTDetail? ivtDetail;
  NewAdmissionDetail? newAdmissionDetail;
  EnquiryDetailArgs? enquiryDetailArgs;
  EnquiriesDetailsViewWidget({super.key,this.ivtDetail,this.newAdmissionDetail,this.psaDetail, this.enquiryDetailArgs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        enquiryDetailArgs?.enquiryType == "IVT"? getIvtDetails(ivtDetail: ivtDetail): enquiryDetailArgs?.enquiryType == "PSA"? getPsaDetails(psaDetail: psaDetail): getAdmissionDetails(newAdmissionDetail: newAdmissionDetail)
      ],
    );
  }

  Widget getPsaDetails({PSADetail? psaDetail}){
    return Column(
          children: [
            _detailItem(title: "Enquiry Number", subtitle: enquiryDetailArgs?.enquiryNumber??''),
            _detailItem(title: "Enquiry Type", subtitle: enquiryDetailArgs?.enquiryType??''),
            _detailItem(title: "School Location", subtitle: psaDetail?.schoolLocation?.value??''),
            _detailItem(title: "Student First Name", subtitle: psaDetail?.studentDetails?.firstName??''),
            _detailItem(title: "Student Last name", subtitle: psaDetail?.studentDetails?.lastName??''),
            _detailItem(title: "Grade", subtitle: psaDetail?.studentDetails?.grade?.value??''),
            _detailItem(title: "DOB", subtitle: psaDetail?.studentDetails?.dob??''),
            _detailItem(title: "Gender", subtitle: psaDetail?.studentDetails?.gender?.value??''),
            _detailItem(title: "Existing School Name", subtitle: psaDetail?.existingSchoolDetails?.name??''),
            _detailItem(title: "Existing school board", subtitle: psaDetail?.existingSchoolDetails?.board?.value??''),
            _detailItem(title: "Existing school Grade", subtitle: psaDetail?.existingSchoolDetails?.grade?.value??''),
            _detailItem(title: "PSA sub type", subtitle: psaDetail?.psaSubType?.value??''),
            _detailItem(title: "PSA category", subtitle: psaDetail?.psaCategory?.value??''),
            _detailItem(title: "PSA sub category", subtitle: psaDetail?.psaSubCategory?.value??''),
            _detailItem(title: "Period of service", subtitle: psaDetail?.psaPeriodOfService?.value??''),
            _detailItem(title: "PSA batch", subtitle: psaDetail?.psaBatch?.value??''),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.textPaleGray,
            ),
            _detailItem(title: "Parent Type", subtitle: psaDetail?.enquirerParent??''),
            _detailItem(title: "Global Id", subtitle: psaDetail?.enquirerParent == "Father" ? psaDetail?.parentDetails?.fatherDetails?.globalId??"":psaDetail?.parentDetails?.motherDetails?.globalId??""),
            _detailItem(title: "Parent First Name", subtitle: psaDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.firstName??"":newAdmissionDetail?.parentDetails?.motherDetails?.firstName??""),
            _detailItem(title: "Parent Last Name", subtitle: psaDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.lastName??"":newAdmissionDetail?.parentDetails?.motherDetails?.lastName??""),
            _detailItem(title: "Parent Email ID", subtitle: psaDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.email??"":newAdmissionDetail?.parentDetails?.motherDetails?.email??""),
            _detailItem(title: "Parent Contact Number", subtitle: psaDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.mobile??"":newAdmissionDetail?.parentDetails?.motherDetails?.mobile??""),
            const SizedBox(height: 100,)
          ],
        );
  }

  Widget getAdmissionDetails({NewAdmissionDetail? newAdmissionDetail}){
    return Column(
          children: [
            _detailItem(title: "Enquiry Number", subtitle: enquiryDetailArgs?.enquiryNumber??''),
            _detailItem(title: "Enquiry Type", subtitle: enquiryDetailArgs?.enquiryType??''),
            _detailItem(title: "School Location", subtitle: newAdmissionDetail?.schoolLocation?.value??''),
            _detailItem(title: "Student First Name", subtitle: newAdmissionDetail?.studentDetails?.firstName??''),
            _detailItem(title: "Student Last name", subtitle: newAdmissionDetail?.studentDetails?.lastName??''),
            _detailItem(title: "Grade", subtitle: newAdmissionDetail?.studentDetails?.grade?.value??''),
            _detailItem(title: "DOB", subtitle: newAdmissionDetail?.studentDetails?.dob??''),
            _detailItem(title: "Gender", subtitle: newAdmissionDetail?.studentDetails?.gender?.value??''),
            _detailItem(title: "Existing School Name", subtitle: newAdmissionDetail?.existingSchoolDetails?.name??''),
            _detailItem(title: "Existing school board", subtitle: newAdmissionDetail?.existingSchoolDetails?.board?.value??''),
            _detailItem(title: "Existing school Grade", subtitle: newAdmissionDetail?.existingSchoolDetails?.grade?.value??''), 
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.textPaleGray,
            ),
            _detailItem(title: "Parent Type", subtitle: newAdmissionDetail?.enquirerParent??''),
            _detailItem(title: "Global Id", subtitle: newAdmissionDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.globalId??"":newAdmissionDetail?.parentDetails?.motherDetails?.globalId??""),
            _detailItem(title: "Parent First Name", subtitle: newAdmissionDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.firstName??"":newAdmissionDetail?.parentDetails?.motherDetails?.firstName??""),
            _detailItem(title: "Parent Last Name", subtitle: newAdmissionDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.lastName??"":newAdmissionDetail?.parentDetails?.motherDetails?.lastName??""),
            _detailItem(title: "Parent Email ID", subtitle: newAdmissionDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.email??"":newAdmissionDetail?.parentDetails?.motherDetails?.email??""),
            _detailItem(title: "Parent Contact Number", subtitle: newAdmissionDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.mobile??"":newAdmissionDetail?.parentDetails?.motherDetails?.mobile??""),
            const SizedBox(height: 100,)
          ],
        );
  }

  Widget getIvtDetails({IVTDetail? ivtDetail}){
    return Column(
          children: [
            _detailItem(title: "Enquiry Number", subtitle: enquiryDetailArgs?.enquiryNumber??''),
            _detailItem(title: "Enquiry Type", subtitle: enquiryDetailArgs?.enquiryType??''),
            _detailItem(title: "School Location", subtitle: ivtDetail?.schoolLocation?.value??''),
            _detailItem(title: "Student First Name", subtitle: ivtDetail?.studentDetails?.firstName??''),
            _detailItem(title: "Student Last name", subtitle: ivtDetail?.studentDetails?.lastName??''),
            _detailItem(title: "Grade", subtitle: ivtDetail?.studentDetails?.grade?.value??''),
            _detailItem(title: "DOB", subtitle: ivtDetail?.studentDetails?.dob??''),
            _detailItem(title: "Gender", subtitle: ivtDetail?.studentDetails?.gender?.value??''),
            _detailItem(title: "Existing School Name", subtitle: ivtDetail?.existingSchoolDetails?.name??''),
            _detailItem(title: "Existing school board", subtitle: ivtDetail?.existingSchoolDetails?.board?.value??''),
            _detailItem(title: "Existing school Grade", subtitle: ivtDetail?.existingSchoolDetails?.grade?.value??''), 
            _detailItem(title: "Board", subtitle: ivtDetail?.board?.value??''),
            _detailItem(title: "Course", subtitle: ivtDetail?.course?.value??''),
            _detailItem(title: "Stream", subtitle: ivtDetail?.stream?.value??''),
            _detailItem(title: "Shift", subtitle: ivtDetail?.shift?.value??''),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.textPaleGray,
            ),
            _detailItem(title: "Parent Type", subtitle: ivtDetail?.enquirerParent??''),
            _detailItem(title: "Global Id", subtitle: ivtDetail?.enquirerParent == "Father" ? ivtDetail?.parentDetails?.fatherDetails?.globalId??"": ivtDetail?.parentDetails?.motherDetails?.globalId??""),
            _detailItem(title: "Parent First Name", subtitle: ivtDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.firstName??"":newAdmissionDetail?.parentDetails?.motherDetails?.firstName??""),
            _detailItem(title: "Parent Last Name", subtitle: ivtDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.lastName??"":newAdmissionDetail?.parentDetails?.motherDetails?.lastName??""),
            _detailItem(title: "Parent Email ID", subtitle: ivtDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.email??"":newAdmissionDetail?.parentDetails?.motherDetails?.email??""),
            _detailItem(title: "Parent Contact Number", subtitle: ivtDetail?.enquirerParent == "Father" ? newAdmissionDetail?.parentDetails?.fatherDetails?.mobile??"":newAdmissionDetail?.parentDetails?.motherDetails?.mobile??""),
            const SizedBox(height: 100,)
          ],
        );
  }

  _detailItem({title, subtitle}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CommonText(
                text: title,
                style: AppTypography.body2,
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: CommonText(
                  text: subtitle,
                  style: AppTypography.button,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
