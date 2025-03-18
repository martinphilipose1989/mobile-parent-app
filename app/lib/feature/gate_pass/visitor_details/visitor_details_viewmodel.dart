import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class VisitorDetailsViewModel extends BasePageViewModel {
  // use cases
  final FlutterExceptionHandlerBinder _exceptionHandlerBinder;
  final GetVisitorDetailsUseCase _getVisitorDetailsUseCase;

  // constructor
  VisitorDetailsViewModel({
    required FlutterExceptionHandlerBinder exceptionHandlerBinder,
    required GetVisitorDetailsUseCase getVisitorDetailsUseCase,
  })  : _exceptionHandlerBinder = exceptionHandlerBinder,
        _getVisitorDetailsUseCase = getVisitorDetailsUseCase;

  //-------------------------- get visitor details ------------------------------------//
  final PublishSubject<Resource<VisitorDataModel>> _visitorDetailsResponse =
      PublishSubject();

  Stream<Resource<VisitorDataModel>> get visitorDetails =>
      _visitorDetailsResponse.stream;

  Future<void> getVisitorDetails(
      {required String? mobile,
      required dynamic studentId,
      String? gatePassId}) async {
    _exceptionHandlerBinder.handle(block: () {
      GetVisitorDetailsUseCaseParams params = GetVisitorDetailsUseCaseParams(
          mobile: mobile, studentId: studentId, gatePassId: gatePassId);
      RequestManager<VisitorDetailsResponseModel>(
        params,
        createCall: () => _getVisitorDetailsUseCase.execute(params: params),
      ).asFlow().listen((result) async {
        _visitorDetailsResponse.add(Resource.loading());

        if (Status.success == result.status) {
          _visitorDetailsResponse
              .add(Resource.success(data: result.data?.data));
        }
        if (Status.error == result.status) {
          _visitorDetailsResponse
              .add(Resource.error(error: result.dealSafeAppError));
        }
      }).onError((error) {});
    }).execute();
  }
}
