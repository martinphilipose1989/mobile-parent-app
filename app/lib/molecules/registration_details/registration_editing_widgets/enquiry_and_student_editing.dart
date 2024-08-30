import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_dropdown.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:app/utils/common_widgets/common_textformfield_widget.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EnquiryAndStudentEditing extends StatelessWidget {
  final RegistrationsDetailsViewModel model;
  final EnquiryDetailArgs enquiryDetailArgs;
  const EnquiryAndStudentEditing({super.key,required this.model,required this.enquiryDetailArgs});

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
                    CommonSizedBox.sizedBox(height: 20, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: "Enquiry Number",
                      readOnly: true,
                      controller: model.enquiryNumberController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Enquiry Date',
                      readOnly: true,
                      controller: model.enquiryDateController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: "Enquiry Type",
                      readOnly: true,
                      controller: model.enquiryTypeController,
                    ),
                    CommonSizedBox.sizedBox(height: 15, width: 10),
                    StreamBuilder<List<String>>(
                      stream: model.schoolLocationTypes,
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const CircularProgressIndicator();
                        }else {
                          return SizedBox(
                          height: 48,
                          child: CustomDropdownButton(
                            width: MediaQuery.of(context).size.width,
                            onMultiSelect: (selectedValues) {},
                            dropdownName: 'School Location',
                            showAstreik: true,
                            showBorderColor: true,
                            singleSelectItemSubject: model.selectedSchoolLocationSubject,
                            items: snapshot.data??[],
                            onSingleSelect: (selectedValue) {
                              if (model.schoolLocationTypes.value.contains(selectedValue)) {
                                var schoolLocation = model.schoolLocationTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                model.selectedSchoolLocationType.add(true);
                                model.selectedSchoolLocationEntity?.id = schoolLocation?.id;
                                model.selectedSchoolLocationEntity?.value = schoolLocation?.attributes?.name;
                              }
                            },
                            isMutiSelect: false,
                            ),
                          );
                        }
                      }
                    ),
                  ],
                ),
              )
            ]),
      ),
      //
      Container(
        width: 358.w,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    CommonSizedBox.sizedBox(height: 20, width: 10),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Student First Name",
                      controller: model.studentFirstNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "Student Last Name",
                      controller: model.studentLastNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<String>>(
                      stream: model.gradeTypes,
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const CircularProgressIndicator();
                        }else{
                          return SizedBox(
                            height: 48,
                            child: CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Grade',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              onSingleSelect: (selectedValue) {
                                if (model.gradeTypes.value.contains(selectedValue)) {
                                  var grade = model.gradeTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedGradeType.add(true);
                                  model.selectedGenderEntity?.id = grade?.id;
                                  model.selectedGradeEntity?.value = grade?.attributes?.name;
                                }
                              },
                              singleSelectItemSubject: model.selectedGradeSubject,
                              isMutiSelect: false,
                            ),
                          );
                        }
                      }
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: "DOB",
                      controller: model.dobController,
                      readOnly: true,
                      onTap: ()async{
                        DateTime? dob = await showDatePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year-20,DateTime.now().month,DateTime.now().day),
                          lastDate: DateTime.now(),
                          barrierDismissible: true
                        );
                        if(dob!=null){
                          model.dobController.text = DateFormat('dd/MM/yyyy').format(dob);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<List<String>>(
                      stream: model.gender,
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            height: 48,
                            child: CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Gender',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedGenderSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.gender.value.contains(selectedValue)) {
                                  var gender = model.genderAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedGenerType.add(true);
                                  model.selectedGenderEntity?.id = gender?.id;
                                  model.selectedGenderEntity?.value = gender?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                            ),
                          );
                        }
                      }
                    ),
                    const SizedBox(height: 20,),
                    CommonTextFormField(
                      showAstreik: true,
                      labelText: 'Existing School Name',
                      controller: model.existingSchoolNameController,
                    ),
                    const SizedBox(height: 20,),
                    StreamBuilder<List<String>>(
                      stream: model.existingSchoolBoard,
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            height: 48,
                            child: CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Existing School Board',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedExistingSchoolBoardSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.existingSchoolBoard.value.contains(selectedValue)) {
                                  var board = model.existingSchoolBoardAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedExistingSchoolBoard.add(true);
                                  model.selectedExistingSchoolBoardEntity?.id = board?.id;
                                  model.selectedExistingSchoolBoardEntity?.value = board?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                            ),
                          );
                        }
                      }
                    ),
                    const SizedBox(height: 20,),
                    StreamBuilder<List<String>>(
                      stream: model.gradeTypes,
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            height: 48,
                            child: CustomDropdownButton(
                              width: MediaQuery.of(context).size.width,
                              onMultiSelect: (selectedValues) {},
                              dropdownName: 'Existing School Grade',
                              showAstreik: true,
                              showBorderColor: true,
                              items: snapshot.data??[],
                              singleSelectItemSubject: model.selectedExistingSchoolGradeSubject,
                              onSingleSelect: (selectedValue) {
                                if (model.existingSchoolGrade.value.contains(selectedValue)) {
                                  var grade = model.gradeTypesAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                                  model.selectedExistingSchoolGrade.add(true);
                                  model.selectedExistingSchoolGradeEntity?.id = grade?.id;
                                  model.selectedExistingSchoolGradeEntity?.value = grade?.attributes?.name;
                                }
                              },
                              isMutiSelect: false,
                            ),
                          );
                        }
                      }
                    ),
                    if((enquiryDetailArgs.enquiryType??"") == "PSA")...[
                      const SizedBox(height: 20,),
                      psaDetails()
                    ],
                    if((enquiryDetailArgs.enquiryType??"") == "IVT")...[
                      const SizedBox(height: 20,),
                      ivtDetails()
                    ],
                    const SizedBox(height: 20,),
                    SizedBox(
                        height: 48,
                        child: CustomDropdownButton(
                          width: MediaQuery.of(context).size.width,
                          onMultiSelect: (selectedValues) {},
                          dropdownName: 'Select Parent Type',
                          showAstreik: true,
                          showBorderColor: true,
                          items: model.parentType,
                          singleSelectItemSubject: model.selectedParentTypeSubject,
                          onSingleSelect: (selectedValue) {
                            model.selectedParentTypeSubject.value = selectedValue;
                          },
                          isMutiSelect: false,
                        ),
                    ),
                    const SizedBox(height: 20,),
                    CommonTextFormField(
                      showAstreik: false,
                      labelText: 'Gloabal ID',
                      readOnly: true,
                      controller: model.globalIdController,
                    ),
                    const SizedBox(height: 20,),
                    AppStreamBuilder<String>(
                      stream: model.selectedParentTypeSubject,
                      initialData: model.selectedParentTypeSubject.value, 
                      dataBuilder: (context, data) {
                        return Column(
                          children: [
                            const SizedBox(height: 20,),
                            if((data??'') == "Father")...[
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent First Name',
                                controller: model.studentsFatherFirstNameController,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent Last Name',
                                controller: model.studentsFatherLastNameController,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent Email ID',
                                controller: model.studentsFatherEmailController,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent Mobile Number',
                                controller: model.studentsFatherContactController,
                              ),
                            ]
                            else...[
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent First Name',
                                controller: model.studentsMotherFirstNameController,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent Last Name',
                                controller: model.studentsMotherLastNameController,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent Email ID',
                                controller: model.studentsMotherEmailController,
                              ),
                              CommonSizedBox.sizedBox(height: 15, width: 10),
                              CommonTextFormField(
                                showAstreik: true,
                                labelText: 'Parent Mobile Number',
                                controller: model.studentsMotherContactController,
                              ),
                            ]
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20,),
                    
                  ],
                ),
              )
            ]),
      ),
    ]);
  }

  Widget psaDetails(){
    return Column(
      children: [
        StreamBuilder<List<String>>(
          stream: model.psaSubType,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA Sub Type',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaSubTypeSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaSubType.value.contains(selectedValue)) {
                      var psaSubType = model.psaSubTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedPsaSubType.add(true);
                      model.selectedPsaSubTypeEntity?.id = psaSubType?.id;
                      model.selectedPsaSubTypeEntity?.value = psaSubType?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.psaCategory,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA Category',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaCategorySubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaCategory.value.contains(selectedValue)) {
                      var psaCategory = model.psaCategoryAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedPsaCategory.add(true);
                      model.selectedPsaCategoryEntity?.id = psaCategory?.id;
                      model.selectedPsaCategoryEntity?.value = psaCategory?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.psaSubCategory,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA Sub Category',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaSubCategorySubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaSubCategory.value.contains(selectedValue)) {
                      var psaSubCategory = model.psaSubCategoryAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedPsaSubCategory.add(true);
                      model.selectedPsaSubCategoryEntity?.id = psaSubCategory?.id;
                      model.selectedPsaSubCategoryEntity?.value = psaSubCategory?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.periodOfService,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Period of service',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.periodOfServiceSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.periodOfService.value.contains(selectedValue)) {
                    var periodOfService = model.periodOfServiceAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedPeriodOfService.add(true);
                      model.selectedPeriodOfServiceEntity?.id = periodOfService?.id;
                      model.selectedPeriodOfServiceEntity?.value = periodOfService?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.psaBatch,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'PSA batch',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.psaBatchSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.psaBatch.value.contains(selectedValue)) {
                      var psaBatch = model.psaBatchAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedPsaBatch.add(true);
                      model.selectedPsaBatchEntity?.id = psaBatch?.id;
                      model.selectedPsaBatchEntity?.value = psaBatch?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
      ],
    );
  }

  Widget ivtDetails(){
    return Column(
      children: [
        StreamBuilder<List<String>>(
          stream: model.existingSchoolBoard,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Board',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.ivtBoardSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.existingSchoolBoard.value.contains(selectedValue)) {
                      var board = model.existingSchoolBoardAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selecteBoard.add(true);
                      model.selectedBoardEntity?.id = board?.id;
                      model.selectedBoardEntity?.value = board?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.course,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Course',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.ivtCourseSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.course.value.contains(selectedValue)) {
                      var course = model.courseTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedCourse.add(true);
                      model.selectedCourseEntity?.id = course?.id;
                      model.selectedCourseEntity?.value = course?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.stream,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Stream',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.ivtStreamSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.stream.value.contains(selectedValue)) {
                      var stream = model.streamTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedStream.add(true);
                      model.selectedStreamEntity?.id = stream?.id;
                      model.selectedStreamEntity?.value = stream?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
        const SizedBox(height: 20,),
        StreamBuilder<List<String>>(
          stream: model.shift,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const CircularProgressIndicator();
            } else {
              return SizedBox(
                height: 48,
                child: CustomDropdownButton(
                  width: MediaQuery.of(context).size.width,
                  onMultiSelect: (selectedValues) {},
                  dropdownName: 'Shift',
                  showAstreik: true,
                  showBorderColor: true,
                  items: snapshot.data??[],
                  singleSelectItemSubject: model.ivtShiftSubject,
                  onSingleSelect: (selectedValue) {
                    if (model.shift.value.contains(selectedValue)) {
                      var board = model.shiftTypeAttribute?.firstWhere((element)=> (element.attributes?.name??'').contains(selectedValue));
                      model.selectedShift.add(true);
                      model.selectedShiftEntity?.id = board?.id;
                      model.selectedShiftEntity?.value = board?.attributes?.name;
                    }
                  },
                  isMutiSelect: false,
                ),
              );
            }
          }
        ),
      ],
    );
  }

  Widget externalDetails(BuildContext context){
  return  Column(
      children: [
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
          items: [],
          width: MediaQuery.of(context).size.width,
          isMutiSelect: false,
          dropdownName: 'Mother Tounge',
          showAstreik: true,
          onMultiSelect: (selectedValues) {},
          showBorderColor: true,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
          items: [],
          width: MediaQuery.of(context).size.width,
          isMutiSelect: false,
          dropdownName: 'Nationality',
          showAstreik: true,
          onMultiSelect: (selectedValues) {},
          showBorderColor: true,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
          items: [],
          width: MediaQuery.of(context).size.width,
          isMutiSelect: false,
          dropdownName: 'Place Of Birth',
          showAstreik: true,
          onMultiSelect: (selectedValues) {},
          showBorderColor: true,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
          items: [],
          width: MediaQuery.of(context).size.width,
          isMutiSelect: false,
          dropdownName: 'Religion',
          showAstreik: true,
          onMultiSelect: (selectedValues) {},
          showBorderColor: true,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
          items: [],
          width: MediaQuery.of(context).size.width,
          isMutiSelect: false,
          dropdownName: 'Caste',
          showAstreik: true,
          onMultiSelect: (selectedValues) {},
          showBorderColor: true,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CustomDropdownButton(
          items: [],
          width: MediaQuery.of(context).size.width,
          isMutiSelect: false,
          dropdownName: 'Sub Caste',
          showAstreik: true,
          onMultiSelect: (selectedValues) {},
          showBorderColor: true,
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: true,
          labelText: 'Parent Email ID',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: true,
          labelText: 'Parent Mobile Number',
        ),
        const CommonTextFormField(
          showAstreik: true,
          labelText: 'Parent First Name',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: true,
          labelText: 'Parent Last Name',
        ),
        CommonSizedBox.sizedBox(height: 15, width: 10),
        const CommonTextFormField(
          showAstreik: true,
          labelText: 'Global ID',
        )
      ],
    );
  }
}
