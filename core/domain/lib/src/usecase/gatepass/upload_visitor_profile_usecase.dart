import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UploadVisitorProfileUsecase extends BaseUseCase<NetworkError,
    UploadVisitorProfileUsecaseParams, UploadFileResponseModel> {
  final GatepassRepository _gatepassRepository;

  UploadVisitorProfileUsecase({required GatepassRepository gatepassRepository})
      : _gatepassRepository = gatepassRepository;

  @override
  Future<Either<NetworkError, UploadFileResponseModel>> execute(
      {required UploadVisitorProfileUsecaseParams params}) {
    return _gatepassRepository.uploadProfileImage(file: params.file);
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
