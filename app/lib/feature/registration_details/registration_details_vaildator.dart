import 'package:app/feature/registration_details/registrations_details_view_model.dart';
import 'package:app/utils/app_validators.dart';
import 'package:flutter/material.dart';

class RegistrationDetailsValidator{
  final RegistrationsDetailsViewModel model;
  RegistrationDetailsValidator(this.model);

  void validateStudentFields(BuildContext context) {
  
    String errorMessage = '';

    // Common text form fields
    List<Map<String, dynamic>> textFields = [
      {'field': 'Student First Name', 'controller': model.studentFirstNameController},
      {'field': 'Student Last Name', 'controller': model.studentLastNameController},
      {'field': 'Date of Birth', 'controller': model.dobController},
      {'field': 'Parent First Name', 'controller': model.selectedParentTypeSubject.value == "Father" ? model.studentsFatherFirstNameController : model.studentsMotherFirstNameController},
      {'field': 'Parent Last Name', 'controller': model.selectedParentTypeSubject.value == "Father" ? model.studentsFatherLastNameController : model.studentsMotherLastNameController},
      {'field': 'Parent Email ID', 'controller': model.selectedParentTypeSubject.value == "Father" ? model.studentsFatherEmailController : model.studentsMotherEmailController},
      {'field': 'Parent Mobile Number', 'controller': model.selectedParentTypeSubject.value == "Father" ? model.studentsFatherContactController : model.studentsMotherContactController},
      {'field': 'Place of Birth', 'controller': model.placeOfBirthController},      
      {'field': 'Mother Tongue', 'controller': model.motherTongueController},
    ];

    // Common dropdown fields
    final dropdowns = [
      {'field': 'School Location', 'value': model.selectedSchoolLocationSubject.value},
      {'field': 'Grade', 'value': model.selectedGradeSubject.value},
      {'field': 'Gender', 'value': model.selectedGenderSubject.value},
      {'field': 'Parent Type', 'value': model.selectedParentTypeSubject.value},
    ];

    // Validate common text fields
    for (var field in textFields) {
      String? validationResult = AppValidators.validateNotEmpty(field['controller']!.text.trim(), field['field'] as String);
      if (validationResult != null) {
        errorMessage = validationResult;
        break;
      }
    }

    // Validate common dropdowns
    if (errorMessage.isEmpty) {
      for (var dropdown in dropdowns) {
        String? validationResult = AppValidators.validateDropdown(dropdown['value'], dropdown['field'] as String);
        if (validationResult != null) {
          errorMessage = validationResult;
          break;
        }
      }
    }

    // IVT-specific validations
    if (errorMessage.isEmpty && (model.enquiryDetailArgs?.enquiryType ?? '') == "IVT") {
      final ivtDropdowns = [
        {'field': 'Board', 'value': model.ivtBoardSubject.value},
        {'field': 'Course', 'value': model.ivtCourseSubject.value},
        {'field': 'Stream', 'value': model.ivtStreamSubject.value},
        {'field': 'Shift', 'value': model.ivtShiftSubject.value},
      ];

      for (var dropdown in ivtDropdowns) {
        String? validationResult = AppValidators.validateDropdown(dropdown['value'], dropdown['field'] as String);
        if (validationResult != null) {
          errorMessage = validationResult;
          break;
        }
      }
    }

    // PSA-specific validations
    if (errorMessage.isEmpty && (model.enquiryDetailArgs?.enquiryType ?? '') == "PSA") {
      final psaDropdowns = [
        {'field': 'PSA Sub Type', 'value': model.psaSubTypeSubject.value},
        {'field': 'PSA Category', 'value': model.psaCategorySubject.value},
        {'field': 'PSA Sub Category', 'value': model.psaSubCategorySubject.value},
        {'field': 'Period of Service', 'value': model.periodOfServiceSubject.value},
        {'field': 'PSA Batch', 'value': model.psaBatchSubject.value},
      ];

      for (var dropdown in psaDropdowns) {
        String? validationResult = AppValidators.validateDropdown(dropdown['value'], dropdown['field'] as String);
        if (validationResult != null) {
          errorMessage = validationResult;
          break;
        }
      }
    }

    // Show snackbar with error message
    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          
        ),
      );
    }
  else {
    // Form is valid, proceed with submission
    model.saveStudentDetail();
    print('All fields are valid');
  }
}

  void validateParentInfoFields(BuildContext context) {
      String errorMessage = '';

      // Father's details
      List<Map<String, dynamic>> fatherFields = [
        {'field': "Father's First Name", 'controller': model.fatherFirstNameController},
        {'field': "Father's Last Name", 'controller': model.fatherLastNameController},
        {'field': "Father's Aadhar Card No", 'controller': model.fatherAdharCardController},
        {'field': "Father's Pan Card No", 'controller': model.fatherPanCardController},
        {'field': "Father's Qualification", 'controller': model.qualificationController},
        {'field': "Father's Email ID", 'controller': model.fatherEmailController},
        {'field': "Father's Mobile Number", 'controller': model.fatherMobileController},
      ];

      // Mother's details
      List<Map<String, dynamic>> motherFields = [
        {'field': "Mother's First Name", 'controller': model.motherFirstNameController},
        {'field': "Mother's Last Name", 'controller': model.motherLastNameController},
        {'field': "Mother's Aadhar Card No", 'controller': model.motherAdharCardController},
        {'field': "Mother's Pan Card No", 'controller': model.motherPanCardController},
        {'field': "Mother's Qualification", 'controller': model.motherQualificationController},
        {'field': "Mother's Email ID", 'controller': model.motherEmailController},
        {'field': "Mother's Mobile Number", 'controller': model.motherMobileController},
      ];

      // Guardian's details
      // List<Map<String, dynamic>> guardianFields = [
      //   {'field': "Guardian's First Name", 'controller': model.guardianFirstNameController},
      //   {'field': "Guardian's Last Name", 'controller': model.guardianLastNameController},
      //   {'field': "Guardian's Adhar Card No", 'controller': model.guardianAdharCardController},
      //   {'field': "Guardian's Pan Card No", 'controller': model.guardianPanCardController},
      //   {'field': "Relationship With Child", 'controller': model.relationshipWithChildController},
      //   {'field': "Guardian's Qualification", 'controller': model.guardianQualificationController},
      //   {'field': "Guardian's Organization Name", 'controller': model.guardianOrganizationNameController},
      //   {'field': "Guardian's Designation", 'controller': model.guardianDesignationController},
      //   {'field': "Guardian's Office Address", 'controller': model.guardianOfficeAddressController},
      //   {'field': "Guardian's Pin Code", 'controller': model.guardianPinCodeController},
      //   {'field': "Guardian's Email ID", 'controller': model.guardianEmailController},
      //   {'field': "Guardian's Mobile Number", 'controller': model.guardianMobileController},
      // ];

      // Sibling's details
      // List<Map<String, dynamic>> siblingFields = [
      //   {'field': "Sibling First Name", 'controller': model.siblingFirstNameController},
      //   {'field': "Sibling Last Name", 'controller': model.siblingLastNameController},
      //   {'field': "Sibling's School", 'controller': model.siblingsSchoolController},
      // ];

      // Map<String,dynamic> isVibgyorStudent = {'field': "Is Sibling a Vibgyor Student",'controller': model.radioButtonController1};
      // Map<String,dynamic> siblingEnrollmentNumber = {'field': "Sibling's Enrollment Number",'controller': model.siblingsEnrollmentController};
      
      // Validate all text fields
      for (var fieldSet in [fatherFields, motherFields]) {
        for (var field in fieldSet) {
          String? validationResult;
          if(field['field'].toString().contains('Email')){
            validationResult = AppValidators.validateEmail(
              field['controller']!.text.trim(),
            );
          }
          if(field['field'].toString().contains('Mobile')){
            validationResult = AppValidators.validateMobile(
              field['controller']!.text.trim(),
            );
          }
          // if(field['field'].toString().contains('Pin')){
          //   validationResult = AppValidators.validatePinCode(
          //     field['controller']!.text.trim(),
          //   );
          // }
          if(field['field'].toString().contains('Aadhar')){
            validationResult = AppValidators.validateNotEmpty(
              field['controller']!.text.trim(),
              field['field'].toString(),
              validateLength: true,
              minLength: 10,
              checkSpecialCharacters: false,
            );
          }
          if(field['field'].toString().contains('Pan')){
            validationResult = AppValidators.validateNotEmpty(
              field['controller']!.text.trim(),
              field['field'].toString(),
              validateLength: true,
              minLength: 10,
              checkSpecialCharacters: false,
            );
          }
          else {
            validationResult = AppValidators.validateNotEmpty(
              field['controller']!.text.trim(),
              field['field'].toString(),
            );
          }
          if (validationResult != null) {
            errorMessage = validationResult;
            break;
          }
        }
        if (errorMessage.isNotEmpty) break;
      }

      // Validate dropdowns
      // if (errorMessage.isEmpty) {
      //   final dropdowns = [
      //     {'field': "Father's Occupation", 'value': model.fatherOccupation},
      //     {'field': "Father's Area", 'value': model.fatherArea},
      //     {'field': "Father's Country", 'value': model.selectedFatherCountryEntity?.value},
      //     {'field': "Father's State", 'value': model.selectedFatherStateEntity?.value},
      //     {'field': "Father's City", 'value': model.selectedFatherCityEntity?.value},
      //     {'field': "Mother's Occupation", 'value': model.motherOccupation},
      //     {'field': "Mother's Area", 'value': model.motherArea},
      //     {'field': "Mother's Country", 'value': model.selectedMotherCountryEntity?.value},
      //     {'field': "Mother's State", 'value': model.selectedMotherStateEntity?.value},
      //     {'field': "Mother's City", 'value': model.selectedMotherCityEntity?.value},
      //     {'field': "Guardian's Occupation", 'value': model.guardianOccupation},
      //     {'field': "Guardian's Area", 'value': model.guardianArea},
      //     {'field': "Guardian's Country", 'value': model.selectedGuardianCountryEntity?.value},
      //     {'field': "Guardian's State", 'value': model.selectedGuardianStateEntity?.value},
      //     {'field': "Guardian's City", 'value': model.selectedGuardianCityEntity?.value},
      //     {'field': "Sibling's Gender", 'value': model.siblingGender},
      //     {'field': "Sibling's Grade", 'value': model.siblingGrade},
      //   ];

      //   for (var dropdown in dropdowns) {
      //     String? validationResult = AppValidators.validateDropdown(dropdown['value'], dropdown['field'] as String);
      //     if (validationResult != null) {
      //       errorMessage = validationResult;
      //       break;
      //     }
      //   }
      // }

      // if(errorMessage.isEmpty){
      //   if(isVibgyorStudent["controller"].selectedItem == null){
      //     errorMessage = 'Please select an option for: ${isVibgyorStudent['field']}';
      //   }
      //   if(isVibgyorStudent['controller'].selectedItem == "Vibgyor Student"){
      //     String? validationResult = AppValidators.validateNotEmpty(
      //       siblingEnrollmentNumber['controller']!.text.trim(),
      //       siblingEnrollmentNumber['field'].toString(),
      //     );
      //     if (validationResult != null) {
      //       errorMessage = validationResult;
      //     }
      //   }
      // }

      // Show snackbar with error message
      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),   
          ),
        );
      }
      else {
      // Form is valid, proceed with submission
        model.saveParentDetails(model.enquiryDetailArgs?.enquiryId??'');
      }
  }

  void validateBankDetails(BuildContext context) {
    model.saveBankDetails(model.enquiryDetailArgs?.enquiryId ?? '');
    
    // String errorMessage = '';
      
    //   List<Map<String, dynamic>> bankFields = [
    //     {'field': 'IFSC Code', 'controller': model.ifscCodeController, 'minLength': 9},
    //     {'field': 'Bank Name', 'controller': model.bankNameController},
    //     {'field': 'Branch Name', 'controller': model.branchNameController},
    //     {'field': 'Account Holder Name', 'controller': model.accountHolderNameController},
    //     {'field': 'Account Type', 'controller': model.accountTypeController},
    //     {'field': 'Account Number', 'controller': model.accountNumberController, 'minLength': 10},
    //     {'field': 'UPI Number', 'controller': model.upiController, 'minLength': 5},
    //   ];

    //   for (var field in bankFields) {
    //     String? validationResult = AppValidators.validateNotEmpty(
    //       field['controller']!.text.trim(),
    //       field['field'] as String,
    //       checkSpecialCharacters: false,
    //       validateLength: field.containsKey('minLength'),
    //       minLength: field['minLength'] as int?,
    //     );
    //     if (validationResult != null) {
    //       errorMessage = validationResult;
    //       break;
    //     }
    //   }
    

    // // Validate terms and conditions acceptance
    // if (model.radioButtonController6.selectedItem != 'I accept the terms & conditions') {
    //   errorMessage = 'Please accept the terms and conditions';
    // }

    // if (errorMessage.isNotEmpty) {
    //   // Show snackbar with error message
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(errorMessage),
          
    //     ),
    //   );
    // } else {
    //   // All validations passed
    //   model.saveBankDetails(model.enquiryDetailArgs?.enquiryId??'');
    // }
  }

  void validateContactDetails(BuildContext context) {
      String errorMessage = '';

      // Emergency Contact
      // if (model.emergencyContact == null || model.emergencyContact!.isEmpty) {
      //   errorMessage = 'Please select an Emergency Contact';
      // }

      // // Point of Contact
      // List<Map<String, dynamic>> pointOfContactFields = [
      //   {'field': 'Parent Mobile Number 1', 'controller': model.parentMobileNumberController1,},
      //   {'field': 'Parent Email Id 1', 'controller': model.parentEmailIdController1},
      //   {'field': 'Parent Mobile Number 2', 'controller': model.parentMobileNumberController2,},
      //   {'field': 'Parent Email Id 2', 'controller': model.parentEmailIdController2},
      // ];

      // for (var field in pointOfContactFields) {
      //   String? validationResult;
      //   if(field['field'].toString().contains('Email') ){
      //       validationResult = AppValidators.validateEmail(
      //       field['controller']!.text.trim(),
      //     );
      //   }
      //   if(field['field'].toString().contains('Mobile') ){
      //       validationResult = AppValidators.validateMobile(
      //       field['controller']!.text.trim(),
      //     );
      //   }
      //   if (validationResult != null) {
      //     errorMessage = validationResult;
      //     break;
      //   }
      // }

      // // Validate email format
      // if (errorMessage.isEmpty) {
      //   for (var emailController in [model.parentEmailIdController1, model.parentEmailIdController2]) {
      //     String? validationResult = AppValidators.validateEmail(emailController.text);
      //     if (validationResult != null) {
      //       errorMessage = validationResult;
      //       break;
      //     }
      //   }
      // }

      // Residential Details
      List<Map<String, dynamic>> residentialFields = [
        {'field': 'House No./ Building', 'controller': model.houseOrBuildingController},
        {'field': 'Street Name', 'controller': model.streetNameController},
        {'field': 'Landmark', 'controller': model.landMarkController},
        {'field': 'Pin Code', 'value': model.residentialPinCodeController},
      ];

      if (errorMessage.isEmpty) {
        for (var field in residentialFields) {
          String? validationResult;
          if(field["field"].toString().contains("Pin")){
            validationResult = AppValidators.validatePinCode(
              field['controller']!.text.trim(),
            );
          }
          else{
            validationResult = AppValidators.validateNotEmpty(
              field['controller']!.text.trim(),
              field['field'] as String,
              checkSpecialCharacters: true,
            );
          }
          if (validationResult != null) {
            errorMessage = validationResult;
            break;
          }
        }
      }

      // Validate dropdowns
      if (errorMessage.isEmpty) {
        List<Map<String, dynamic>> dropdowns = [
          {'field': 'Country', 'value': model.selectedResidentialCountry.value},
          {'field': 'State', 'value': model.selectedResidentialState.value},
          {'field': 'City', 'value': model.selectedResidentialCity.value},
        ];

        for (var dropdown in dropdowns) {
          String? validationResult = AppValidators.validateDropdown(dropdown['value'], dropdown['field'] as String);
          if (validationResult != null) {
            errorMessage = validationResult;
            break;
          }
        }
      }

      // Show snackbar with error message
      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            
        ),
      );
    }
    else {
      // Form is valid, proceed with submission
      model.saveContactDetails(model.enquiryDetailArgs?.enquiryId??'');
    }
  }

  void validateMedicalDetails(BuildContext context) {
      String errorMessage = '';

      // Validate radio button selections
      List<Map<String, dynamic>> radioButtons = [
        {'field': 'Has the child ever been hospitalized?', 'controller': model.radioButtonController4},
        {'field': 'Physical Disabilities', 'controller': model.radioButtonController5},
        {'field': 'Medical History', 'controller': model.radioButtonController7},
        {'field': 'Allergies', 'controller': model.radioButtonController8},
        {'field': 'Personalised Learning Needs', 'controller': model.radioButtonController9},
      ];

      for (var radioButton in radioButtons) {
        if (radioButton['controller'].selectedItem == null) {
          errorMessage = 'Please select an option for: ${radioButton['field']}';
          break;
        }
      }

      // Validate conditional text fields
      if (errorMessage.isEmpty) {
        if (model.radioButtonController4.selectedItem == 'Yes') {
          List<Map<String, dynamic>> hospitalFields = [
            {'field': 'Year Of Hospitalization', 'controller': model.yearOfHospitalizationController},
            {'field': 'Reason Of Hospitalization', 'controller': model.reasonOfHospitalizationController},
          ];

          for (var field in hospitalFields) {
            String? validationResult;

            if(field['field'].toString().contains("Year")){
              validationResult = AppValidators.validateNotEmpty(
                field['controller']!.text.trim(),
                field['field'] as String,
                checkSpecialCharacters: false
              );
            }
            else{
              validationResult = AppValidators.validateNotEmpty(
               field['controller']!.text.trim(),
                field['field'] as String,
              );
            }
            
            if (validationResult != null) {
              errorMessage = validationResult;
              break;
            }
          }
        }

        if (errorMessage.isEmpty && model.radioButtonController5.selectedItem == 'Yes') {
          String? validationResult = AppValidators.validateNotEmpty(
            model.specificDisabilityController.text,
            'Specify Disability',
          );
          if (validationResult != null) {
            errorMessage = validationResult;
          }
        }

        if (errorMessage.isEmpty && model.radioButtonController7.selectedItem == 'Yes') {
          String? validationResult = AppValidators.validateNotEmpty(
            model.specifyMedicalHistoryController.text,
            'Specify Medical History',
          );
          if (validationResult != null) {
            errorMessage = validationResult;
          }
        }

        if (errorMessage.isEmpty && model.radioButtonController8.selectedItem == 'Yes') {
          String? validationResult = AppValidators.validateNotEmpty(
            model.specifyAllergiesController.text,
            'Specify Allergies',
          );
          if (validationResult != null) {
            errorMessage = validationResult;
          }
        }

        if (errorMessage.isEmpty && model.radioButtonController9.selectedItem == 'Yes') {
          String? validationResult = AppValidators.validateNotEmpty(
            model.personalisedLearningNeedsController.text,
            'Personalised Learning Needs',
          );
          if (validationResult != null) {
            errorMessage = validationResult;
          }
        }
      }

      // Validate Blood Group dropdown
      if (errorMessage.isEmpty) {
        String? validationResult = AppValidators.validateDropdown(model.selectedBloodGroup.valueOrNull, 'Blood Group');
        if (validationResult != null) {
          errorMessage = validationResult;
        }
      }

      // Show snackbar with error message
      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            
          ),
        );
      }
    else {
      // Form is valid, proceed with submission
      model.saveMedicalDetails(model.enquiryDetailArgs?.enquiryId??'');
    }
  }


}