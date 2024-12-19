import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/feature/enquiriesAdmissionJourney/enquiries_admission_journey_page.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:get_it/get_it.dart';
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

  EnquiryBaseViewModel(
      {required this.enquiryDetailArgs,
      required this.flutterToastErrorPresenter,
      required this.exceptionHandlerBinder});

  void getEnquiryDetails({required String enquiryId}) {}

  void updateEnquiryDetails<T>(
      {required String enquiryId, required T enquiryDetails}) {}

  void getEnquiryDetailByType(
      {required String enquiryID, bool isEdit = false}) {}

  void setEnquiryDetailByType<T>({required T enquiryDetails}) {}
}
