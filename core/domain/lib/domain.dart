/// Support for doing something awesome.
///
/// More dartdocs go here.
library domain;

export 'src/di/domain_dependency_configurator.dart';
export 'package:dartz/dartz.dart';

//repository contracts
export 'src/repository/user_repository.dart';
export 'src/repository/marketing/enquiry_repository.dart';
export 'src/repository/marketing/school_visit_repository.dart';

//use-cases
export 'src/usecase/base/params.dart';
export 'src/usecase/user/login_usecase.dart';
export 'src/usecase/marketing/get_enquiry_list_usecase.dart';
export 'src/usecase/marketing/get_admission_journey_usecase.dart';
export 'src/usecase/marketing/get_ivt_detail_usecase.dart';
export 'src/usecase/marketing/get_new_admission_detail_usecase.dart';
export 'src/usecase/marketing/get_psa_detail_usecase.dart';
export 'src/usecase/marketing/get_admission_list_usecase.dart';


export 'package:shared/shared.dart';


