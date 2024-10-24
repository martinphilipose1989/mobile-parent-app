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

//utils
export 'src/utils/validator.dart';
