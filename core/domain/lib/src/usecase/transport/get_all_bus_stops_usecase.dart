import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetAllBusStopsUsecase extends BaseUseCase<NetworkError,
    GetAllBusStopsParams, BusStopResponseModel> {
final TransportRepository transportRepository;

  GetAllBusStopsUsecase(
   {required this.transportRepository}
      );

  @override
  Future<Either<NetworkError, BusStopResponseModel>> execute(
      {required GetAllBusStopsParams params}) {
    return transportRepository.getBusStopsList(
        routeId: params.routeId, dayId: params.dayId, app: params.app);
  }
}

class GetAllBusStopsParams extends Params {
  final String routeId;
  final int dayId;
final String app;
  GetAllBusStopsParams( {required this.app,required this.routeId, required this.dayId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
