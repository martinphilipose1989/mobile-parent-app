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

  /// `Attendance`
  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
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

  /// `I accept the terms & conditions`
  String get i_accept_the_terms {
    return Intl.message(
      'I accept the terms & conditions',
      name: 'i_accept_the_terms',
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

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
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
