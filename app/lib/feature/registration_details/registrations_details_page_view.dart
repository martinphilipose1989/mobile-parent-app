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
import 'package:app/molecules/registration_details/registrations_widgets_read_only/select_subject_detail.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/upload_docs.dart';
import 'package:app/molecules/registration_details/registrations_widgets_read_only/v_a_s_details.dart';
import 'package:app/molecules/tracker/admissions/admissions_list_item.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_page.dart';
import 'package:app/utils/common_widgets/common_chip_list/common_chip_list_view_model.dart';
import 'package:app/utils/common_widgets/common_loader/common_app_loader.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
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
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailView())? Navigator.of(context).pushNamed(
          RoutePaths.detailsViewSchoolTourPage,arguments: enquiryDetailArgs
        ).then((value){
          model.getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId??'');
        }) : Navigator.of(context)
            .pushNamed(RoutePaths.scheduleSchoolTourPage,arguments: {'enquiryDetailArgs': enquiryDetailArgs}).then((value) {
              if(value!=null){
                model.getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId??'');
              }
            },);
      case 1:
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context).pushNamed(RoutePaths.payments);
      case 2:
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchPhone('+91 6003000700', context: context);
      case 3:
        model.showMenuOnFloatingButton.add(false);
        return UrlLauncher.launchEmail('example@example.com', context: context);
      case 4:{
        model.showMenuOnFloatingButton.add(false);
        model.getMdmAttribute(infoType: 'grade');
        model.getMdmAttribute(infoType: 'schoolLocation');
        model.getMdmAttribute(infoType: 'gender');
        model.getMdmAttribute(infoType: 'board');
        model.getMdmAttribute(infoType: 'course');
        model.getMdmAttribute(infoType: 'stream');
        model.getMdmAttribute(infoType: 'shift');
        model.getMdmAttribute(infoType: 'batch');
        model.getMdmAttribute(infoType: 'psaSubType');
        model.getMdmAttribute(infoType: 'psaCategory');
        model.getMdmAttribute(infoType: 'psaSubCategory');
        model.getMdmAttribute(infoType: 'periodOfService');
        model.getMdmAttribute(infoType: "country");
        model.getMdmAttribute(infoType: "state");
        model.getMdmAttribute(infoType: "city");
        model.getMdmAttribute(infoType: "bloodGroup");
        model.getMdmAttribute(infoType: "occupation");
        model.getMdmAttribute(infoType: "qualification");
        model.getMdmAttribute(infoType: "religion");
        model.getMdmAttribute(infoType: "caste");
        model.getMdmAttribute(infoType: "subcaste");
        model.getMdmAttribute(infoType: "mother_tongue");
        model.getMdmAttribute(infoType: "organization");
        model.getMdmAttribute(infoType: "designation");
        model.getMdmAttribute(infoType: "nationality");
        model.getMdmAttribute(infoType: "designation");
        model.getMdmAttribute(infoType: "organization");
        model.getMdmAttribute(infoType: "personalise_learning_needs");

        if(model.showWidget.value == 0){
          if(enquiryDetailArgs?.enquiryType == "IVT"){
            model.getIvtDetails(enquiryID: enquiryDetailArgs?.enquiryId??'',
              isEdit: true
            );
          }
          else if(enquiryDetailArgs?.enquiryType == "PSA"){
            model.getPsaDetails(enquiryID: enquiryDetailArgs?.enquiryId??'',
              isEdit: true
            );
          }
          else{
            model.getNewAdmissionDetails(enquiryID: enquiryDetailArgs?.enquiryId??'',
              isEdit: true
            );
          }
        }
        if(model.showWidget.value == 1){
          model.fetchAllDetails(enquiryDetailArgs?.enquiryId??'', "ParentInfo");
        }
        if(model.showWidget.value == 2){
          model.fetchAllDetails(enquiryDetailArgs?.enquiryId??'', "ContactInfo");
        }
        if(model.showWidget.value == 3){
          model.fetchAllDetails(enquiryDetailArgs?.enquiryId??'', "MedicalInfo");
        }
        if(model.showWidget.value == 4){
          model.fetchAllDetails(enquiryDetailArgs?.enquiryId??'', "BankInfo");
        }
        if(enquiryDetailArgs?.admissionStatus == "Approved"){
          if(model.registrationDetails.any((element)=>(element["name"]!="Select Subject" || element["name"] != "VAS"))){
            model.registrationDetails.addAll({
              {'name': 'Select Subject', 'isSelected': false, 'infoType': ''},
              {'name': 'VAS', 'isSelected': false, 'infoType': ''},
            });
          }
        }
        model.editRegistrationDetails.add(true);
        return null;
      }
      case 5:
        model.showMenuOnFloatingButton.add(false);
        return (model.isDetailViewCompetency())? Navigator.of(context).pushNamed(
          RoutePaths.competencyTestDetailPage,arguments: enquiryDetailArgs
        ).then((value){
          model.getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId??'');
        }) : Navigator.of(context)
           .pushNamed(RoutePaths.scheduleCompetencyTest,arguments: {'enquiryDetailArgs': enquiryDetailArgs}).then((value){
            if(value!=null){
              model.getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId??'');
            }
           });
      case 6:
        model.showMenuOnFloatingButton.add(false);
        return Navigator.of(context)
            .pushNamed(RoutePaths.enquiriesTimelinePage,arguments: enquiryDetailArgs);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, RegistrationsDetailsViewModel model) {
    return AppStreamBuilder<bool>(
      stream: model.isLoading,
      initialData: model.isLoading.value,
      dataBuilder: (context, snapshot) {
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
                    id: enquiryDetailArgs?.enquiryNumber??'',
                    title: enquiryDetailArgs?.school??'',
                    subtitle: "${enquiryDetailArgs?.grade} | ${enquiryDetailArgs?.board}",
                    buttontext: "${enquiryDetailArgs?.currentStage}",
                    compeletion: enquiryDetailArgs?.formCompletionPercentage == null ? '': "${enquiryDetailArgs?.formCompletionPercentage??0}% Completed",
                    status: enquiryDetailArgs?.status??'',
                  ),
                  CommonSizedBox.sizedBox(height: 20, width: 10),
                  AppStreamBuilder<bool>(
                    stream: model.editRegistrationDetails, 
                    initialData: model.editRegistrationDetails.value, 
                    dataBuilder: (context, data) {
                      return SizedBox(
                        height: 40,
                        child: CommonChipListPage(
                          controller: model.controller,
                          chipValues: List.generate(
                            model.registrationDetails.length,
                            (index) => CommonChips(
                              isSelected: model.registrationDetails[index]
                                  ['isSelected'],
                              name: model.registrationDetails[index]['name'],
                            ),
                          ),
                          onCallBack: (index) {
                            if(model.showWidget.value == index){
                              return;
                            }
                            model.showWidget.add(index);
                            if(index == 0){
                              if(enquiryDetailArgs?.enquiryType == "IVT"){
                                model.getIvtDetails(enquiryID: enquiryDetailArgs?.enquiryId??'');
                              } else if(enquiryDetailArgs?.enquiryType == "PSA"){
                                model.getPsaDetails(enquiryID: enquiryDetailArgs?.enquiryId??'');
                              } else{
                                model.getNewAdmissionDetails(enquiryID: enquiryDetailArgs?.enquiryId??'',isEdit: true);
                              }
                            } if(index == 5){
                              model.getEnquiryDetail(enquiryID: enquiryDetailArgs?.enquiryId??'');
                            }  if (index > 0 && index < 5){
                              model.fetchAllDetails(enquiryDetailArgs?.enquiryId??'',model.registrationDetails[index]['infoType']);
                            } 
                          },
                        ),
                      );
                    },
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
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom+55),
                                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                  child: editRegistrationDetailsData!
                                      ? registrationsEditingWidgetAsPerIndex(
                                          model.showWidget.value, model,context)
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
                      bottom: 110,
                      child: data!
                          ? Menu(
                              height: 350.h,
                              menuData: model.menuData,
                              onTap: (index) {
                                actionOnMenu(index, context, model);
                              },
                              showMenuOnFloatingButton:
                                  model.showMenuOnFloatingButton,
                            )
                          : SizedBox.fromSize());
                }),
           if(model.isLoading.value)...[const CommonAppLoader()]
          ],
        );
      }
    );
  }

  Widget registrationsEditingWidgetAsPerIndex(int index,RegistrationsDetailsViewModel model,BuildContext context) {
    switch (index) {
      case 0:
        return getEnquiryDetails(enquiryDetailArgs??EnquiryDetailArgs(), model, model.editRegistrationDetails.value);
      case 1:
        return AppStreamBuilder<Resource<ParentInfo>>(
          stream: model.parentDetail,
          initialData: Resource.none(),
          onData: (value) {
          },
          dataBuilder: (context, data) {
            if(data?.status == Status.loading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(data?.status == Status.success){
              return ParentInfoEditing(model: model);
            }
            if(data?.status == Status.error){
              return ParentInfoEditing(model: model);
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      case 2:
        return AppStreamBuilder<Resource<ContactDetails>>(
          stream: model.contactDetail,
          initialData: Resource.none(),
          onData: (value) {
            
          },
          dataBuilder: (context, data) {
            if (data?.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(data?.status == Status.success){
              return ContactInfoEditing(model: model);
            }
            if(data?.status == Status.error){
              return ContactInfoEditing(model: model);
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      case 3:
        return AppStreamBuilder<Resource<MedicalDetails>>(
          stream: model.medicalDetail,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            if (data?.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(data?.status == Status.success){
              return MedicalDetailsEditing(model: model);
            }
            if(data?.status == Status.error){
              return MedicalDetailsEditing(model: model);
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      case 4:
        return AppStreamBuilder<Resource<BankDetails>>(
          stream: model.bankDetail,
          initialData: Resource.none(),
          onData: (value) {
            
          },
          dataBuilder: (context, data) {
            if (data?.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(data?.status == Status.success){
              return BankDetailsEditing(model: model);
            }
            if(data?.status == Status.error){
              return BankDetailsEditing(model: model);
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      case 5:
        return AppStreamBuilder<Resource<EnquiryDetailBase>>(
          stream: model.enquiryDetail,
          initialData: Resource.none(),
          onData: (value) {
            if(value.status == Status.success){
              value.data?.data?.enquiryDocuments?.forEach((element){
                model.isDocumentUploaded.add(ValueNotifier((element.file??'').isNotEmpty || element.file!=null));
              });
            }
          },
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return UploadDocs(enquiryDetail: result?.data?.data,model: model,enquiryID: enquiryDetailArgs?.enquiryId,);
            case Status.error:
              return const Center(child: Text('Documents not found'),);
            default:
              return const Center(child: CircularProgressIndicator(),);
          }
        });
      case 6:
        return AppStreamBuilder<Resource<SubjectListResponse>>(
          stream: model.getSubjectList,
          initialData: Resource.none(),
          dataBuilder: (context, data) {
            switch (data?.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator(),);
              case Status.success:
                return SelectSubjectDetail(model: model,);
              case Status.error:
                return const Center(child: CommonText(text: "Subjects not found"),);
              default:
                return const Center(child: CircularProgressIndicator(),);  
            }
          },
        ); 
      case 7: 
        return VASDetails(); 
      default:
        return AppStreamBuilder<Resource<EnquiryDetailBase>>(
            stream: model.enquiryDetail,
            initialData: Resource.none(),
            dataBuilder: (context, result) {
              return model.showPopUP(context);

      });
    }
  }


  Widget registrationsWidgetAsPerIndex(int index, RegistrationsDetailsViewModel model) {
    switch (index) {
      case 0:
        return getEnquiryDetails(enquiryDetailArgs!,model,model.editRegistrationDetails.value);
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
        return AppStreamBuilder<Resource<EnquiryDetailBase>>(
        stream: model.enquiryDetail,
          initialData: Resource.none(),
          onData: (value) {
            if(value.status == Status.success){
              value.data?.data?.enquiryDocuments?.forEach((element){
                model.isDocumentUploaded.add(ValueNotifier((element.file??'').isNotEmpty || element.file!=null));
              });
            }
          },
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
          return UploadDocs(enquiryDetail: result?.data?.data,model: model,enquiryID: enquiryDetailArgs?.enquiryId);
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

  Widget getEnquiryDetails(EnquiryDetailArgs enquiryDetailArgs, RegistrationsDetailsViewModel model,bool isEditing){
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
            return (isEditing)? EnquiryAndStudentEditing(
                          model: model,
                          enquiryDetailArgs:
                              enquiryDetailArgs,
                        )
                      : EnquiryAndStudentDetails(enquiryDetailArgs: enquiryDetailArgs,ivtDetail: result?.data);
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
            return (isEditing)? EnquiryAndStudentEditing(
                          model: model,
                          enquiryDetailArgs:
                              enquiryDetailArgs,
                        )
                      : EnquiryAndStudentDetails(enquiryDetailArgs: enquiryDetailArgs,psaDetail: result?.data);
          case Status.error:
            return const Center(child: Text('Enquiries not found'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
          }
        });
      default:
      return AppStreamBuilder<Resource<NewAdmissionBase>>(
        stream: model.newAdmissionDetails,
          initialData: Resource.none(),
          dataBuilder: (context, result) {
          switch (result?.status){
          case Status.loading:
          return const Center(child: CircularProgressIndicator(),);
          case Status.success:
            return (isEditing)? EnquiryAndStudentEditing(
                          model: model,
                          enquiryDetailArgs:
                              enquiryDetailArgs,
                        )
                      : EnquiryAndStudentDetails(enquiryDetailArgs: enquiryDetailArgs,newAdmissionDetail: result?.data?.data);
          case Status.error:
            return const Center(child: Text('Enquiries not found'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
          }
        });
    }
  }
}
