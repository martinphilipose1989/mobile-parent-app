import 'package:app/model/resource.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';
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

  BehaviorSubject<NewAdmissionDetail>? newAdmissionDetails =
      BehaviorSubject<NewAdmissionDetail>.seeded(NewAdmissionDetail());

  void updateNewAdmissionEnquirDetails(
      {required String enquiryId,
      required NewAdmissionDetailEntity newAdmissionDetail}) {
    _newAdmissionDetail.add(Resource.loading());
    isLoading.add(true);
    UpdateNewAdmissionUsecaseUseCaseParams params =
        UpdateNewAdmissionUsecaseUseCaseParams(
            enquiryID: enquiryId, newAdmissionDetail: newAdmissionDetail);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) =>
            updateNewAdmissionUsecase.execute(params: params),
        onSuccess: (result) {
          _newAdmissionDetail.add(Resource.success(data: result));
          newAdmissionDetails?.add(result?.data ?? NewAdmissionDetail());
          selectedTabValue.add(selectedTabValue.value + 1);
          isLoading.add(false);
          getEnquiryDetails(enquiryId: enquiryId);
        },
        onError: (error) {
          _newAdmissionDetail.add(Resource.error(error: error));
          isLoading.add(false);
        });
  }

  void getNewAdmissionEnquiry(
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
          newAdmissionDetails?.add(result?.data ?? NewAdmissionDetail());
          if (isEdit) {
            setNewAdmissionEnquiry(
                newAdmissionDetail:
                    newAdmissionDetails?.value ?? NewAdmissionDetail());
          }
        },
        onError: (error) {
          _newAdmissionDetail.add(Resource.error(error: error));
        });
  }

  void setNewAdmissionEnquiry(
      {required NewAdmissionDetail newAdmissionDetail}) {
    enquiryDetailArgs;
  }
}
