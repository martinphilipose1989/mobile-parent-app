import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetStudentYearlyDetailsUsecase extends BaseUseCase<NetworkError,
    GetStudentYearlyDetailsParams, MdmAttributeBaseModel> {
  final MDMRepository mdmRepository;

  GetStudentYearlyDetailsUsecase({required this.mdmRepository});
  @override
  Future<Either<NetworkError, MdmAttributeBaseModel>> execute(
      {required GetStudentYearlyDetailsParams params}) {
    return mdmRepository.getStudentYearlyDetails(
        studentId: params.studentId, year: params.year);
  }
}

class GetStudentYearlyDetailsParams extends Params {
  final int studentId;
  final int year;

  GetStudentYearlyDetailsParams({required this.studentId, required this.year});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
