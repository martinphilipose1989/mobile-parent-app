/// Support for doing something awesome.
///
/// More dartdocs go here.
library domain;

export 'src/di/domain_dependency_configurator.dart';
export 'package:dartz/dartz.dart';

//repository contracts
export 'src/repository/user_repository.dart';
export 'src/repository/finance_repository.dart';
export 'src/repository/marketing/enquiry_repository.dart';
export 'src/repository/marketing/school_visit_repository.dart';
export 'src/repository/marketing/competency_test_repository.dart';
export 'src/repository/marketing/admission_repository.dart';
export 'src/repository/marketing/registration_repository.dart';
export 'src/repository/gatepass/gatepass_repository.dart';

//use-cases
export 'src/usecase/base/params.dart';
export 'src/usecase/user/login_usecase.dart';
export 'src/usecase/finance/get_academic_year_usecase.dart';
export 'src/usecase/finance/get_guardian_student_details_usecase.dart';
export 'src/usecase/finance/get_token_generator_usecase.dart';
export 'src/usecase/finance/get_validate_pay_now.dart';
export 'src/usecase/finance/get_pending_fees_usecase.dart';
export 'src/usecase//finance/get_school_names_usecase.dart';
export 'src/usecase/finance/get_store_payment_usecase.dart';
export 'src/usecase/marketing/get_enquiry_list_usecase.dart';
export 'src/usecase/marketing/get_enquiry_detail_usecase.dart';
export 'src/usecase/marketing/get_admission_journey_usecase.dart';
export 'src/usecase/marketing/get_ivt_detail_usecase.dart';
export 'src/usecase/marketing/get_new_admission_detail_usecase.dart';
export 'src/usecase/marketing/get_psa_detail_usecase.dart';
export 'src/usecase/marketing/get_admission_list_usecase.dart';
export 'src/usecase/marketing/update_parent_details_usecase.dart';
export 'src/usecase/marketing/update_medical_details_usecase.dart';
export 'src/usecase/marketing/update_contact_details_usecase.dart';
export 'src/usecase/marketing/update_bank_details_usecase.dart';
export 'src/usecase/marketing/get_registration_detail_usecase.dart';
export 'src/usecase/marketing/create_school_visit_usecase.dart';
export 'src/usecase/marketing/reschedule_school_visit_usecase.dart';
export 'src/usecase/marketing/cancel_school_visit_usecase.dart';
export 'src/usecase/marketing/get_school_visit_detail_usecase.dart';
export 'src/usecase/marketing/create_competency_test_usecase.dart';
export 'src/usecase/marketing/reschedule_competency_test_usecase.dart';
export 'src/usecase/marketing/cancel_competency_test_usecase.dart';
export 'src/usecase/marketing/get_competency_test_detail_usecase.dart';
export 'src/usecase/marketing/get_enquiry_timeline_usecase.dart';
export 'src/usecase/marketing/get_school_visit_slots_usecase.dart';
export 'src/usecase/marketing/get_competency_test_slots_usecase.dart';
export 'src/usecase/marketing/update_ivt_detail_usecase.dart';
export 'src/usecase/marketing/update_psa_detail_usecase.dart';
export 'src/usecase/marketing/update_new_admission_usecase.dart';
export 'src/usecase/marketing/get_mdm_attribute_usecase.dart';
export 'src/usecase/marketing/upload_enquiry_document_usecase.dart';
export 'src/usecase/marketing/download_enquiry_document.dart';
export 'src/usecase/marketing/delete_enquiry_document_usecase.dart';
export 'src/usecase/marketing/download_file_usecase.dart';
export 'src/usecase/marketing/get_sibling_detail_usecase.dart';
export 'src/usecase/marketing/select_optional_subject_usecase.dart';
export 'src/usecase/marketing/add_vas_option_usecase.dart';
export 'src/usecase/marketing/get_subject_list_usecase.dart';
export 'src/usecase/marketing/get_psa_enrollment_detail_usecase.dart';
export 'src/usecase/marketing/get_cafeteria_enrollment_detail_usecase.dart';
export 'src/usecase/marketing/get_kids_club_enrollment_detail_usecase.dart';
export 'src/usecase/marketing/get_summer_camp_enrollment_detail_usecase.dart';
export 'src/usecase/marketing/get_transport_enrollment_detail_usecase.dart';
export 'src/usecase/marketing/calculate_fees_usacase.dart';
export 'src/usecase/marketing/add_vas_detail_usecase.dart';
export 'src/usecase/marketing/remove_vas_detail_usecase.dart';
export 'src/usecase/marketing/make_payment_request_usecase.dart';
export 'src/usecase/marketing/fetch_stops_usecase.dart';
export 'package:shared/shared.dart';
export 'src/usecase/user/auth_usecase.dart';
export 'src/usecase/gatepass/request_gatepass_usecase.dart';
