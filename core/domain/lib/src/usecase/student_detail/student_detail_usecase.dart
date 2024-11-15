import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class StudentDetailUseCase extends BaseUseCase<BaseError,
    StudentDetailUseCaseParams, StudentDetailsResponseModel> {
      AdminRepository adminRepository;


StudentDetailUseCase(this.adminRepository);

  @override
  Future<Either<BaseError, StudentDetailsResponseModel>> execute({required StudentDetailUseCaseParams params}) {
        return adminRepository.getStudentDetail(id: params.id);
  }


}

class StudentDetailUseCaseParams extends Params{
  final int id;

  StudentDetailUseCaseParams(this.id);
  @override
  Either<AppError, bool> verify() {
    return right(true);
  }


}