import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/rxdart.dart';

import 'enquiry_base_viewmodel.dart';

class EnquiryNewAdmissionPageViewModel extends EnquiryBaseViewModel {
  GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase;
  UpdateNewAdmissionUsecase updateNewAdmissionUsecase;

  EnquiryNewAdmissionPageViewModel(
      {required this.getNewAdmissionDetailUseCase,
      required this.updateNewAdmissionUsecase,
      required super.flutterToastErrorPresenter,
      required super.exceptionHandlerBinder,
      required super.enquiryDetailArgs});

  final PublishSubject<Resource<NewAdmissionBase>> _newAdmissionDetail =
      PublishSubject();
  Stream<Resource<NewAdmissionBase>> get newAdmissionDetail =>
      _newAdmissionDetail.stream;

  BehaviorSubject<bool> isLoading = BehaviorSubject.seeded(false);

  @override
  void getEnquiryDetailByType(
      {required String enquiryID, bool isEdit = false}) {
    _newAdmissionDetail.add(Resource.loading());
    GetNewAdmissionDetailUseCaseParams params =
        GetNewAdmissionDetailUseCaseParams(enquiryID: enquiryID);
    ApiResponseHandler.apiCallHandler(
      exceptionHandlerBinder: exceptionHandlerBinder,
      flutterToastErrorPresenter: flutterToastErrorPresenter,
      params: params,
      createCall: (params) =>
          getNewAdmissionDetailUseCase.execute(params: params),
      onSuccess: (result) {
        _newAdmissionDetail.add(Resource.success(data: result));
      },
      onError: (error) {
        _newAdmissionDetail.add(Resource.error(error: error));
      },
    );
  }

  // @override
  // void updateEnquiryDetails<NewAdmissionDetailEntity>(
  //     {required String enquiryId,
  //     required NewAdmissionDetailEntity enquiryDetails}) {
  //   UpdateNewAdmissionUsecaseUseCaseParams params =
  //       UpdateNewAdmissionUsecaseUseCaseParams(
  //           enquiryID: enquiryId, newAdmissionDetail: enquiryDetails);

  //   ApiResponseHandler.apiCallHandler(
  //       exceptionHandlerBinder: exceptionHandlerBinder,
  //       flutterToastErrorPresenter: flutterToastErrorPresenter,
  //       params: params,
  //       createCall: (params) =>
  //           updateNewAdmissionUsecase.execute(params: params),
  //       onSuccess: (result) {},
  //       onError: (error) {});
  // }

  @override
  void setEnquiryDetailByType<T>({required T enquiryDetails}) {}
}
