/// Support for doing something awesome.
///
/// More dartdocs go here.
library shared;

//constants
export 'src/const/error_type.dart';

//models
export 'src/model/app_error.dart';
export 'src/model/error/base_error.dart';
export 'src/model/error/database_error.dart';
export 'src/model/error/network_error.dart';
export 'src/model/error_info.dart';
export 'src/model/user.dart';
export 'src/model/chips_model.dart';
export 'src/shared_base.dart';
export 'src/utils/mapper/base_layer_transformer.dart';
export 'src/model/request/finance/store_payment/store_payment_model_request.dart';
export 'src/model/request/finance/store_payment/payment_detail_model_request.dart';
export 'src/model/request/finance/store_payment/fee_id_model_request.dart';
export 'src/model/response/finance/get_sibling_list_model.dart';
export 'src/model/response/finance/get_academic_year_model.dart';
export 'src/model/response/finance/get_token_generator.dart';
export 'src/model/response/finance/get_store_payment_model.dart';
export 'src/model/response/finance/get_validate_on_pay_model.dart';
export 'src/model/response/finance/get_guardian_student_details.dart';
export 'src/model/response/finance/get_pending_fees_model.dart';
export 'src/model/response/finance/pending_fees_as_per_student_ids.dart';
export 'src/model/response/finance/get_school_names_model.dart';
export 'src/model/response/finance/get_transaction_type_model.dart';
export 'src/model/response/finance/group_by_fee_type_model.dart';
export 'src/model/response/finance/get_transaction_type_fees_collected.dart';
export 'src/model/file/upload_file.dart';
export 'src/const/file_type_enum.dart';
export 'src/model/error/local_error.dart';
export 'src/model/request/finance/payment_order/payment_order_request_model.dart';
export 'src/model/request/attendance/attendance_count_request_model.dart';
export 'src/model/request/attendance/attendance_deatils_request_model.dart';
export 'src/model/response/finance/get_payment_order_response_model.dart';
export 'src/model/response/attendance/attendanceResponseModel.dart';
export 'src/model/response/finance/get_store_image_model.dart';
export 'src/model/response/finance/get_payment_status_model.dart';
export 'src/model/response/admin/get_coupons_model.dart';
export 'src/model/response/admin/student_details/student_details_response_model.dart';
export 'src/model/response/disciplinarySlip/disciplinary_slip_model.dart';
export 'src/model/response/disciplinarySlip/acknowledgeResponseModel.dart';
export 'src/model/response/disciplinarySlip/co_reasons_list_response_model.dart';
export 'src/model/response/attendance/attendance_details_response_model.dart';

//Communication start
export 'src/model/response/communication/communication_list_model.dart';
export 'src/model/response/communication/msg_categorymodel.dart';
export 'src/model/response/communication/msg_sub_category_model.dart';
export 'src/model/response/communication/create_communication_model.dart';
export 'src/model/response/communication/find_by_category_sub_category_model.dart';
export 'src/model/response/communication/create_communication_log_model.dart';
export 'src/model/response/communication/send_communication_model.dart';
export 'src/model/response/communication/create_ticket_model.dart';

//request

export 'src/model/request/communication/create_communication_log_model.dart';
export 'src/model/request/communication/create_ticket_request.dart';

// Communication end

export 'src/model/request/disciplinary_slip/acknowledge/acknowledge_request_model.dart';

