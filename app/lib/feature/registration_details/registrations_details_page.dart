
import 'package:app/base/app_base_page.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/registration_details/registrations_details_page_view.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_appbar.dart';
import 'package:app/utils/common_widgets/common_elevated_button.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:flutter/material.dart' as flutter;

class RegistrationsDetailsPage extends BasePage<RegistrationsDetailsViewModel> {
  final String routeFrom;
  EnquiryDetailArgs? enquiryDetailArgs;
  ParentInfoEntity? parentInfoEntity;
  EnquiryDetail? enquiryDetail;
  RegistrationsDetailsPage({super.key, required this.routeFrom,this.enquiryDetailArgs,this.enquiryDetail, this.parentInfoEntity});


  @override
  flutter.State<RegistrationsDetailsPage> createState() =>
      _RegistrationsDetailsPageState();
}
class _RegistrationsDetailsPageState extends AppBasePageState<
    RegistrationsDetailsViewModel, RegistrationsDetailsPage> {
  @override
  void onModelReady(RegistrationsDetailsViewModel model) {
    model.enquiryDetailArgs = widget.enquiryDetailArgs;
    if (widget.routeFrom == "enquiry") {
      model.editRegistrationDetails.add(true);
    }
    if(widget.enquiryDetailArgs?.enquiryType == "IVT"){
      model.getIvtDetails(enquiryID: widget.enquiryDetailArgs?.enquiryId??'',
        isEdit: widget.routeFrom == "enquiry" ? true : model.editRegistrationDetails.value
      );
    }
    else if(widget.enquiryDetailArgs?.enquiryType == "PSA"){
      model.getPsaDetails(enquiryID: widget.enquiryDetailArgs?.enquiryId??'',
        isEdit: widget.routeFrom == "enquiry" ? true : model.editRegistrationDetails.value
      );
    }
    else{
      model.getNewAdmissionDetails(enquiryID: widget.enquiryDetailArgs?.enquiryId??'',
        isEdit: widget.routeFrom == "enquiry" ? true : model.editRegistrationDetails.value
      );
    }
  }

  @override
  PreferredSizeWidget? buildAppbar(RegistrationsDetailsViewModel model) {
    // TODO: implement buildAppbar
    return const CommonAppBar(
      appbarTitle: 'Registration Details',
      notShowNotificationAndUserBatch: false,
      showBackButton: true,
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    // TODO: implement scaffoldBackgroundColor
    return Colors.white;
  }

  @override
  Widget buildView(BuildContext context, RegistrationsDetailsViewModel model) {
    return SingleChildScrollView(child:RegistrationsDetailsPageView(provideBase(),enquiryDetailArgs: widget.enquiryDetailArgs,enquiryDetail: widget.enquiryDetail,));
  }

  @override
  ProviderBase<RegistrationsDetailsViewModel> provideBase() {
    return registrationsDetailsProvider;
  }

  @override
  Widget? buildFloatingButton(RegistrationsDetailsViewModel model) {

    return AppStreamBuilder<bool>(
      stream: model.editRegistrationDetails,
      initialData: model.editRegistrationDetails.value,
      dataBuilder: (context, data) {
        return data!
            ? SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
            AppStreamBuilder(
              stream: model.showWidget,
              initialData: model.showWidget.value,
              dataBuilder: (context, data) {
               return CommonElevatedButton(
                  onPressed: () {
                    if (model.showWidget.value == 0) {
                      if(widget.routeFrom == "enquiry"){
                        Navigator.pop(context);
                      }
                      else{
                        model.editRegistrationDetails.add(false);
                      }
                    } else {
                      if (model.showWidget.value == 1) {
                        model.saveParentDetails(widget.enquiryDetailArgs?.enquiryId??'');
                      } else if (model.showWidget.value == 2) {
                        model.saveContactDetails(widget.enquiryDetailArgs?.enquiryId??'');
                      } else if (model.showWidget.value == 3) {
                        model.saveMedicalDetails(widget.enquiryDetailArgs?.enquiryId??'');
                      } else if (model.showWidget.value == 4) {
                        model.saveBankDetails(widget.enquiryDetailArgs?.enquiryId??'');
                      }
                    }
                  },
                  text: model.showWidget.valueOrNull == 0 ? 'Cancel' : 'Save',
                  borderColor: Theme
                      .of(context)
                      .primaryColor,
                  borderWidth: 1,
                  width: 171.w,
                  height: 40.h,
                  textColor: Theme
                      .of(context)
                      .primaryColor,
                );}),
                CommonElevatedButton(
                  onPressed: () {
                    if (model.showWidget.value <= 5) {
                      ProviderScope
                          .containerOf(context)
                          .read(commonChipListProvider)
                          .highlightIndex
                          .add(ProviderScope
                          .containerOf(context)
                          .read(commonChipListProvider)
                          .highlightIndex
                          .value +
                          1);
                      model.showWidget.add(model.showWidget.value + 1);
                      if(model.showWidget.value == 5){
                        model.getEnquiryDetail(enquiryID: widget.enquiryDetailArgs?.enquiryId??'');
                      }
                      else{
                        model.fetchAllDetails(widget.enquiryDetailArgs?.enquiryId??'',model.registrationDetails[model.showWidget.value]['infoType']);
                      }
                    }
                  },
                  text: 'Next',
                  backgroundColor: AppColors.accent,
                  width: 171.w,
                  height: 40.h,
                  textColor: AppColors.accentOn,
                ),
              ],
            ))
            : AppStreamBuilder<bool>(
          stream: model.showMenuOnFloatingButton,
          initialData: model.showMenuOnFloatingButton.value,
          dataBuilder: (context, data) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                  height: 56.h,
                  width: 130.w,
                  child: CommonElevatedButton(
                    onPressed: () {
                      if (model.showMenuOnFloatingButton.value) {
                        model.showMenuOnFloatingButton.add(false);
                      } else {
                        model.showMenuOnFloatingButton.add(true);
                      }
                    },
                    text: data! ? 'Close' : 'Action',
                    icon: data ? Icons.close : Icons.add,
                    borderRadius: BorderRadius.circular(10),
                    textColor: Theme
                        .of(context)
                        .colorScheme
                        .onTertiary,
                    backgroundColor: AppColors.accent,
                    textStyle: AppTypography.subtitle2.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onTertiary),
                  )),
            );
          },
        );
      },
    );
  }
}

