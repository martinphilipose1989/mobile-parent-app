import 'dart:io';

import '../../../domain.dart';
import '../base/base_usecase.dart';

class UploadIntimationFileUseCase extends BaseUseCase<NetworkError,
    UploadIntimationFileUseCaseParams, UploadIntimationFileResponseModel> {
  final TransportRepository transportRepository;


  UploadIntimationFileUseCase(this.transportRepository);

  @override
  Future<Either<NetworkError, UploadIntimationFileResponseModel>> execute(
      {required UploadIntimationFileUseCaseParams params}) {
    return transportRepository.uploadIntimationFile(params: params);
  }
}

class UploadIntimationFileUseCaseParams extends Params{
final File file;
final int id;
final String app;


UploadIntimationFileUseCaseParams( {required this.app,required this.file, required this.id});

  @override
  Either<AppError, bool> verify() {

    return Right(true);
  }

}