export 'src/model/response/enquiry_list/enquiry_list_model.dart';
export 'src/model/response/enquiry_list/enquiry_list_base.dart';
export 'src/model/response/enquiry_list/enquiry_list.dart';
export 'src/model/response/admission_journey/admission_journey_base.dart';
export 'src/model/response/admission_journey/admission_journey_detail.dart';
export 'src/model/response/new_admission/academic_year_detail.dart';
export 'src/model/response/new_admission/common_data_class.dart';
export 'src/model/response/new_admission/existing_school_detail.dart';
export 'src/model/response/new_admission/guest_student_detail.dart';
export 'src/model/response/new_admission/new_admission_base.dart';
export 'src/model/response/new_admission/parent_contact_detail.dart';
export 'src/model/response/new_admission/parent_detail.dart';
export 'src/model/response/new_admission/residantial_address.dart';
export 'src/model/response/new_admission/student_detail.dart';
export 'src/model/response/new_admission/new_admission_detail.dart';
export 'src/model/response/psa_detail/psa_base.dart';
export 'src/model/response/psa_detail/psa_detail.dart';
export 'src/model/response/ivt_detail/ivt_base.dart';
export 'src/model/response/ivt_detail/ivt_detail.dart';
export 'src/model/response/registration_info/guardian_detail.dart';
export 'src/model/response/registration_info/parent_info_.dart';
export 'src/model/response/registration_info/parent_registration_detail.dart';
export 'src/model/response/registration_info/bank_detail.dart';
export 'src/model/response/registration_info/medical_details.dart';
export 'src/model/response/registration_info/contact_details.dart';
export 'src/model/response/registration_info/residential_address_detail.dart';
export 'src/model/response/registration_info/emergency_contact.dart';
export 'src/model/response/competency_book/competency_test_creation_model.dart';
export 'src/model/response/competency_book/competency_test_data_model.dart';
export 'src/model/response/competency_book/competency_test_model.dart';
export 'src/model/response/school_visit/school_visit_creation_model.dart';
export 'src/model/response/school_visit/school_visit_model.dart';
export 'src/model/response/admission_list/admission_list.dart';
export 'src/model/response/admission_list/admission_list_base.dart';
export 'src/model/response/admission_list/admission_list_model.dart';
export 'src/model/response/enquiry_detail/enquiry_base_model.dart';
export 'src/model/response/enquiry_detail/enquiry_detail_model.dart';
export 'src/model/response/enquiry_detail/enquiry_document_model.dart';
export 'src/model/response/enquiry_detail/enquiry_stage_detail_model.dart';
export 'src/model/response/competency_test_detail/competency_test_detail.dart';
export 'src/model/response/competency_test_detail/competency_test_detail_base.dart';
export 'src/model/response/enquiry_timeline/enquiry_timeline_base.dart';
export 'src/model/response/enquiry_timeline/enquiry_timeline_data.dart';
export 'src/model/response/enquiry_timeline/enquiry_timeline_detail.dart';
export 'src/model/response/enquiry_timeline/enquiry_timeline_filter.dart';
export 'src/model/response/enquiry_file_upload/delete_enquiry_file_model.dart';
export 'src/model/response/enquiry_file_upload/download_enquiry_file_model.dart';
export 'src/model/response/enquiry_file_upload/enquiry_file_upload_model.dart';
export 'src/model/request/marketing/school_visit_creation_model_request.dart';
export 'src/model/request/marketing/cancel_competency_test_model_request.dart';
export 'src/model/request/marketing/cancel_school_visit_model_request.dart';
export 'src/model/request/marketing/competency_test_creation_model_request.dart';
export 'src/model/response/slots/slots_model.dart';
export 'src/model/response/slots/slots_detail_model.dart';
export 'src/model/response/mdm_attribute/mdm_detail_model.dart';
export 'src/model/response/mdm_attribute/attribute_model.dart';
export 'src/model/response/mdm_attribute/mdm_attribute_base_model.dart';
export 'src/model/response/mdm_attribute/city_and_state_detail.dart';
export 'src/model/response/mdm_attribute/city_and_state_response.dart';
export 'src/model/response/mdm_attribute/city_and_state_base.dart';
export 'src/model/response/mdm_attribute/district_city_detail.dart';
export 'src/model/response/mdm_attribute/state_detail.dart';
export 'src/model/response/registration_info/residential_address_contact_info.dart';
export 'src/model/response/registration_info/point_of_contatc_detail.dart';
export 'src/model/response/registration_info/sibling_detail.dart';
export 'src/model/response/registration_info/child_custody_detail.dart';
export 'src/model/response/registration_info/preference_detail.dart';
export 'src/model/response/get_sibling_detail/sibling_data.dart';
export 'src/model/response/get_sibling_detail/sibling_profile.dart';
export 'src/model/response/get_sibling_detail/sibling_profile_response.dart';
export 'src/model/response/subject_selection/subject_detail.dart';
export 'src/model/response/subject_selection/subject_detail_element.dart';
export 'src/model/response/subject_selection/subject_detail_response.dart';
export 'src/model/response/vas_option/vas_option_response.dart';
export 'src/const/constants.dart';
export 'src/model/response/psa_enrollment_detail/batch_model.dart';
export 'src/model/response/psa_enrollment_detail/fee_category.dart';
export 'src/model/response/psa_enrollment_detail/fee_sub_category.dart';
export 'src/model/response/psa_enrollment_detail/fee_sub_type.dart';
export 'src/model/response/psa_enrollment_detail/period_of_service.dart';
export 'src/model/response/psa_enrollment_detail/psa_enrollment_detail.dart';
export 'src/model/response/psa_enrollment_detail/psa_enrollment_detail_response.dart';
export 'src/model/response/cafeteria_enrollment_detail/cafeteria_enrollment_detail.dart';
export 'src/model/response/cafeteria_enrollment_detail/cafeteria_enrollment_responses.dart';
export 'src/model/response/kids_club_enrollment_detail/kids_club_enrollment_detail.dart';
export 'src/model/response/kids_club_enrollment_detail/kids_club_enrollment_response.dart';
export 'src/model/response/summer_camp_enrollment_detail/summer_camp_enrollment_detail.dart';
export 'src/model/response/summer_camp_enrollment_detail/summer_camp_enrollment_response.dart';

