import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/details_item.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryAndStudentDetails extends StatelessWidget {
  PSADetail? psaDetail;
  IVTDetail? ivtDetail;
  NewAdmissionDetail? newAdmissionDetail;
  EnquiryDetailArgs? enquiryDetailArgs;
  EnquiryAndStudentDetails({super.key,this.enquiryDetailArgs,this.ivtDetail,this.newAdmissionDetail,this.psaDetail});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 358.w,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
            )),
        child: ExpansionTile(
            title: const CommonText(
              text: 'Enquiry Details',
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    DetailsItem(
                        title: 'Enquiry Number', subtitle: enquiryDetailArgs?.enquiryNumber?? 'ENAMDMS#4402'),
                    DetailsItem(title: 'Enquiry Date', subtitle: 
                      (newAdmissionDetail != null) ? newAdmissionDetail?.enquiryDate??'' : (psaDetail != null) ? psaDetail?.enquiryDate??'':
                        ivtDetail?.enquiryDate??''
                    ),
                    DetailsItem(
                        title: 'Enquiry Type', subtitle: enquiryDetailArgs?.enquiryType??''),
                    DetailsItem(
                        title: 'School location',
                        subtitle: enquiryDetailArgs?.school??''),
                  ],
                ),
              )
            ]),
      ),
      //
      Container(
        width: 358.w,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
            )),
        child: ExpansionTile(
            title: const CommonText(
              text: 'Student Details',
              style: AppTypography.subtitle2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    enquiryDetailArgs?.enquiryType == "IVT"? getIvtDetails(ivtDetail: ivtDetail): enquiryDetailArgs?.enquiryType == "PSA"? getPsaDetails(psaDetail: psaDetail): getAdmissionDetails(newAdmissionDetail: newAdmissionDetail)
                  ],
                ),
              )
            ]),
      ),
    ]);
  }

    Widget getPsaDetails({PSADetail? psaDetail}){
    return Column(
          children: [
            DetailsItem(title: "Enquiry Number", subtitle: enquiryDetailArgs?.enquiryNumber??''),
            DetailsItem(title: "Enquiry Type", subtitle: enquiryDetailArgs?.enquiryType??''),
            DetailsItem(title: "School Location", subtitle: psaDetail?.schoolLocation?.value??''),
            DetailsItem(title: "Student First Name", subtitle: psaDetail?.studentDetails?.firstName??''),
            DetailsItem(title: "Student Last name", subtitle: psaDetail?.studentDetails?.lastName??''),
            DetailsItem(title: "Grade", subtitle: psaDetail?.studentDetails?.grade?.value??''),
            DetailsItem(title: "DOB", subtitle: psaDetail?.studentDetails?.dob??''),
            DetailsItem(title: "Gender", subtitle: psaDetail?.studentDetails?.gender?.value??''),
            DetailsItem(title: "Existing School Name", subtitle: psaDetail?.existingSchoolDetails?.name??''),
            DetailsItem(title: "Existing school board", subtitle: psaDetail?.existingSchoolDetails?.board?.value??''),
            DetailsItem(title: "Existing school Grade", subtitle: psaDetail?.existingSchoolDetails?.grade?.value??''),
            DetailsItem(title: "PSA sub type", subtitle: psaDetail?.psaSubType?.value??''),
            DetailsItem(title: "PSA category", subtitle: psaDetail?.psaCategory?.value??''),
            DetailsItem(title: "PSA sub category", subtitle: psaDetail?.psaSubCategory?.value??''),
            DetailsItem(title: "Period of service", subtitle: psaDetail?.psaPeriodOfService?.value??''),
            DetailsItem(title: "PSA batch", subtitle: psaDetail?.psaBatch?.value??''),
            DetailsItem(
            title: "Parent Type",
            subtitle: newAdmissionDetail?.enquirerParent ?? ''),
        DetailsItem(
            title: "Global Id",
            subtitle: newAdmissionDetail?.enquirerParent == "Father"
                ? newAdmissionDetail?.parentDetails?.fatherDetails?.globalId ??
                    ''
                : newAdmissionDetail?.parentDetails?.motherDetails?.globalId ??
                    ''),
          ],
        );
  }

  Widget getAdmissionDetails({NewAdmissionDetail? newAdmissionDetail}){
    return Column(
          children: [
           DetailsItem(title: "Enquiry Number", subtitle: enquiryDetailArgs?.enquiryNumber??''),
            DetailsItem(title: "Enquiry Type", subtitle: enquiryDetailArgs?.enquiryType??''),
            DetailsItem(title: "School Location", subtitle: newAdmissionDetail?.schoolLocation?.value??''),
            DetailsItem(title: "Student First Name", subtitle: newAdmissionDetail?.studentDetails?.firstName??''),
            DetailsItem(title: "Student Last name", subtitle: newAdmissionDetail?.studentDetails?.lastName??''),
            DetailsItem(title: "Grade", subtitle: newAdmissionDetail?.studentDetails?.grade?.value??''),
            DetailsItem(title: "DOB", subtitle: newAdmissionDetail?.studentDetails?.dob??''),
            DetailsItem(title: "Gender", subtitle: newAdmissionDetail?.studentDetails?.gender?.value??''),
            DetailsItem(title: "Existing School Name", subtitle: newAdmissionDetail?.existingSchoolDetails?.name??''),
            DetailsItem(title: "Existing school board", subtitle: newAdmissionDetail?.existingSchoolDetails?.board?.value??''),
            DetailsItem(title: "Existing school Grade", subtitle: newAdmissionDetail?.existingSchoolDetails?.grade?.value??''), 
            DetailsItem(title: "Parent Type", subtitle: newAdmissionDetail?.enquirerParent??''),
            DetailsItem(title: "Global Id", subtitle: newAdmissionDetail?.enquirerParent == "Father" ? 
              newAdmissionDetail?.parentDetails?.fatherDetails?.globalId??'' :
              newAdmissionDetail?.parentDetails?.motherDetails?.globalId ??'' 
            ),
          ],
        );
  }

  Widget getIvtDetails({IVTDetail? ivtDetail}){
    return Column(
          children: [
            DetailsItem(title: "Enquiry Number", subtitle: enquiryDetailArgs?.enquiryNumber??''),
            DetailsItem(title: "Enquiry Type", subtitle: enquiryDetailArgs?.enquiryType??''),
            DetailsItem(title: "School Location", subtitle: ivtDetail?.schoolLocation?.value??''),
            DetailsItem(title: "Student First Name", subtitle: ivtDetail?.studentDetails?.firstName??''),
            DetailsItem(title: "Student Last name", subtitle: ivtDetail?.studentDetails?.lastName??''),
            DetailsItem(title: "Grade", subtitle: ivtDetail?.studentDetails?.grade?.value??''),
            DetailsItem(title: "DOB", subtitle: ivtDetail?.studentDetails?.dob??''),
            DetailsItem(title: "Gender", subtitle: ivtDetail?.studentDetails?.gender?.value??''),
            DetailsItem(title: "Existing School Name", subtitle: ivtDetail?.existingSchoolDetails?.name??''),
            DetailsItem(title: "Existing school board", subtitle: ivtDetail?.existingSchoolDetails?.board?.value??''),
            DetailsItem(title: "Existing school Grade", subtitle: ivtDetail?.existingSchoolDetails?.grade?.value??''), 
            DetailsItem(title: "Board", subtitle: ivtDetail?.board?.value??''),
            DetailsItem(title: "Course", subtitle: ivtDetail?.course?.value??''),
            DetailsItem(title: "Stream", subtitle: ivtDetail?.stream?.value??''),
            DetailsItem(title: "Shift", subtitle: ivtDetail?.shift?.value??''),
            DetailsItem(
            title: "Parent Type",
            subtitle: newAdmissionDetail?.enquirerParent ?? ''),
        DetailsItem(
            title: "Global Id",
            subtitle: newAdmissionDetail?.enquirerParent == "Father"
                ? newAdmissionDetail?.parentDetails?.fatherDetails?.globalId ??
                    ''
                : newAdmissionDetail?.parentDetails?.motherDetails?.globalId ??
                    ''),
          ],
        );
  }
}
