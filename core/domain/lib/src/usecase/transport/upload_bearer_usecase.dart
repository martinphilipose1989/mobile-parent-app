import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class UploadBearerProfileUsecase extends BaseUseCase<NetworkError,
    UploadBearerProfileUsecaseParams, UploadFileResponseModel> {
  final TransportRepository _transportRepository;

  UploadBearerProfileUsecase({required TransportRepository transportRepository})
      : _transportRepository = transportRepository;

  @override
  Future<Either<NetworkError, UploadFileResponseModel>> execute(
      {required UploadBearerProfileUsecaseParams params}) {
    return _transportRepository.uploadProfileImage(file: params.file, platform: 'app');
  }
}

class UploadBearerProfileUsecaseParams extends Params {
  final File file;

  UploadBearerProfileUsecaseParams({required this.file});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
