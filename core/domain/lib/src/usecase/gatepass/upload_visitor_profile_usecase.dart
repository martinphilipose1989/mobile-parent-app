import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UploadVisitorProfileUsecase extends BaseUseCase<NetworkError,
    UploadVisitorProfileUsecaseParams, UploadFileResponseModel> {
  final GatepassRepository _gatePassRepository;

  UploadVisitorProfileUsecase({required GatepassRepository gatePassRepository})
      : _gatePassRepository = gatePassRepository;

  @override
  Future<Either<NetworkError, UploadFileResponseModel>> execute(
      {required UploadVisitorProfileUsecaseParams params}) {
    return _gatePassRepository.uploadProfileImage(params:params);
  }
}

class UploadVisitorProfileUsecaseParams extends Params {
  final File file;

  UploadVisitorProfileUsecaseParams({super.reloading, required this.file});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
