import 'package:app/model/resource.dart';
import 'package:app/molecules/profile_picker.dart';
import 'package:app/utils/common_primary_elevated_button.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/country_picker_phone_text_field.dart';
import 'package:app/utils/data_status_widget.dart';
import 'package:app/utils/date_time_utils.dart';
import 'package:app/utils/dateformate.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'create_edit_gate_pass_viewmodel.dart';

class CreateEditGatePassPageView
    extends BasePageViewWidget<CreateEditGatePassViewModel> {
  // ignore: use_super_parameters
  CreateEditGatePassPageView(ProviderBase<CreateEditGatePassViewModel> model)
      : super(model);

  @override
  Widget build(BuildContext context, CreateEditGatePassViewModel model) {
    return Builder(builder: (context) {
      return Form(
        key: model.formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: AppStreamBuilder<Resource<User>>(
                      stream: model.userStream,
                      initialData: Resource.none(),
                      onData: (data) {
                        if (data.data == null) return;
                        model.setUserData(userData: data.data);
                      },
                      dataBuilder: (context, countryDialCode) {
                        return Column(
                          children: [
                            ProfilePicker(
                                model: model,
                                onProfilePick: () {
                                  model.pickImage(UpoladFileTypeEnum.camera);
                                }),
                            SizedBox(height: 12.h),
                            CommonTextFormField(
                              bottomPadding: 16,
                              showAstreik: true,
                              labelText: Strings.of(context).parent_name,
                              readOnly: true,
                              controller: model.visitorNameController,
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[a-zA-Z\s]+$'))
                              ],
                              validator: (value) {
                                if (Validator.isEmpty(value!)) {
                                  return Strings.of(context).parent_name_cannot_be_empty;
                                }
                                return null;
                              },
                            ),
                            if (model.selectedStudent != null)
                              StreamBuilder<
                                      GetGuardianStudentDetailsStudentModel?>(
                                  stream: model.studentDataStream,
                                  builder: (context, snapshot) {
                                    return CommonTextFormField(
                                      bottomPadding: 16,
                                      showAstreik: true,
                                      labelText: Strings.of(context).student_name,
                                      readOnly: true,
                                      controller: model.studentNameController,
                                      keyboardType: TextInputType.name,
                                      validator: model.selectedStudent == null
                                          ? null
                                          : (value) {
                                              if (Validator.isEmpty(value!)) {
                                                return Strings.of(context).student_name_cannot_be_empty;
                                              }
                                              return null;
                                            },
                                    );
                                  }),
                            AppStreamBuilder<String>(
                                stream: model.countryDialCode.stream,
                                initialData: model.countryDialCode.value,
                                dataBuilder: (context, countryDialCode) {
                                  return CountryPickerPhoneTextField(
                                    readOnly: true,
                                    initialSelection: countryDialCode!,
                                    controller: model.contactNumberController,
                                    onCountryChanged: (country) {
                                      model.countryDialCode
                                          .add(country.dialCode!);
                                    },
                                    validator: (value) {
                                      if (Validator.isEmpty(value!)) {
                                        return Strings.of(context).contact_number_cannot_be_empty;
                                      } else if (value.length < 10) {
                                        return Strings.of(context).contact_number_cannot_be_less_than_digits;
                                      }
                                      return null;
                                    },
                                  );
                                }),
                            CommonTextFormField(
                              bottomPadding: 16,
                              showAstreik: true,
                              labelText: Strings.of(context).email_iD,
                              readOnly: true,
                              controller: model.emailIDController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (Validator.isEmpty(value!)) {
                                  return Strings.of(context).email_cannot_be_empty;
                                } else if (!Validator.validateEmail(value)) {
                                  return Strings.of(context).email_is_not_valid;
                                }
                                return null;
                              },
                            ),
                            CommonTextFormField(
                              bottomPadding: 16,
                              readOnly: true,
                              showAstreik: true,
                              labelText: Strings.of(context).visit_Date_Time,
                              controller: model.visitDateTimeController,
                              onTap: () async {
                                await DateTimeUtils.pickDateTime(context,
                                    pickTime: true, onSelect: (value) {
                                  model.visitDateTimeController.text = value
                                      .toIso8601String()
                                      .dateFormatToDDMMYYYhhmma();
                                  model.selectedDate = value;
                                });
                              },
                            ),
                            CommonTextFormField(
                                bottomPadding: 16,
                                showAstreik: true,
                                labelText: Strings.of(context).point_Of_contact,
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.allow(
                                //       RegExp(r'^[a-zA-Z\s]+$')),
                                // ],
                                validator: (value) {
                                  if (Validator.isEmpty(value!)) {
                                    return Strings.of(context).point_of_contact_cannot_be_empty;
                                  }
                                  return null;
                                },
                                controller: model.pointOfContactController),
                            AppStreamBuilder<
                                Resource<MdmCoReasonResponseModel>>(
                              stream: model.purposeOfVisitResponse,
                              initialData: Resource.none(),
                              dataBuilder: (context, data) {
                                return DataStatusWidget(
                                  status: data?.status ?? Status.none,
                                  loadingWidget: () => const SizedBox.shrink(),
                                  successWidget: () => CustomDropdownButton(
                                    bottomPadding: 16,
                                    items: data?.data?.data
                                            ?.map((e) => e.attributes?.name)
                                            .toList() ??
                                        [],
                                    isMutiSelect: false,
                                    dropdownName: "Purpose Of Visit",
                                    showAstreik: true,
                                    showBorderColor: true,
                                    onMultiSelect: (_) {},
                                    onSingleSelect: (value) {
                                      model.setPurposeOfVisitId(value);
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          Validator.isEmpty(value)) {
                                        return Strings.of(context).purpose_of_visit_cannot_be_empty;
                                      }
                                      return null;
                                    },
                                  ),
                                );
                              },
                            ),
                            if (model.userSubject.valueOrNull?.data?.statusId ==
                                    0 ||
                                model.userSubject.valueOrNull?.data?.statusId ==
                                    null) ...{
                              AppStreamBuilder<
                                  Resource<List<MdmAttributeModel>>>(
                                stream:
                                    model.schoolLocationTypesAttribute.stream,
                                initialData: Resource.none(),
                                dataBuilder: (context, data) {
                                  return DataStatusWidget(
                                    status: data?.status ?? Status.none,
                                    loadingWidget: () =>
                                        const SizedBox.shrink(),
                                    successWidget: () => CustomDropdownButton(
                                      bottomPadding: 32,
                                      items: data?.data
                                              ?.map((e) => e.attributes?.name)
                                              .toList() ??
                                          [],
                                      isMutiSelect: false,
                                      dropdownName: "Select School",
                                      showAstreik: true,
                                      showBorderColor: true,
                                      onMultiSelect: (_) {},
                                      onSingleSelect: (value) {
                                        model.setSchoolId(value);
                                      },
                                      validator: model.userSubject.valueOrNull
                                                      ?.data?.statusId ==
                                                  0 ||
                                              model.userSubject.valueOrNull
                                                      ?.data?.statusId ==
                                                  null
                                          ? (value) {
                                              if (value == null ||
                                                  Validator.isEmpty(value)) {
                                                return Strings.of(context).select_school_cannot_be_empty;
                                              }
                                              return null;
                                            }
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            },
                            CommonTextFormField(
                              bottomPadding: 16,
                              showAstreik: true,
                              labelText: Strings.of(context).coming_from,
                              controller: model.comingFromController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (Validator.isEmpty(value!)) {
                                  return Strings.of(context).coming_from_cannot_be_empty;
                                }

                                return null;
                              },
                            ),
                            CommonTextFormField(
                                bottomPadding: 16,
                                showAstreik: true,
                                labelText: Strings.of(context).guest_count,
                                controller: model.guestCountController,
                                validator: (value) {
                                  if (Validator.isEmpty(value!)) {
                                    return Strings.of(context).guest_count_cannot_be_empty;
                                  }

                                  return null;
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'^0+')),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number),
                            CommonTextFormField(
                                bottomPadding: 16,
                                showAstreik: false,
                                labelText: Strings.of(context).vehicle_number,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z0-9\s]+$')),
                                ],
                                controller: model.vehicleController),
                          ],
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.only(bottom: 16, right: 16, left: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AppStreamBuilder<Resource<bool>>(
                        stream: model.loadingSubject.stream,
                        initialData: Resource.none(),
                        dataBuilder: (context, data) {
                          return CommonPrimaryElevatedButton(
                            isLoading: data?.data ?? false,
                            title: Strings.of(context).submit,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (model.formKey.currentState!.validate()) {
                                model.createOrUpdateGatePass();
                              }
                              // log(DateTimeUtils.getFormattedDate());
                              // log(DateTimeUtils.getFormattedDateTime());
                            },
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
