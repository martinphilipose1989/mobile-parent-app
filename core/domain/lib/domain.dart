/// Support for doing something awesome.
///
/// More dartdocs go here.
library domain;

export 'src/di/domain_dependency_configurator.dart';
export 'package:dartz/dartz.dart';

//repository contracts
export 'src/repository/user_repository.dart';
export 'src/repository/finance_repository.dart';
export 'src/repository/admin_repository.dart';

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
export 'src/usecase/finance/get_transaction_type_usecase.dart';
export 'src/usecase/finance/get_transaction_type_fees_collected_usecase.dart';
export 'package:shared/shared.dart';
export 'src/repository/attachment_repository.dart';
export 'src/usecase/attachemnt/choose_file_usecase.dart';
export 'src/usecase/finance/get_payment_order_usecase.dart';
export 'src/usecase/finance/get_store_image_usecase.dart';
export 'src/usecase/finance/get_payment_status_usecase.dart';
export 'src/usecase/admin/get_coupons_usecase.dart';
