/// Support for doing something awesome.
///
/// More dartdocs go here.
library network_retrofit;

export 'src/di/network_dependency_configurator.dart';
export 'src/network_retrofit_base.dart';

// response:

export 'src/model/error/error_info_entity.dart';
export 'src/model/response/get_enquiry_list/enquiry_list_detail_response_entity.dart';
export 'src/model/response/get_enquiry_list/enquirylist_base_response_entity.dart';
export 'src/model/response/get_enquiry_list/enquiry_list_response_entity.dart';
export 'src/model/response/notification/notification_response_entity.dart';

export 'src/model/request/school_visit_creation_request.dart';
export 'src/model/request/cancel_school_visit_request.dart';
export 'src/model/request/competency_test_creation_request.dart';
export 'src/model/request/cancel_competency_test_request.dart';
export 'src/model/request/notification/sendTokenRequestEntity.dart';
export 'src/model/request/school_visit_reschedule_request.dart';
export 'src/model/request/competency_test_reschedule_request.dart';
export 'src/model/request/parent_info_update_request.dart';
export 'src/model/request/get_sibling_detail_request.dart';
export 'src/model/request/subject_selection_request.dart';
export 'src/model/request/add_vas_option_request.dart';
export 'src/model/request/subject_listing_request.dart';
export 'src/model/request/vas_detail_request.dart';
export 'src/model/request/vas_enrollment_fee_calculation_request.dart';
export 'src/model/request/vas_enrollment_request.dart';
export 'src/model/request/fetch_stop_request.dart';
export 'src/model/request/transport/create_intimation_request_entity.dart';
export 'src/model/request/transport/create_bearer_entity_request.dart';
export 'src/model/request/transport/map_student_bearer_entity_request.dart';

//models
export 'src/model/response/get_registreation_info/parent_info_entity.dart';
export 'src/model/response/transport/create_intimation_response_entity.dart';
export 'src/model/response/transport/map_student_bearer_response_entity.dart';
export 'src/model/response/get_registreation_info/contact_details_entity.dart';
export 'src/model/response/get_registreation_info/medical_details_entity.dart';
export 'src/model/response/get_registreation_info/bank_details_entity.dart';
export 'src/model/response/get_new_admission/new_admission_detail_entity.dart';
export 'src/model/response/get_ivt_detail/ivt_detail_response_entity.dart';
export 'src/model/response/get_psa_detail/psa_detail_response_entity.dart';
export 'src/model/response/get_registreation_info/base_response_entity.dart';
export 'src/model/response/get_new_admission/common_data_entity.dart';
export 'src/model/response/transport/staff_list_response_entity.dart';
export 'src/model/response/transport/create_bearer_response_entity.dart';
export 'package:json_annotation/json_annotation.dart';
