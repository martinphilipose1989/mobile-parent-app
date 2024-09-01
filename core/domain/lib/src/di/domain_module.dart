import 'package:domain/domain.dart';
import 'package:domain/src/usecase/gatepass/request_gatepass_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  RequestGatepassUsecase createGatePassUsecaseProvider(
      GatepassRepository gatepassRepository) {
    return RequestGatepassUsecase(gatepassRepository: gatepassRepository);
  }
}
