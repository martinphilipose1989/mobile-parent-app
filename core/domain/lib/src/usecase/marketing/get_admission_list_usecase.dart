import 'package:domain/domain.dart';
import 'package:domain/src/repository/marketing/admission_repository.dart';
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
      phone: params.phone
    );
  }
}

class GetAdmissionListUsecaseParams extends Params {
  final String phone; final int pageNumber; final int? pageSize;
  GetAdmissionListUsecaseParams({
    required this.phone,
    required this.pageNumber,
    this.pageSize
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}