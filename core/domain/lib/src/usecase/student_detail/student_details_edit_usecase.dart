import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class StudentDetailEditUseCase extends BaseUseCase<BaseError,
    StudentDetailEditUseCaseParams, StudentEditResponseModel> {
  AdminRepository adminRepository;


  StudentDetailEditUseCase(this.adminRepository);

  @override
  Future<Either<BaseError, StudentEditResponseModel>> execute(
      {required StudentDetailEditUseCaseParams params}) {
    return adminRepository.studentDetailEdit(model:StudentEditRequestModel(id: params.id,studentProfile: params.studentProfile,parent: params.parent), platform: 'app',);
  }
}


class StudentDetailEditUseCaseParams extends Params{
  int? id;
  StudentProfileModel? studentProfile;
  List<ParentModel>? parent;

  StudentDetailEditUseCaseParams({required this.id, required this.studentProfile, required this.parent});

  @override
  Either<AppError, bool> verify() {
  return right(true);
  }
}