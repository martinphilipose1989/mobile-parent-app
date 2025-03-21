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
export 'src/repository/admin_repository.dart';
export 'src/repository/ticketing_repository.dart';
export 'src/repository/notification/notification_repository.dart';
export 'src/repository/mdm_repository.dart';

export 'src/repository/disciplinary_slip_repository.dart';
export 'src/repository/attendance_repository.dart';

export 'src/repository/transport_repository.dart';
//use-cases
export 'src/usecase/base/params.dart';
export 'src/usecase/user/login_usecase.dart';
export 'src/usecase/finance/get_academic_year_usecase.dart';
export 'src/usecase/notification/sendTokenUsecase.dart';
export 'src/usecase/finance/get_guardian_student_details_usecase.dart';
export 'src/usecase/transport/fetch_stop_logs_usecase.dart';
export 'src/usecase/transport/get_all_bus_stops_usecase.dart';
export 'src/usecase/transport/get_myduty_list_usecase.dart';
export 'src/usecase/transport/get_student_profile_usecase.dart';
export 'src/usecase/transport/upload_bearer_usecase.dart';
export 'src/usecase/transport/create_bearer_usecase.dart';
export 'src/usecase/transport/get_student_attandence_usecase.dart';
export 'src/usecase/transport/get_staff_list_usecase.dart';
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
export 'src/usecase/marketing/get_city_state_by_pincode_usecase.dart';
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
export 'src/usecase/gatepass/get_purpose_of_visit_usecase.dart';
export 'src/usecase/gatepass/upload_visitor_profile_usecase.dart';
export 'src/usecase/gatepass/create_gatepass_usecase.dart';
export 'src/usecase/gatepass/get_visitor_details_usecase.dart';
export 'src/usecase/finance/get_transaction_type_usecase.dart';
export 'src/usecase/finance/get_transaction_type_fees_collected_usecase.dart';
export 'src/repository/attachment_repository.dart';
export 'src/usecase/attachemnt/choose_file_usecase.dart';
export 'src/usecase/finance/get_payment_order_usecase.dart';
export 'src/usecase/finance/get_store_image_usecase.dart';
export 'src/usecase/finance/get_payment_status_usecase.dart';
export 'src/usecase/admin/get_coupons_usecase.dart';
export 'src/usecase/communication/ticket_listing_usecase.dart';
export 'src/usecase/communication/create_category_usecase.dart';
export 'src/usecase/communication/create_communication_log_usecase.dart';
export 'src/usecase/communication/create_new_communication.dart';
export 'src/usecase/communication/create_sub_category_usecase.dart';
export 'src/usecase/communication/find_by_category_sub_category_usecase.dart';
export 'src/usecase/communication/send_communication_usecase.dart';
export 'src/usecase/communication/create_ticket_usecase.dart';
export 'src/usecase/student_detail/student_detail_usecase.dart';
export 'src/usecase/user/logout_usecase.dart';
export 'src/usecase/transport/create_intimation_usecase.dart';
export 'src/usecase/transport/upload_intimation_file.dart';
export 'src/usecase/notification/notification_usecase.dart';
export 'src/usecase/attachemnt/download_file_usecase.dart';

export 'src/usecase/notification/configure_on_launch_push_notification_usecase.dart';
export 'src/usecase/notification/configure_push_notification_usecase.dart';
export 'src/usecase/notification/init_local_notification_usecase.dart';
export 'src/usecase/notification/listen_notification_usecase.dart';
export 'src/usecase/notification/request_notification_permission_usecase.dart';
export 'src/usecase/notification/schedule_local_notification_usecase.dart';
export 'src/usecase/notification/unsubscribe_push_notification_usecase.dart';

//disciplinarySlip
export 'src/usecase/disciplinarySlip/disciplinary_slip_list_usecase.dart';

export 'src/usecase/disciplinarySlip/co_resons_list_usecase.dart';
export 'src/usecase/disciplinarySlip/create_acknowledgement_usecase.dart';

//attendance
export 'src/usecase/attendance/attendance_count_usecase.dart';
export 'src/usecase/attendance/attendanceDetailsUsecase.dart';
export 'src/usecase/user/tokenresponse_usecase.dart';
export 'src/usecase/user/user_role_permission_usecase.dart';
export 'src/usecase/user/get_user_details_usecase.dart';
export 'src/usecase/marketing/move_to_next_stage_usecase.dart';
export 'src/usecase/marketing/get_brand_usecase.dart';
export 'src/usecase/marketing/get_admission_vas_usecase.dart';
export 'src/usecase/finance/cancel_payment_usecase.dart';
export 'src/usecase/student_detail/get_bearer_list_usecase.dart';

export 'src/usecase/finance/download_fee_type_usecase.dart';
export 'src/usecase/finance/download_transaction_history_usecase.dart';
export 'src/usecase/finance/download_student_ledger_usecase.dart';

export 'src/usecase/finance/new_enrolment_usecase.dart';
export 'src/usecase/finance/terms_and_condition_usecase.dart';
export 'src/usecase/finance/undertaking_usecase.dart';
export 'src/usecase/finance/get_student_yearly_details.dart';
