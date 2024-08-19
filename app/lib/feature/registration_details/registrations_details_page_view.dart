import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/bank_details_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/contact_info_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/enquiry_and_student_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/medical_details_editing.dart';
import 'package:app/molecules/registration_details/registration_editing_widgets/parent_info_editing.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/bank_details.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/contact_info.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/enquiry_and%20_student_details.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/medical_details.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/menu.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/parent_info.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/upload_docs.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_page.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/utils/url_launcher.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';

class RegistrationsDetailsPageView
    extends BasePageViewWidget<RegistrationsDetailsViewModel> {
      EnquiryDetailArgs? enquiryDetailArgs;
      EnquiryDetail? enquiryDetail;
  RegistrationsDetailsPageView(super.providerBase,{this.enquiryDetailArgs, required this.enquiryDetail});

  actionOnMenu(
      int index, BuildContext context, RegistrationsDetailsViewModel model) {
    switch (index) {
      case 0:
        return Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage);
      case 1:
        return Navigator.of(context).pushNamed(RoutePaths.payments);
      case 2:
        return UrlLauncher.launchPhone('+1234567890', context: context);
      case 3:
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 4:
        model.editRegistrationDetails.add(true);
        model.showMenuOnFloatingButton.add(false);
        return null;
      case 5:
        return Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage);
      case 6:
        return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, RegistrationsDetailsViewModel model) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListItem(
                image: AppImages.personIcon,
                name: "${enquiryDetailArgs?.studentName} ",
                year: enquiryDetailArgs?.academicYear??'',
                id: enquiryDetailArgs?.enquiryId??'',
                title: enquiryDetailArgs?.school??'',
                subtitle: "${enquiryDetailArgs?.grade} | ${enquiryDetailArgs?.board}",
                buttontext: "${enquiryDetailArgs?.enquiryStage}",
                compeletion: '25% Completed',
              ),
              CommonSizedBox.sizedBox(height: 20, width: 10),
              SizedBox(
                height: 40,
                child: CommonChipListPage(
                  chipValues: List.generate(
                    model.registrationDetails.length,
                    (index) => CommonChips(
                      isSelected: model.registrationDetails[index]
                          ['isSelected'],
                      name: model.registrationDetails[index]['name'],
                    ),
                  ),
                  onCallBack: (index) {
                    if (model.editRegistrationDetails.value) {
                    } else {
                      model.showWidget.add(index);
                    }
                    if(index == 0){
                      if(enquiryDetailArgs?.enquiryType == "IVT"){
                        model.getIvtDetails(enquiryID: enquiryDetailArgs?.enquiryId??'');
                      } else if(enquiryDetailArgs?.enquiryType == "PSA"){
                        model.getPsaDetails(enquiryID: enquiryDetailArgs?.enquiryId??'');
                      } else{
                        model.getNewAdmissionDetails(enquiryID: enquiryDetailArgs?.enquiryId??'');
                      }
                    }else if(index == 5){
                      model.getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId??'');
                    } else{
                      model.fetchAllDetails(model.registrationDetails[index]['infoType']);
                    }
                  },
                ),
              ),
              CommonSizedBox.sizedBox(height: 20, width: 10),
              AppStreamBuilder<bool>(
                  stream: model.editRegistrationDetails,
                  initialData: model.editRegistrationDetails.value,
                  dataBuilder: (context, editRegistrationDetailsData) {
                    return AppStreamBuilder<int>(
                      stream: model.showWidget,
                      initialData: model.showWidget.value,
                      dataBuilder: (context, data) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 300,
                          width: double.infinity,
                          child: SingleChildScrollView(
                              child: editRegistrationDetailsData!
                                  ? registrationsEditingWidgetAsPerIndex(
                                      model.showWidget.value, model)
                                  : registrationsWidgetAsPerIndex(
                                      model.showWidget.value,model)),
                        );
                      },
                    );
                  })
            ],
          ),
        ),
        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return data!
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                    )
                  : SizedBox.fromSize();
            }),

        AppStreamBuilder<bool>(
            stream: model.showMenuOnFloatingButton,
            initialData: model.showMenuOnFloatingButton.value,
            dataBuilder: (context, data) {
              return Positioned(
                  right: 20,
                  bottom: 100,
                  child: data!
                      ? Menu(
                          height: 453.h,
                          menuData: model.menuData,
                          onTap: (index) {
                            actionOnMenu(index, context, model);
                          },
                          showMenuOnFloatingButton:
                              model.showMenuOnFloatingButton,
                        )
                      : SizedBox.fromSize());
            })


      ],
    );
  }

  Widget registrationsEditingWidgetAsPerIndex(
      int index,  model) {
    switch (index) {
      case 0:
        return const EnquiryAndStudentEditing();
      case 1:
        return ParentInfoEditing(model: model);
      case 2:
        return ContactInfoEditing(
          model: model,
        );
      case 3:
        return MedicalDetailsEditing(
          model: model,
        );
      case 4:
        return BankDetailsEditing(
          model: model,
        );
      case 5:
        return AppStreamBuilder<Resource<EnquiryDetail>>(
        stream: model.enquiryDetail,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return UploadDocs(enquiryDetail: result?.data,);
            case Status.error:
              return const Center(child: Text('Enquiries not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
        });
      default:
        return const SizedBox.shrink();
    }
  }

  Widget registrationsWidgetAsPerIndex(int index, RegistrationsDetailsViewModel model) {
    switch (index) {
      case 0:
        return getEnquiryDetails(enquiryDetailArgs!,model);
      case 1:
        return AppStreamBuilder<Resource<ParentInfo>>(
          stream: model.parentDetail,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            switch (data?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return ParentDetail(parentInfo: model.parentInfo,);
            case Status.error:
              return const Center(child: Text('Enquiries not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
          },
          
        );
      case 2:
        return AppStreamBuilder<Resource<ContactDetails>>(
          stream: model.contactDetail,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            switch (data?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return ContactDetail(contactDetail: model.contactDetails,);
            case Status.error:
              return const Center(child: Text('Enquiries not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
          },
          
        );
      case 3:
        return AppStreamBuilder<Resource<MedicalDetails>>(
          stream: model.medicalDetail,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            switch (data?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return MedicalDetail(medicalDetails: data?.data);
            case Status.error:
              return const Center(child: Text('Enquiries not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
          },
          
        );
      case 4:
        return AppStreamBuilder<Resource<BankDetails>>(
        stream: model.bankDetail,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
           print(result?.data);
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return BankDetail(bankDetails: result?.data);
            case Status.error:
              return const Center(child: Text('Enquiries not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
        });
      case 5:
        return AppStreamBuilder<Resource<EnquiryDetail>>(
        stream: model.enquiryDetail,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return UploadDocs(enquiryDetail: result?.data,);
            case Status.error:
              return const Center(child: Text('Enquiries not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
        });
        // return UploadDocs();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget getEnquiryDetails(EnquiryDetailArgs enquiryDetailArgs, RegistrationsDetailsViewModel model){
    switch (enquiryDetailArgs.enquiryType) {
      case "IVT":
        return AppStreamBuilder<Resource<IVTDetail>>(
        stream: model.ivtDetails,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
            return EnquiryAndStudentDetails(enquiryDetailArgs: enquiryDetailArgs,ivtDetail: result?.data);
          case Status.error:
            return const Center(child: Text('Enquiries not found'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
          }
        });
      case "PSA":
      return AppStreamBuilder<Resource<PSADetail>>(
        stream: model.psaDetails,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
            return EnquiryAndStudentDetails(enquiryDetailArgs: enquiryDetailArgs,psaDetail: result?.data);
          case Status.error:
            return const Center(child: Text('Enquiries not found'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
          }
        });
      default:
      return AppStreamBuilder<Resource<NewAdmissionDetail>>(
        stream: model.newAdmissionDetails,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
            return EnquiryAndStudentDetails(enquiryDetailArgs: enquiryDetailArgs,newAdmissionDetail: result?.data);
          case Status.error:
            return const Center(child: Text('Enquiries not found'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
          }
        });
    }
  }
}
