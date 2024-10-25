import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetAdmissionListUsecase extends BaseUseCase<BaseError,
    GetAdmissionListUsecaseParams, AdmissionListBaseModel> {
  final AdmissionRepository _admissionRepository;

  GetAdmissionListUsecase(
    this._admissionRepository,
  );

  @override
  Future<Either<BaseError, AdmissionListBaseModel>> execute({
    required GetAdmissionListUsecaseParams params,
  }) {
    return _admissionRepository.getAdmissionList(
      pageNumber: params.pageNumber,
      pageSize: params.pageSize??10,
      phone: params.phone,
      status: params.status
    );
  }
}

class GetAdmissionListUsecaseParams extends Params {
  final String phone,status; final int pageNumber; final int? pageSize;
  GetAdmissionListUsecaseParams({
    required this.phone,
    required this.pageNumber,
    this.pageSize,
    required  this.status
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}