// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon !!!`
  String get coming_soon {
    return Intl.message(
      'Coming Soon !!!',
      name: 'coming_soon',
      desc: '',
      args: [],
    );
  }

  /// `Hubble Orion`
  String get appName {
    return Intl.message(
      'Hubble Orion',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Tracker`
  String get tracker {
    return Intl.message(
      'Tracker',
      name: 'tracker',
      desc: '',
      args: [],
    );
  }

  /// `Enquiry`
  String get enquiry {
    return Intl.message(
      'Enquiry',
      name: 'enquiry',
      desc: '',
      args: [],
    );
  }

  /// `Admission`
  String get admission {
    return Intl.message(
      'Admission',
      name: 'admission',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message(
      'Action',
      name: 'action',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get go_back {
    return Intl.message(
      'Go Back',
      name: 'go_back',
      desc: '',
      args: [],
    );
  }

  /// `Enquiry Details`
  String get enquiry_details {
    return Intl.message(
      'Enquiry Details',
      name: 'enquiry_details',
      desc: '',
      args: [],
    );
  }

  /// `Child Progress/Academic Progress`
  String get child_progress {
    return Intl.message(
      'Child Progress/Academic Progress',
      name: 'child_progress',
      desc: '',
      args: [],
    );
  }

  /// `Parent Services`
  String get parent_service {
    return Intl.message(
      'Parent Services',
      name: 'parent_service',
      desc: '',
      args: [],
    );
  }

  /// `Fees`
  String get fees {
    return Intl.message(
      'Fees',
      name: 'fees',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `New Enrollment`
  String get new_enrollment {
    return Intl.message(
      'New Enrollment',
      name: 'new_enrollment',
      desc: '',
      args: [],
    );
  }

  /// `Pending Amount`
  String get pending_amount {
    return Intl.message(
      'Pending Amount',
      name: 'pending_amount',
      desc: '',
      args: [],
    );
  }

  /// `Payments History`
  String get payment_history {
    return Intl.message(
      'Payments History',
      name: 'payment_history',
      desc: '',
      args: [],
    );
  }

  /// `Move to admission`
  String get move_to_admission {
    return Intl.message(
      'Move to admission',
      name: 'move_to_admission',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get total_amount {
    return Intl.message(
      'Total Amount',
      name: 'total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Admissions not found`
  String get admission_not_found {
    return Intl.message(
      'Admissions not found',
      name: 'admission_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Enquiries not found`
  String get enquiry_not_found {
    return Intl.message(
      'Enquiries not found',
      name: 'enquiry_not_found',
      desc: '',
      args: [],
    );
  }

  /// `IFSC Code`
  String get ifsc_code {
    return Intl.message(
      'IFSC Code',
      name: 'ifsc_code',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get bank_name {
    return Intl.message(
      'Bank Name',
      name: 'bank_name',
      desc: '',
      args: [],
    );
  }

  /// `Branch Name`
  String get branch_name {
    return Intl.message(
      'Branch Name',
      name: 'branch_name',
      desc: '',
      args: [],
    );
  }

  /// `Account Holder Name`
  String get account_holder {
    return Intl.message(
      'Account Holder Name',
      name: 'account_holder',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get account_number {
    return Intl.message(
      'Account Number',
      name: 'account_number',
      desc: '',
      args: [],
    );
  }

  /// `UPI Number`
  String get upi_no {
    return Intl.message(
      'UPI Number',
      name: 'upi_no',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get view_details {
    return Intl.message(
      'View Details',
      name: 'view_details',
      desc: '',
      args: [],
    );
  }

  /// `Periods`
  String get periods {
    return Intl.message(
      'Periods',
      name: 'periods',
      desc: '',
      args: [],
    );
  }

  /// `Period`
  String get period {
    return Intl.message(
      'Period',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  /// `Track Bus`
  String get track_bus {
    return Intl.message(
      'Track Bus',
      name: 'track_bus',
      desc: '',
      args: [],
    );
  }

  /// `Currently at`
  String get currently_at {
    return Intl.message(
      'Currently at',
      name: 'currently_at',
      desc: '',
      args: [],
    );
  }

  /// `(Updated 1 mins ago)`
  String get updated1_min {
    return Intl.message(
      '(Updated 1 mins ago)',
      name: 'updated1_min',
      desc: '',
      args: [],
    );
  }

  /// `No Bus Stops List Found`
  String get no_bus_stops {
    return Intl.message(
      'No Bus Stops List Found',
      name: 'no_bus_stops',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get no_internet_connection {
    return Intl.message(
      'No Internet Connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Somethimngt went wrong`
  String get something_got_wrong {
    return Intl.message(
      'Somethimngt went wrong',
      name: 'something_got_wrong',
      desc: '',
      args: [],
    );
  }

  /// `It seems you're offline. Please check your internet connection and try again.`
  String get it_seems_you_re_offline {
    return Intl.message(
      'It seems you\'re offline. Please check your internet connection and try again.',
      name: 'it_seems_you_re_offline',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again later or contact support if the issue persists.`
  String get an_unexpected_error {
    return Intl.message(
      'An unexpected error occurred. Please try again later or contact support if the issue persists.',
      name: 'an_unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Test`
  String get cancel_test {
    return Intl.message(
      'Cancel Test',
      name: 'cancel_test',
      desc: '',
      args: [],
    );
  }

  /// `Reason For Cancellation`
  String get reason_for_cancellation {
    return Intl.message(
      'Reason For Cancellation',
      name: 'reason_for_cancellation',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Mark As Closed`
  String get mark_as_closed {
    return Intl.message(
      'Mark As Closed',
      name: 'mark_as_closed',
      desc: '',
      args: [],
    );
  }

  /// `Priority :`
  String get priority {
    return Intl.message(
      'Priority :',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Assigned To :`
  String get assign_to {
    return Intl.message(
      'Assigned To :',
      name: 'assign_to',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment`
  String get add_comment {
    return Intl.message(
      'Add Comment',
      name: 'add_comment',
      desc: '',
      args: [],
    );
  }

  /// `The amount entered in the cheques should be equal to the payable amount above`
  String get the_amount_entered {
    return Intl.message(
      'The amount entered in the cheques should be equal to the payable amount above',
      name: 'the_amount_entered',
      desc: '',
      args: [],
    );
  }

  /// `+Add Another Cheque`
  String get add_another_cheque {
    return Intl.message(
      '+Add Another Cheque',
      name: 'add_another_cheque',
      desc: '',
      args: [],
    );
  }

  /// `Issuer Name`
  String get issuer_name {
    return Intl.message(
      'Issuer Name',
      name: 'issuer_name',
      desc: '',
      args: [],
    );
  }

  /// `School tour cancelled successfully`
  String get school_tour_cancelled {
    return Intl.message(
      'School tour cancelled successfully',
      name: 'school_tour_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Payment Type`
  String get payment_type {
    return Intl.message(
      'Payment Type',
      name: 'payment_type',
      desc: '',
      args: [],
    );
  }

  /// `In Favour`
  String get in_favor {
    return Intl.message(
      'In Favour',
      name: 'in_favor',
      desc: '',
      args: [],
    );
  }

  /// `Cheque Image`
  String get cheque_image {
    return Intl.message(
      'Cheque Image',
      name: 'cheque_image',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule Test`
  String get reschedule_test {
    return Intl.message(
      'Reschedule Test',
      name: 'reschedule_test',
      desc: '',
      args: [],
    );
  }

  /// `Bus Attendance`
  String get bus_attendance {
    return Intl.message(
      'Bus Attendance',
      name: 'bus_attendance',
      desc: '',
      args: [],
    );
  }

  /// `Competency test details not found.`
  String get competency_test_details {
    return Intl.message(
      'Competency test details not found.',
      name: 'competency_test_details',
      desc: '',
      args: [],
    );
  }

  /// `Competency test cancelled successfully`
  String get competency_test_cancelled {
    return Intl.message(
      'Competency test cancelled successfully',
      name: 'competency_test_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Admission journey not found`
  String get admission_journey_not_found {
    return Intl.message(
      'Admission journey not found',
      name: 'admission_journey_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Subjects not found`
  String get subject_not_found {
    return Intl.message(
      'Subjects not found',
      name: 'subject_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Admission Journey`
  String get admission_journey {
    return Intl.message(
      'Admission Journey',
      name: 'admission_journey',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Response`
  String get response {
    return Intl.message(
      'Response',
      name: 'response',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment...`
  String get add_comment1 {
    return Intl.message(
      'Add Comment...',
      name: 'add_comment1',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Tour`
  String get cancel_tour {
    return Intl.message(
      'Cancel Tour',
      name: 'cancel_tour',
      desc: '',
      args: [],
    );
  }

  /// `Guest Count`
  String get guest_count {
    return Intl.message(
      'Guest Count',
      name: 'guest_count',
      desc: '',
      args: [],
    );
  }

  /// `Guest count cannot be empty`
  String get guest_count_cannot_be_empty {
    return Intl.message(
      'Guest count cannot be empty',
      name: 'guest_count_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Coming From`
  String get coming_from {
    return Intl.message(
      'Coming From',
      name: 'coming_from',
      desc: '',
      args: [],
    );
  }

  /// `Select school cannot be empty`
  String get select_school_cannot_be_empty {
    return Intl.message(
      'Select school cannot be empty',
      name: 'select_school_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Purpose of visit cannot be empty`
  String get purpose_of_visit_cannot_be_empty {
    return Intl.message(
      'Purpose of visit cannot be empty',
      name: 'purpose_of_visit_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email ID`
  String get email_iD {
    return Intl.message(
      'Email ID',
      name: 'email_iD',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Number`
  String get vehicle_number {
    return Intl.message(
      'Vehicle Number',
      name: 'vehicle_number',
      desc: '',
      args: [],
    );
  }

  /// `Coming from cannot be empty`
  String get coming_from_cannot_be_empty {
    return Intl.message(
      'Coming from cannot be empty',
      name: 'coming_from_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Point Of Contact`
  String get point_Of_contact {
    return Intl.message(
      'Point Of Contact',
      name: 'point_Of_contact',
      desc: '',
      args: [],
    );
  }

  /// `Point of contact cannot be empty`
  String get point_of_contact_cannot_be_empty {
    return Intl.message(
      'Point of contact cannot be empty',
      name: 'point_of_contact_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Visit Date & Time`
  String get visit_Date_Time {
    return Intl.message(
      'Visit Date & Time',
      name: 'visit_Date_Time',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get email_is_not_valid {
    return Intl.message(
      'Email is not valid',
      name: 'email_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get email_cannot_be_empty {
    return Intl.message(
      'Email cannot be empty',
      name: 'email_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Contact number cannot be less than 10 digits`
  String get contact_number_cannot_be_less_than_digits {
    return Intl.message(
      'Contact number cannot be less than 10 digits',
      name: 'contact_number_cannot_be_less_than_digits',
      desc: '',
      args: [],
    );
  }

  /// `Contact number cannot be empty`
  String get contact_number_cannot_be_empty {
    return Intl.message(
      'Contact number cannot be empty',
      name: 'contact_number_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message(
      'Timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `Student Name`
  String get student_name {
    return Intl.message(
      'Student Name',
      name: 'student_name',
      desc: '',
      args: [],
    );
  }

  /// `Student Name cannot be empty`
  String get student_name_cannot_be_empty {
    return Intl.message(
      'Student Name cannot be empty',
      name: 'student_name_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Parent Name`
  String get parent_name {
    return Intl.message(
      'Parent Name',
      name: 'parent_name',
      desc: '',
      args: [],
    );
  }

  /// `No Trip List Found`
  String get no_trip_found {
    return Intl.message(
      'No Trip List Found',
      name: 'no_trip_found',
      desc: '',
      args: [],
    );
  }

  /// `Parent Name cannot be empty`
  String get parent_name_cannot_be_empty {
    return Intl.message(
      'Parent Name cannot be empty',
      name: 'parent_name_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enquiry Timeline`
  String get enquiry_Timeline {
    return Intl.message(
      'Enquiry Timeline',
      name: 'enquiry_Timeline',
      desc: '',
      args: [],
    );
  }

  /// `Upload Documents`
  String get upload_documents {
    return Intl.message(
      'Upload Documents',
      name: 'upload_documents',
      desc: '',
      args: [],
    );
  }

  /// `Details not found`
  String get details_not_found {
    return Intl.message(
      'Details not found',
      name: 'details_not_found',
      desc: '',
      args: [],
    );
  }

  /// `NA`
  String get nA {
    return Intl.message(
      'NA',
      name: 'nA',
      desc: '',
      args: [],
    );
  }

  /// `School tour details not found`
  String get school_tour_details_not_found {
    return Intl.message(
      'School tour details not found',
      name: 'school_tour_details_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule Tour`
  String get reschedule_tour {
    return Intl.message(
      'Reschedule Tour',
      name: 'reschedule_tour',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get select_category {
    return Intl.message(
      'Select Category',
      name: 'select_category',
      desc: '',
      args: [],
    );
  }

  /// `Select Sub Category`
  String get select_sub_category {
    return Intl.message(
      'Select Sub Category',
      name: 'select_sub_category',
      desc: '',
      args: [],
    );
  }

  /// `Now You Can Request/Check This From Menu > Fees > Payment Details `
  String get now_you_can {
    return Intl.message(
      'Now You Can Request/Check This From Menu > Fees > Payment Details ',
      name: 'now_you_can',
      desc: '',
      args: [],
    );
  }

  /// `Go To Payment Details`
  String get go_to_payments {
    return Intl.message(
      'Go To Payment Details',
      name: 'go_to_payments',
      desc: '',
      args: [],
    );
  }

  /// `Create Gate-Pass`
  String get create_gate_pass {
    return Intl.message(
      'Create Gate-Pass',
      name: 'create_gate_pass',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms and conditions`
  String get please_accept {
    return Intl.message(
      'Please accept the terms and conditions',
      name: 'please_accept',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Contact`
  String get emergency_contact {
    return Intl.message(
      'Emergency Contact',
      name: 'emergency_contact',
      desc: '',
      args: [],
    );
  }

  /// `Point Of Contact`
  String get point_Of_Contact {
    return Intl.message(
      'Point Of Contact',
      name: 'point_Of_Contact',
      desc: '',
      args: [],
    );
  }

  /// `Parent Mobile Number`
  String get parent_mobile_no {
    return Intl.message(
      'Parent Mobile Number',
      name: 'parent_mobile_no',
      desc: '',
      args: [],
    );
  }

  /// `Parent Email Id`
  String get parent_email_Id {
    return Intl.message(
      'Parent Email Id',
      name: 'parent_email_Id',
      desc: '',
      args: [],
    );
  }

  /// `Residential Details`
  String get residential_details {
    return Intl.message(
      'Residential Details',
      name: 'residential_details',
      desc: '',
      args: [],
    );
  }

  /// `House No./ Building`
  String get house_no {
    return Intl.message(
      'House No./ Building',
      name: 'house_no',
      desc: '',
      args: [],
    );
  }

  /// `Preference 2`
  String get preference2 {
    return Intl.message(
      'Preference 2',
      name: 'preference2',
      desc: '',
      args: [],
    );
  }

  /// `Pin Code`
  String get pin_code {
    return Intl.message(
      'Pin Code',
      name: 'pin_code',
      desc: '',
      args: [],
    );
  }

  /// `Is Permanent Address Same As Present?`
  String get is_Permanent_Address_same_as_present {
    return Intl.message(
      'Is Permanent Address Same As Present?',
      name: 'is_Permanent_Address_same_as_present',
      desc: '',
      args: [],
    );
  }

  /// `Landmark`
  String get landmark {
    return Intl.message(
      'Landmark',
      name: 'landmark',
      desc: '',
      args: [],
    );
  }

  /// `Street Name`
  String get street_name {
    return Intl.message(
      'Street Name',
      name: 'street_name',
      desc: '',
      args: [],
    );
  }

  /// `Student First Name`
  String get student_first_name {
    return Intl.message(
      'Student First Name',
      name: 'student_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Parent First Name`
  String get parent_first_name {
    return Intl.message(
      'Parent First Name',
      name: 'parent_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Office Address`
  String get office_Address {
    return Intl.message(
      'Office Address',
      name: 'office_Address',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Pan Card No`
  String get mother_pan_card_no {
    return Intl.message(
      'Mother\'s Pan Card No',
      name: 'mother_pan_card_no',
      desc: '',
      args: [],
    );
  }

  /// `Parent Last Name`
  String get parent_last_name {
    return Intl.message(
      'Parent Last Name',
      name: 'parent_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Student Last Name`
  String get student_last_name {
    return Intl.message(
      'Student Last Name',
      name: 'student_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Prefference 1`
  String get preference1 {
    return Intl.message(
      'Prefference 1',
      name: 'preference1',
      desc: '',
      args: [],
    );
  }

  /// `Eligible Grade`
  String get eligible_grade {
    return Intl.message(
      'Eligible Grade',
      name: 'eligible_grade',
      desc: '',
      args: [],
    );
  }

  /// `Student Aadhar No`
  String get student_Aadhar_no {
    return Intl.message(
      'Student Aadhar No',
      name: 'student_Aadhar_no',
      desc: '',
      args: [],
    );
  }

  /// `Existing School Name`
  String get existing_School_Name {
    return Intl.message(
      'Existing School Name',
      name: 'existing_School_Name',
      desc: '',
      args: [],
    );
  }

  /// `Place Of Birth`
  String get place_Of_birth {
    return Intl.message(
      'Place Of Birth',
      name: 'place_Of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Prefference 3`
  String get preference3 {
    return Intl.message(
      'Prefference 3',
      name: 'preference3',
      desc: '',
      args: [],
    );
  }

  /// `Enquiry Type`
  String get enquiry_type {
    return Intl.message(
      'Enquiry Type',
      name: 'enquiry_type',
      desc: '',
      args: [],
    );
  }

  /// `Student Detail`
  String get student_detail {
    return Intl.message(
      'Student Detail',
      name: 'student_detail',
      desc: '',
      args: [],
    );
  }

  /// `Parent Type`
  String get parent_type {
    return Intl.message(
      'Parent Type',
      name: 'parent_type',
      desc: '',
      args: [],
    );
  }

  /// `School Location`
  String get school_location {
    return Intl.message(
      'School Location',
      name: 'school_location',
      desc: '',
      args: [],
    );
  }

  /// `Enquiry Number`
  String get enquiry_no {
    return Intl.message(
      'Enquiry Number',
      name: 'enquiry_no',
      desc: '',
      args: [],
    );
  }

  /// `Enquiry Date`
  String get enquiry_dt {
    return Intl.message(
      'Enquiry Date',
      name: 'enquiry_dt',
      desc: '',
      args: [],
    );
  }

  /// `Status :`
  String get status {
    return Intl.message(
      'Status :',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Apply Action`
  String get apply_action {
    return Intl.message(
      'Apply Action',
      name: 'apply_action',
      desc: '',
      args: [],
    );
  }

  /// `Father's Pan Card No`
  String get father_Pan_Card_No {
    return Intl.message(
      'Father\'s Pan Card No',
      name: 'father_Pan_Card_No',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's Pan Card No`
  String get gardian_Pan_Card_No {
    return Intl.message(
      'Guardian\'s Pan Card No',
      name: 'gardian_Pan_Card_No',
      desc: '',
      args: [],
    );
  }

  /// `Office Address`
  String get office_address {
    return Intl.message(
      'Office Address',
      name: 'office_address',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Pan Card No`
  String get mother_Pan_Card_No {
    return Intl.message(
      'Mother\'s Pan Card No',
      name: 'mother_Pan_Card_No',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Aadhar Card No`
  String get mother_Aadhar_Card_no {
    return Intl.message(
      'Mother\'s Aadhar Card No',
      name: 'mother_Aadhar_Card_no',
      desc: '',
      args: [],
    );
  }

  /// `Mother's First Name`
  String get mother_first_name {
    return Intl.message(
      'Mother\'s First Name',
      name: 'mother_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Sibling's First Name`
  String get sibling_first_name {
    return Intl.message(
      'Sibling\'s First Name',
      name: 'sibling_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Last Name`
  String get Mother_last_name {
    return Intl.message(
      'Mother\'s Last Name',
      name: 'Mother_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Sibling's Last Name`
  String get sibling_last_name {
    return Intl.message(
      'Sibling\'s Last Name',
      name: 'sibling_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Details`
  String get mother_Details {
    return Intl.message(
      'Mother\'s Details',
      name: 'mother_Details',
      desc: '',
      args: [],
    );
  }

  /// `Father's Mobile Number`
  String get father_Mobile_Number {
    return Intl.message(
      'Father\'s Mobile Number',
      name: 'father_Mobile_Number',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Mobile Number`
  String get mother_Mobile_Number {
    return Intl.message(
      'Mother\'s Mobile Number',
      name: 'mother_Mobile_Number',
      desc: '',
      args: [],
    );
  }

  /// `Custodian Guardian`
  String get custodian_guardian {
    return Intl.message(
      'Custodian Guardian',
      name: 'custodian_guardian',
      desc: '',
      args: [],
    );
  }

  /// `Are Parent Saperated`
  String get are_parent_saper {
    return Intl.message(
      'Are Parent Saperated',
      name: 'are_parent_saper',
      desc: '',
      args: [],
    );
  }

  /// `Legal Guardian`
  String get legal_guardian {
    return Intl.message(
      'Legal Guardian',
      name: 'legal_guardian',
      desc: '',
      args: [],
    );
  }

  /// `Not Applicable`
  String get not_applicable {
    return Intl.message(
      'Not Applicable',
      name: 'not_applicable',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's Mobile Number`
  String get guardian_Mobile_Number {
    return Intl.message(
      'Guardian\'s Mobile Number',
      name: 'guardian_Mobile_Number',
      desc: '',
      args: [],
    );
  }

  /// `Father's Email ID`
  String get father_Email_ID {
    return Intl.message(
      'Father\'s Email ID',
      name: 'father_Email_ID',
      desc: '',
      args: [],
    );
  }

  /// `Mother's Email ID`
  String get mother_Email_ID {
    return Intl.message(
      'Mother\'s Email ID',
      name: 'mother_Email_ID',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Father`
  String get father {
    return Intl.message(
      'Father',
      name: 'father',
      desc: '',
      args: [],
    );
  }

  /// `Mother`
  String get mother {
    return Intl.message(
      'Mother',
      name: 'mother',
      desc: '',
      args: [],
    );
  }

  /// `Who Has The Custody Of the Child?`
  String get who_Has_The_Custody_Of_the_Child {
    return Intl.message(
      'Who Has The Custody Of the Child?',
      name: 'who_Has_The_Custody_Of_the_Child',
      desc: '',
      args: [],
    );
  }

  /// `Are Parent's Separated?`
  String get are_parent_Separated {
    return Intl.message(
      'Are Parent\'s Separated?',
      name: 'are_parent_Separated',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's Email ID`
  String get gardian_Email_ID {
    return Intl.message(
      'Guardian\'s Email ID',
      name: 'gardian_Email_ID',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message(
      'Students',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `Non-Vibgyor Student`
  String get non_vibgyor_Student {
    return Intl.message(
      'Non-Vibgyor Student',
      name: 'non_vibgyor_Student',
      desc: '',
      args: [],
    );
  }

  /// `Is Sibling`
  String get is_sibling {
    return Intl.message(
      'Is Sibling',
      name: 'is_sibling',
      desc: '',
      args: [],
    );
  }

  /// `Vibgyor Student`
  String get vibgyor_student {
    return Intl.message(
      'Vibgyor Student',
      name: 'vibgyor_student',
      desc: '',
      args: [],
    );
  }

  /// `Father's detail`
  String get father_detail {
    return Intl.message(
      'Father\'s detail',
      name: 'father_detail',
      desc: '',
      args: [],
    );
  }

  /// `Sibling's detail`
  String get sibling_detail {
    return Intl.message(
      'Sibling\'s detail',
      name: 'sibling_detail',
      desc: '',
      args: [],
    );
  }

  /// `For Sibling 1`
  String get for_sibling_1 {
    return Intl.message(
      'For Sibling 1',
      name: 'for_sibling_1',
      desc: '',
      args: [],
    );
  }

  /// `For Sibling 2`
  String get for_sibling_2 {
    return Intl.message(
      'For Sibling 2',
      name: 'for_sibling_2',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's detail`
  String get guardian_detail {
    return Intl.message(
      'Guardian\'s detail',
      name: 'guardian_detail',
      desc: '',
      args: [],
    );
  }

  /// `Father's First Name`
  String get father_first_name {
    return Intl.message(
      'Father\'s First Name',
      name: 'father_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's First Name`
  String get gardian_first_name {
    return Intl.message(
      'Guardian\'s First Name',
      name: 'gardian_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Father's Last Name`
  String get father_last_name {
    return Intl.message(
      'Father\'s Last Name',
      name: 'father_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's Last Name`
  String get gardian_last_name {
    return Intl.message(
      'Guardian\'s Last Name',
      name: 'gardian_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Father's Aadhar Card No`
  String get father_adhar_no {
    return Intl.message(
      'Father\'s Aadhar Card No',
      name: 'father_adhar_no',
      desc: '',
      args: [],
    );
  }

  /// `Guardian's Aadhar Card No`
  String get gardian_adhar_no {
    return Intl.message(
      'Guardian\'s Aadhar Card No',
      name: 'gardian_adhar_no',
      desc: '',
      args: [],
    );
  }

  /// `Current Date Cheque / Post Dated Cheque / ...`
  String get current_date_cheque {
    return Intl.message(
      'Current Date Cheque / Post Dated Cheque / ...',
      name: 'current_date_cheque',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Select payment Method`
  String get select_payments_method {
    return Intl.message(
      'Select payment Method',
      name: 'select_payments_method',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupons`
  String get apply_coupons {
    return Intl.message(
      'Apply Coupons',
      name: 'apply_coupons',
      desc: '',
      args: [],
    );
  }

  /// `Your Session has expired.Please log in again to continue`
  String get session_expired {
    return Intl.message(
      'Your Session has expired.Please log in again to continue',
      name: 'session_expired',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue1 {
    return Intl.message(
      'Continue',
      name: 'continue1',
      desc: '',
      args: [],
    );
  }

  /// `Lets get Started`
  String get lets_get_started {
    return Intl.message(
      'Lets get Started',
      name: 'lets_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `Bus Service`
  String get bus_service {
    return Intl.message(
      'Bus Service',
      name: 'bus_service',
      desc: '',
      args: [],
    );
  }

  /// `Change Time`
  String get change_time {
    return Intl.message(
      'Change Time',
      name: 'change_time',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Parent Contact Number`
  String get parent_contact_number {
    return Intl.message(
      'Parent Contact Number',
      name: 'parent_contact_number',
      desc: '',
      args: [],
    );
  }

  /// `Two way`
  String get two_way {
    return Intl.message(
      'Two way',
      name: 'two_way',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Location`
  String get pickup_location {
    return Intl.message(
      'Pickup Location',
      name: 'pickup_location',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Time`
  String get pickup_time {
    return Intl.message(
      'Pickup Time',
      name: 'pickup_time',
      desc: '',
      args: [],
    );
  }

  /// `Drop Location`
  String get drop_location {
    return Intl.message(
      'Drop Location',
      name: 'drop_location',
      desc: '',
      args: [],
    );
  }

  /// `Drop Time`
  String get drop_time {
    return Intl.message(
      'Drop Time',
      name: 'drop_time',
      desc: '',
      args: [],
    );
  }

  /// `Bearers`
  String get bearers {
    return Intl.message(
      'Bearers',
      name: 'bearers',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get select_time {
    return Intl.message(
      'Select Time',
      name: 'select_time',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule School Tour`
  String get reschedule_school_tour {
    return Intl.message(
      'Reschedule School Tour',
      name: 'reschedule_school_tour',
      desc: '',
      args: [],
    );
  }

  /// `Schedule School Tour`
  String get schedule_school_tour {
    return Intl.message(
      'Schedule School Tour',
      name: 'schedule_school_tour',
      desc: '',
      args: [],
    );
  }

  /// `School tour rescheduled successfully`
  String get school_tour_rescheduled_successfully {
    return Intl.message(
      'School tour rescheduled successfully',
      name: 'school_tour_rescheduled_successfully',
      desc: '',
      args: [],
    );
  }

  /// `School tour scheduled successfully`
  String get school_tour_scheduled_successfully {
    return Intl.message(
      'School tour scheduled successfully',
      name: 'school_tour_scheduled_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Review Page`
  String get review_page {
    return Intl.message(
      'Review Page',
      name: 'review_page',
      desc: '',
      args: [],
    );
  }

  /// `Reviewed`
  String get reviewed {
    return Intl.message(
      'Reviewed',
      name: 'reviewed',
      desc: '',
      args: [],
    );
  }

  /// `No VAS Option for PSA available`
  String get no_VAS_Option_for_PSA_available {
    return Intl.message(
      'No VAS Option for PSA available',
      name: 'no_VAS_Option_for_PSA_available',
      desc: '',
      args: [],
    );
  }

  /// `No VAS option for Kids Club available`
  String get no_VAS_option_for_Kids_Club_available {
    return Intl.message(
      'No VAS option for Kids Club available',
      name: 'no_VAS_option_for_Kids_Club_available',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Enroll Now`
  String get enroll_now {
    return Intl.message(
      'Enroll Now',
      name: 'enroll_now',
      desc: '',
      args: [],
    );
  }

  /// `Opt For`
  String get opt_for {
    return Intl.message(
      'Opt For',
      name: 'opt_for',
      desc: '',
      args: [],
    );
  }

  /// `Select Post School Activity`
  String get select_post_school_activity {
    return Intl.message(
      'Select Post School Activity',
      name: 'select_post_school_activity',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculate {
    return Intl.message(
      'Calculate',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `PSA Activity`
  String get psa_Activity {
    return Intl.message(
      'PSA Activity',
      name: 'psa_Activity',
      desc: '',
      args: [],
    );
  }

  /// `Period Of Service`
  String get period_of_service {
    return Intl.message(
      'Period Of Service',
      name: 'period_of_service',
      desc: '',
      args: [],
    );
  }

  /// `No VAS option for Cafeteria available`
  String get no_VAS_option_for_cafeteria_available {
    return Intl.message(
      'No VAS option for Cafeteria available',
      name: 'no_VAS_option_for_cafeteria_available',
      desc: '',
      args: [],
    );
  }

  /// `No VAS option for Summer Camp available`
  String get no_VAS_option_for_summer_camp_available {
    return Intl.message(
      'No VAS option for Summer Camp available',
      name: 'no_VAS_option_for_summer_camp_available',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `PSA Sub Type`
  String get pSA_Sub_Type {
    return Intl.message(
      'PSA Sub Type',
      name: 'pSA_Sub_Type',
      desc: '',
      args: [],
    );
  }

  /// `Select Post School Activity`
  String get select_Post_School_Activity {
    return Intl.message(
      'Select Post School Activity',
      name: 'select_Post_School_Activity',
      desc: '',
      args: [],
    );
  }

  /// `Create New Ticket`
  String get create_new_ticket {
    return Intl.message(
      'Create New Ticket',
      name: 'create_new_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Slots are Not Available`
  String get slots_not_available {
    return Intl.message(
      'Slots are Not Available',
      name: 'slots_not_available',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Point`
  String get pickup_Point {
    return Intl.message(
      'Pickup Point',
      name: 'pickup_Point',
      desc: '',
      args: [],
    );
  }

  /// `Date : `
  String get date {
    return Intl.message(
      'Date : ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `View Notes`
  String get view_notes {
    return Intl.message(
      'View Notes',
      name: 'view_notes',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Stream:`
  String get stream {
    return Intl.message(
      'Stream:',
      name: 'stream',
      desc: '',
      args: [],
    );
  }

  /// `Choose One Way Route`
  String get choose_One_Way_Route {
    return Intl.message(
      'Choose One Way Route',
      name: 'choose_One_Way_Route',
      desc: '',
      args: [],
    );
  }

  /// `Drop Point`
  String get drop_Point {
    return Intl.message(
      'Drop Point',
      name: 'drop_Point',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get Transport {
    return Intl.message(
      'Transport',
      name: 'Transport',
      desc: '',
      args: [],
    );
  }

  /// `Select Service Type`
  String get select_service_type {
    return Intl.message(
      'Select Service Type',
      name: 'select_service_type',
      desc: '',
      args: [],
    );
  }

  /// `Select Bus Type`
  String get select_bus_type {
    return Intl.message(
      'Select Bus Type',
      name: 'select_bus_type',
      desc: '',
      args: [],
    );
  }

  /// `Summer Camp`
  String get summer_camp {
    return Intl.message(
      'Summer Camp',
      name: 'summer_camp',
      desc: '',
      args: [],
    );
  }

  /// `Calculated Amount`
  String get calculated_amount {
    return Intl.message(
      'Calculated Amount',
      name: 'calculated_amount',
      desc: '',
      args: [],
    );
  }

  /// `Important`
  String get important {
    return Intl.message(
      'Important',
      name: 'important',
      desc: '',
      args: [],
    );
  }

  /// `User cancelled authentication`
  String get user_cancelled_authentication {
    return Intl.message(
      'User cancelled authentication',
      name: 'user_cancelled_authentication',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get an_unexpected_error_occurred {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'an_unexpected_error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Unread`
  String get unread {
    return Intl.message(
      'Unread',
      name: 'unread',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get no_data_found {
    return Intl.message(
      'No data found',
      name: 'no_data_found',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get read {
    return Intl.message(
      'Read',
      name: 'read',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `This Week`
  String get this_week {
    return Intl.message(
      'This Week',
      name: 'this_week',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get no_data {
    return Intl.message(
      'No Data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Student Profile`
  String get student_profile {
    return Intl.message(
      'Student Profile',
      name: 'student_profile',
      desc: '',
      args: [],
    );
  }

  /// `Select Academic Year`
  String get select_academic_year {
    return Intl.message(
      'Select Academic Year',
      name: 'select_academic_year',
      desc: '',
      args: [],
    );
  }

  /// `Student Enrolment Successful`
  String get student_enrolment_successful {
    return Intl.message(
      'Student Enrolment Successful',
      name: 'student_enrolment_successful',
      desc: '',
      args: [],
    );
  }

  /// `Kids Club`
  String get kids_club {
    return Intl.message(
      'Kids Club',
      name: 'kids_club',
      desc: '',
      args: [],
    );
  }

  /// `Cafeteria`
  String get cafeteria {
    return Intl.message(
      'Cafeteria',
      name: 'cafeteria',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get transport {
    return Intl.message(
      'Transport',
      name: 'transport',
      desc: '',
      args: [],
    );
  }

  /// `No VAS option for Kids Club available`
  String get no_vas_avalaible {
    return Intl.message(
      'No VAS option for Kids Club available',
      name: 'no_vas_avalaible',
      desc: '',
      args: [],
    );
  }

  /// `Open Enquiries`
  String get open_enquiry {
    return Intl.message(
      'Open Enquiries',
      name: 'open_enquiry',
      desc: '',
      args: [],
    );
  }

  /// `Closed Enquiries`
  String get closed_enquiries {
    return Intl.message(
      'Closed Enquiries',
      name: 'closed_enquiries',
      desc: '',
      args: [],
    );
  }

  /// `No Enquiry Found`
  String get no_enquiry_found {
    return Intl.message(
      'No Enquiry Found',
      name: 'no_enquiry_found',
      desc: '',
      args: [],
    );
  }

  /// `Enquiries`
  String get Enquiries {
    return Intl.message(
      'Enquiries',
      name: 'Enquiries',
      desc: '',
      args: [],
    );
  }

  /// `No Admissions Found`
  String get no_admission_found {
    return Intl.message(
      'No Admissions Found',
      name: 'no_admission_found',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get attachment {
    return Intl.message(
      'Attachment',
      name: 'attachment',
      desc: '',
      args: [],
    );
  }

  /// `Add Attachment`
  String get add_attachment {
    return Intl.message(
      'Add Attachment',
      name: 'add_attachment',
      desc: '',
      args: [],
    );
  }

  /// `Note cannot be empty`
  String get note_cannot_be_empty {
    return Intl.message(
      'Note cannot be empty',
      name: 'note_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enter Note`
  String get enter_note {
    return Intl.message(
      'Enter Note',
      name: 'enter_note',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Test Time`
  String get test_Time {
    return Intl.message(
      'Test Time',
      name: 'test_Time',
      desc: '',
      args: [],
    );
  }

  /// `Test details`
  String get test_details {
    return Intl.message(
      'Test details',
      name: 'test_details',
      desc: '',
      args: [],
    );
  }

  /// `Request Date`
  String get request_date {
    return Intl.message(
      'Request Date',
      name: 'request_date',
      desc: '',
      args: [],
    );
  }

  /// `Raise Intimation`
  String get raise_Intimation {
    return Intl.message(
      'Raise Intimation',
      name: 'raise_Intimation',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get mode {
    return Intl.message(
      'Mode',
      name: 'mode',
      desc: '',
      args: [],
    );
  }

  /// `School`
  String get school {
    return Intl.message(
      'School',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Disciplinary Slip`
  String get disciplinary_Slip {
    return Intl.message(
      'Disciplinary Slip',
      name: 'disciplinary_Slip',
      desc: '',
      args: [],
    );
  }

  /// `Slip Information`
  String get slip_information {
    return Intl.message(
      'Slip Information',
      name: 'slip_information',
      desc: '',
      args: [],
    );
  }

  /// `No Slip Available`
  String get no_slip_available {
    return Intl.message(
      'No Slip Available',
      name: 'no_slip_available',
      desc: '',
      args: [],
    );
  }

  /// `Test Result`
  String get test_Result {
    return Intl.message(
      'Test Result',
      name: 'test_Result',
      desc: '',
      args: [],
    );
  }

  /// `School tour Scheduled details`
  String get school_tour_scheduled_details {
    return Intl.message(
      'School tour Scheduled details',
      name: 'school_tour_scheduled_details',
      desc: '',
      args: [],
    );
  }

  /// `Selected Time`
  String get selected_Time {
    return Intl.message(
      'Selected Time',
      name: 'selected_Time',
      desc: '',
      args: [],
    );
  }

  /// `Student Disciplinary Action`
  String get student_disciplinary_action {
    return Intl.message(
      'Student Disciplinary Action',
      name: 'student_disciplinary_action',
      desc: '',
      args: [],
    );
  }

  /// `Disciplinary Action : `
  String get disciplinary_Action {
    return Intl.message(
      'Disciplinary Action : ',
      name: 'disciplinary_Action',
      desc: '',
      args: [],
    );
  }

  /// `Parent`
  String get parent {
    return Intl.message(
      'Parent',
      name: 'parent',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledge`
  String get acknowledge {
    return Intl.message(
      'Acknowledge',
      name: 'acknowledge',
      desc: '',
      args: [],
    );
  }

  /// `Acknowledged`
  String get acknowledged {
    return Intl.message(
      'Acknowledged',
      name: 'acknowledged',
      desc: '',
      args: [],
    );
  }

  /// `Slip`
  String get slip {
    return Intl.message(
      'Slip',
      name: 'slip',
      desc: '',
      args: [],
    );
  }

  /// `Payment Detail`
  String get payment_det {
    return Intl.message(
      'Payment Detail',
      name: 'payment_det',
      desc: '',
      args: [],
    );
  }

  /// `Partially Paid`
  String get partially_paid {
    return Intl.message(
      'Partially Paid',
      name: 'partially_paid',
      desc: '',
      args: [],
    );
  }

  /// `Reallocation`
  String get reallocation {
    return Intl.message(
      'Reallocation',
      name: 'reallocation',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupon`
  String get apply_couppon {
    return Intl.message(
      'Apply Coupon',
      name: 'apply_couppon',
      desc: '',
      args: [],
    );
  }

  /// `The maximum applied limit for this coupon has been reached.`
  String get the_max_applied_coupon {
    return Intl.message(
      'The maximum applied limit for this coupon has been reached.',
      name: 'the_max_applied_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `- Show Less`
  String get show_less {
    return Intl.message(
      '- Show Less',
      name: 'show_less',
      desc: '',
      args: [],
    );
  }

  /// `Bank Info`
  String get bank_Info {
    return Intl.message(
      'Bank Info',
      name: 'bank_Info',
      desc: '',
      args: [],
    );
  }

  /// `Account Type`
  String get account_type {
    return Intl.message(
      'Account Type',
      name: 'account_type',
      desc: '',
      args: [],
    );
  }

  /// `I accept the terms & conditions`
  String get i_accept_the_terms {
    return Intl.message(
      'I accept the terms & conditions',
      name: 'i_accept_the_terms',
      desc: '',
      args: [],
    );
  }

  /// `UPI Id`
  String get upi_id {
    return Intl.message(
      'UPI Id',
      name: 'upi_id',
      desc: '',
      args: [],
    );
  }

  /// `UnderTaking`
  String get underTaking {
    return Intl.message(
      'UnderTaking',
      name: 'underTaking',
      desc: '',
      args: [],
    );
  }

  /// `UPI info`
  String get upi_info {
    return Intl.message(
      'UPI info',
      name: 'upi_info',
      desc: '',
      args: [],
    );
  }

  /// `+ Show More`
  String get show_more {
    return Intl.message(
      '+ Show More',
      name: 'show_more',
      desc: '',
      args: [],
    );
  }

  /// `No Coupons Found`
  String get no_coupons_found {
    return Intl.message(
      'No Coupons Found',
      name: 'no_coupons_found',
      desc: '',
      args: [],
    );
  }

  /// `Due Date`
  String get due_date {
    return Intl.message(
      'Due Date',
      name: 'due_date',
      desc: '',
      args: [],
    );
  }

  /// `Concession`
  String get concession {
    return Intl.message(
      'Concession',
      name: 'concession',
      desc: '',
      args: [],
    );
  }

  /// `Fees Type`
  String get fee_type {
    return Intl.message(
      'Fees Type',
      name: 'fee_type',
      desc: '',
      args: [],
    );
  }

  /// `Fees Sub Type`
  String get fee_subtype {
    return Intl.message(
      'Fees Sub Type',
      name: 'fee_subtype',
      desc: '',
      args: [],
    );
  }

  /// `Fees Category`
  String get fees_category {
    return Intl.message(
      'Fees Category',
      name: 'fees_category',
      desc: '',
      args: [],
    );
  }

  /// `No Pending fees found.`
  String get no_pending_fees_found {
    return Intl.message(
      'No Pending fees found.',
      name: 'no_pending_fees_found',
      desc: '',
      args: [],
    );
  }

  /// `Fees Sub Category`
  String get fees_sub_category {
    return Intl.message(
      'Fees Sub Category',
      name: 'fees_sub_category',
      desc: '',
      args: [],
    );
  }

  /// `Academic Year`
  String get academic_year {
    return Intl.message(
      'Academic Year',
      name: 'academic_year',
      desc: '',
      args: [],
    );
  }

  /// `Transaction ID`
  String get transaction_iD {
    return Intl.message(
      'Transaction ID',
      name: 'transaction_iD',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Date`
  String get transaction_dt {
    return Intl.message(
      'Transaction Date',
      name: 'transaction_dt',
      desc: '',
      args: [],
    );
  }

  /// `No Student Ledger Found`
  String get no_student_ledger_found {
    return Intl.message(
      'No Student Ledger Found',
      name: 'no_student_ledger_found',
      desc: '',
      args: [],
    );
  }

  /// `Payment Mode`
  String get payment_mode {
    return Intl.message(
      'Payment Mode',
      name: 'payment_mode',
      desc: '',
      args: [],
    );
  }

  /// `Fee Receipt Number`
  String get fee_reciept_number {
    return Intl.message(
      'Fee Receipt Number',
      name: 'fee_reciept_number',
      desc: '',
      args: [],
    );
  }

  /// `Medical Information`
  String get medical_information {
    return Intl.message(
      'Medical Information',
      name: 'medical_information',
      desc: '',
      args: [],
    );
  }

  /// `Has the child ever been hospitalized?`
  String get has_hospitalised {
    return Intl.message(
      'Has the child ever been hospitalized?',
      name: 'has_hospitalised',
      desc: '',
      args: [],
    );
  }

  /// `Year Of Hospitalization`
  String get year_Of_Hospitalization {
    return Intl.message(
      'Year Of Hospitalization',
      name: 'year_Of_Hospitalization',
      desc: '',
      args: [],
    );
  }

  /// `Reason Of Hospitalization`
  String get reason_Of_Hospitalization {
    return Intl.message(
      'Reason Of Hospitalization',
      name: 'reason_Of_Hospitalization',
      desc: '',
      args: [],
    );
  }

  /// `Select Year`
  String get select_Year {
    return Intl.message(
      'Select Year',
      name: 'select_Year',
      desc: '',
      args: [],
    );
  }

  /// `Physical Disabilities`
  String get physical_disabilities {
    return Intl.message(
      'Physical Disabilities',
      name: 'physical_disabilities',
      desc: '',
      args: [],
    );
  }

  /// `Specify Disability`
  String get specify__disability {
    return Intl.message(
      'Specify Disability',
      name: 'specify__disability',
      desc: '',
      args: [],
    );
  }

  /// `Medical History`
  String get medical_history {
    return Intl.message(
      'Medical History',
      name: 'medical_history',
      desc: '',
      args: [],
    );
  }

  /// `Specify Medical History`
  String get specify_Medical_History {
    return Intl.message(
      'Specify Medical History',
      name: 'specify_Medical_History',
      desc: '',
      args: [],
    );
  }

  /// `Allergies`
  String get allergies {
    return Intl.message(
      'Allergies',
      name: 'allergies',
      desc: '',
      args: [],
    );
  }

  /// `Specify Allergies`
  String get specify_allergies {
    return Intl.message(
      'Specify Allergies',
      name: 'specify_allergies',
      desc: '',
      args: [],
    );
  }

  /// `Personalised Learning Needs`
  String get personalised_Learning_Needs {
    return Intl.message(
      'Personalised Learning Needs',
      name: 'personalised_Learning_Needs',
      desc: '',
      args: [],
    );
  }

  /// `Basic Detail`
  String get basic_detail {
    return Intl.message(
      'Basic Detail',
      name: 'basic_detail',
      desc: '',
      args: [],
    );
  }

  /// `School Name`
  String get school_name {
    return Intl.message(
      'School Name',
      name: 'school_name',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dob {
    return Intl.message(
      'Date of Birth',
      name: 'dob',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get board {
    return Intl.message(
      'Board',
      name: 'board',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message(
      'Course',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `Grade`
  String get grade {
    return Intl.message(
      'Grade',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Division`
  String get division {
    return Intl.message(
      'Division',
      name: 'division',
      desc: '',
      args: [],
    );
  }

  /// `Shift`
  String get shift {
    return Intl.message(
      'Shift',
      name: 'shift',
      desc: '',
      args: [],
    );
  }

  /// `House`
  String get house {
    return Intl.message(
      'House',
      name: 'house',
      desc: '',
      args: [],
    );
  }

  /// `Medical Details`
  String get medical_details {
    return Intl.message(
      'Medical Details',
      name: 'medical_details',
      desc: '',
      args: [],
    );
  }

  /// `Physical Disability`
  String get physical_disability {
    return Intl.message(
      'Physical Disability',
      name: 'physical_disability',
      desc: '',
      args: [],
    );
  }

  /// `Allergies`
  String get alergies {
    return Intl.message(
      'Allergies',
      name: 'alergies',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Parent Details`
  String get parent_details {
    return Intl.message(
      'Parent Details',
      name: 'parent_details',
      desc: '',
      args: [],
    );
  }

  /// `Parent First Name `
  String get parent_First_name {
    return Intl.message(
      'Parent First Name ',
      name: 'parent_First_name',
      desc: '',
      args: [],
    );
  }

  /// `Parent Last Name`
  String get parent_Last_Name {
    return Intl.message(
      'Parent Last Name',
      name: 'parent_Last_Name',
      desc: '',
      args: [],
    );
  }

  /// `Address `
  String get address {
    return Intl.message(
      'Address ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 1`
  String get address_Line_1 {
    return Intl.message(
      'Address Line 1',
      name: 'address_Line_1',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 2`
  String get address_Line_2 {
    return Intl.message(
      'Address Line 2',
      name: 'address_Line_2',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Pincode`
  String get pincode {
    return Intl.message(
      'Pincode',
      name: 'pincode',
      desc: '',
      args: [],
    );
  }

  /// `Learning Needs`
  String get learning_needs {
    return Intl.message(
      'Learning Needs',
      name: 'learning_needs',
      desc: '',
      args: [],
    );
  }

  /// `Board_cannot_be_empty`
  String get board_cannot_be_empty {
    return Intl.message(
      'Board_cannot_be_empty',
      name: 'board_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `School name cannot be empty`
  String get school_name_cannot_empty {
    return Intl.message(
      'School name cannot be empty',
      name: 'school_name_cannot_empty',
      desc: '',
      args: [],
    );
  }

  /// `Date Of Birth cannot be empty`
  String get date_Of_birth_cannot_be_empty {
    return Intl.message(
      'Date Of Birth cannot be empty',
      name: 'date_Of_birth_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Course cannot be empty`
  String get course_cannot_be_empty {
    return Intl.message(
      'Course cannot be empty',
      name: 'course_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Grade cannot be empty`
  String get grade_cannot_be_empty {
    return Intl.message(
      'Grade cannot be empty',
      name: 'grade_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Division cannot be empty`
  String get division_cannot_be_empty {
    return Intl.message(
      'Division cannot be empty',
      name: 'division_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Shift cannot be empty`
  String get shift_cannot_be_empty {
    return Intl.message(
      'Shift cannot be empty',
      name: 'shift_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `House cannot be empty`
  String get house_cannot_be_empty {
    return Intl.message(
      'House cannot be empty',
      name: 'house_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Allergies cannot be empty`
  String get allergies_cannot_be_empty {
    return Intl.message(
      'Allergies cannot be empty',
      name: 'allergies_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Learning Needs cannot be empty`
  String get learning_needs_cannot_be_empty {
    return Intl.message(
      'Learning Needs cannot be empty',
      name: 'learning_needs_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `First Name cannot be empty`
  String get first_name_cannot_be_empty {
    return Intl.message(
      'First Name cannot be empty',
      name: 'first_name_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `last Name cannot be empty`
  String get last_name_cannot_be_empty {
    return Intl.message(
      'last Name cannot be empty',
      name: 'last_name_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Phone cannot be empty`
  String get phone_cannot_be_empty {
    return Intl.message(
      'Phone cannot be empty',
      name: 'phone_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `City cannot be empty`
  String get city_cannot_be_empty {
    return Intl.message(
      'City cannot be empty',
      name: 'city_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again to continue.`
  String get your_session_expired {
    return Intl.message(
      'Your session has expired. Please log in again to continue.',
      name: 'your_session_expired',
      desc: '',
      args: [],
    );
  }

  /// `State cannot be empty`
  String get state_cannot_be_empty {
    return Intl.message(
      'State cannot be empty',
      name: 'state_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Physical Disability  cannot be empty`
  String get physical_disability_cannot_be_empty {
    return Intl.message(
      'Physical Disability  cannot be empty',
      name: 'physical_disability_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Medical History cannot be empty`
  String get medical_history_cannot_be_empty {
    return Intl.message(
      'Medical History cannot be empty',
      name: 'medical_history_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 1 cannot be empty`
  String get address_Line1_cannot_be_empty {
    return Intl.message(
      'Address Line 1 cannot be empty',
      name: 'address_Line1_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Address Line 2 cannot be empty`
  String get address_Line2_cannot_be_empty {
    return Intl.message(
      'Address Line 2 cannot be empty',
      name: 'address_Line2_cannot_be_empty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
