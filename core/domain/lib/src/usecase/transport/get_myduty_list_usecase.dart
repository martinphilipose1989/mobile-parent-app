import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetMydutyListUsecase
    extends BaseUseCase<NetworkError, GetMydutyListParams, TripResponse> {
  final TransportRepository transportRepository;

  GetMydutyListUsecase({required this.transportRepository});

  @override
  Future<Either<NetworkError, TripResponse>> execute(
      {required GetMydutyListParams params}) {
    return transportRepository.getMyDutyList(
        pageNo: params.pageNo, dayId: params.dayId, studentId: params.studentId, app: params.app);
  }
}

class GetMydutyListParams extends Params {
  final int pageNo;
  final int dayId;
  final int studentId;
final String app;
  GetMydutyListParams( {required this.app,required this.studentId,required this.pageNo, required this.dayId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
