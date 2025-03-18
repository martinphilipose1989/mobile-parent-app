import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetStaffListUsecase extends BaseUseCase<NetworkError,
    GetStaffListUseCaseParams, StaffListResponseModel> {
  final TransportRepository transportRepository;

  GetStaffListUsecase({required this.transportRepository});

  @override
  Future<Either<NetworkError, StaffListResponseModel>> execute(
      {required GetStaffListUseCaseParams params}) {
    return transportRepository.getStaffList(staffListusecaseparams: params);
  }
}

class GetStaffListUseCaseParams extends Params {
  final int schoolId;
final String platform;
  GetStaffListUseCaseParams({required this.platform,required this.schoolId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
