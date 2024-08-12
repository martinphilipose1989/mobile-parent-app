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

//utils
export 'src/utils/validator.dart';