export 'src/model/request/gatepass/create_qrcode_request_model.dart';
export 'src/model/request/gatepass/create_gatepass_model.dart';
export 'src/model/response/gatepass/create_qrcode_response_model.dart';
export 'src/model/response/gatepass/upload_response_model.dart';
export 'src/model/response/gatepass/visitor_data_model.dart';
export 'src/model/response/gatepass/create_gate_pass_data_response_model.dart';
export 'src/model/response/gatepass/create_gatepass_response_model.dart';
export 'src/model/response/gatepass/parent_gatepass_response_model.dart';
export 'src/model/response/gatepass/mdm_coreason_response_model.dart';
export 'src/model/response/gatepass/visitor_details_response_model.dart';

export 'src/model/response/subject_listing/page_detail.dart';

export 'src/model/response/subject_listing/subject.dart';
export 'src/model/response/subject_listing/subject_list_detail.dart';
export 'src/model/response/subject_listing/subject_list_response.dart';
export 'src/model/response/transport_enrollment_detail/transport_enrollment_detail.dart';
export 'src/model/response/transport_enrollment_detail/transport_enrollment_response.dart';
export 'src/model/response/fetch_stop/fetch_stop_response.dart';
export 'src/model/response/fetch_stop/stop_detail.dart';
export 'src/model/response/enquiry_detail/move_to_next_update_model.dart';
export 'src/model/request/marketing/move_to_next_stage_model.dart';
export 'src/model/response/brand/brand_response_model.dart';
export 'src/model/response/admission_vas/admission_vas_response.dart';
export 'src/model/response/transport/busstop_response.dart';
export 'src/model/response/transport/fetch_stops_logs_model.dart';
export 'src/model/response/transport/get_bearer_response.dart';
export 'src/model/response/transport/get_studentprofile_response.dart';
export 'src/model/response/transport/guardian_detail_response.dart';
export 'src/model/response/transport/route_stop_mapping_response.dart';
export 'src/model/response/transport/stop_response.dart';
export 'src/model/response/transport/trip_response.dart';
export 'src/model/response/transport/student_attendance_response_model.dart';
export 'src/model/response/transport/get_student_profile_response.dart';
export 'src/model/response/transport/staff_list_response_model.dart';

//login
export 'src/model/response/login/auth_response.dart';
export 'src/model/response/user/token_introspect_reponse.dart';
export 'src/model/response/user/user_role_permission_response.dart';
export 'src/model/request/user/user_role_permission_request.dart';
export 'src/model/response/login/logout_response.dart';

//utils
export 'src/utils/validator.dart';
