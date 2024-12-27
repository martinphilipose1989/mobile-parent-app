import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/common_widgets/common_popups.dart';
import 'package:app/utils/enums/enquiry_enum.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EnquiryBaseViewModel extends BasePageViewModel {
  EnquiryDetailArgs enquiryDetailArgs;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final MoveToNextStageUsecase moveToNextStageUsecase =
      GetIt.I<MoveToNextStageUsecase>();
  final GetMdmAttributeUsecase getMdmAttributeUsecase =
      GetIt.I<GetMdmAttributeUsecase>();
  final GetBrandUsecase getBrandUsecase = GetIt.I<GetBrandUsecase>();
  final GetEnquiryDetailUseCase getEnquiryDetailUseCase =
      GetIt.I<GetEnquiryDetailUseCase>();

  //  showing overlay loader while updating the enquiry details and uploading,deleting the documents
  BehaviorSubject<bool> isLoading = BehaviorSubject.seeded(false);
  // tab value to show the selected tab
  final BehaviorSubject<int> selectedTabValue = BehaviorSubject<int>.seeded(0);
  EnquiryBaseViewModel(
      {required this.enquiryDetailArgs,
      required this.flutterToastErrorPresenter,
      required this.exceptionHandlerBinder});

  //****************  Get Enquiry Details API  *************************//
  BehaviorSubject<EnquiryDetail> enquiryDetail =
      BehaviorSubject.seeded(EnquiryDetail());
  final PublishSubject<Resource<EnquiryDetailBase>> _fetchEnquiryDetail =
      PublishSubject();
  Stream<Resource<EnquiryDetailBase>> get fetchEnquiryDetail =>
      _fetchEnquiryDetail.stream;

  void getEnquiryDetails({required String enquiryId}) {
    _fetchEnquiryDetail.add(Resource.loading());
    GetEnquiryDetailUseCaseParams params =
        GetEnquiryDetailUseCaseParams(enquiryID: enquiryId);
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) => getEnquiryDetailUseCase.execute(params: params),
        onSuccess: (result) {
          _fetchEnquiryDetail.add(Resource.success(data: result));
          enquiryDetail.add(result?.data ?? EnquiryDetail());
        },
        onError: (error) {
          _fetchEnquiryDetail.add(Resource.error(error: error));
        });
  }

  //****************  Get Brand List API  *************************//

  final BehaviorSubject<Resource<List<BrandData>>> brandListResponse =
      BehaviorSubject<Resource<List<BrandData>>>.seeded(Resource.none());

  final BehaviorSubject<String> selectedBrandSubject = BehaviorSubject();

  void getBrandList() {
    final GetBrandUsecaseParams params = GetBrandUsecaseParams();
    ApiResponseHandler.apiCallHandler(
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        params: params,
        createCall: (params) => getBrandUsecase.execute(params: params),
        onSuccess: (result) {
          final brandList = result?.data ?? [];
          brandListResponse.add(Resource.success(data: brandList));
        },
        onError: (error) {
          brandListResponse.add(Resource.error(error: error));
        });
  }

  //****************  Show Dialog for Edit enquiry success  *************************//
  showPopUP(context) {
    Future.delayed(Duration.zero, () {
      CommonPopups().showSuccess(
          // ignore: use_build_context_synchronously
          navigatorKey.currentState!.context,
          'Enquiry edited Successfully', (shouldRoute) {
        Navigator.pop(navigatorKey.currentState!.context);
        if (enquiryDetailArgs.enquiryType == EnquiryTypeEnum.psa.type ||
            enquiryDetailArgs.enquiryType?.toLowerCase() ==
                EnquiryTypeEnum.kidsClub.type.toLowerCase()) {
          navigatorKey.currentState?.pushNamed(RoutePaths.trackerAdmissions);
        }
      });
    });
  }
}
