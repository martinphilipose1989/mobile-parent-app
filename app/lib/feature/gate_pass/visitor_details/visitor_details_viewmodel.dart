import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class VisitorDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder _exceptionHandlerBinder;

  // final GetVisitorDetailsUsecase _getVisitorDetailsUsecase;

  // final PublishSubject<Resource<VisitorDataModel>> _visitorDetailsResponse =
  //     PublishSubject();

  // Stream<Resource<VisitorDataModel>> get visitorDetails =>
  //     _visitorDetailsResponse.stream;
  //
  VisitorDetailsViewModel({
    required FlutterExceptionHandlerBinder exceptionHandlerBinder,
    // required GetVisitorDetailsUsecase getVisitorDetailsUsecase,
  }) : _exceptionHandlerBinder = exceptionHandlerBinder;
// _getVisitorDetailsUsecase = getVisitorDetailsUsecase;

// Future<void> getVisitorDetails({required gatePassId}) async {
//   _exceptionHandlerBinder.handle(block: () {
//     GetVisitorDetailsUsecaseParams params =
//         GetVisitorDetailsUsecaseParams(gatepassId: gatePassId);
//     RequestManager<VisitorDetailsResponseModel>(
//       params,
//       createCall: () => _getVisitorDetailsUsecase.execute(params: params),
//     ).asFlow().listen((result) async {
//       _visitorDetailsResponse.add(Resource.loading(data: null));
//
//       if (Status.success == result.status) {
//         _visitorDetailsResponse
//             .add(Resource.success(data: result.data?.data));
//       } else if (Status.error == result.status) {
//         _visitorDetailsResponse
//             .add(Resource.error(error: result.dealSafeAppError));
//       }
//     }).onError((error) {});
//   }).execute();
// }
}
