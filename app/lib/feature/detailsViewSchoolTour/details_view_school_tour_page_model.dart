import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/domain.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class DetailsViewSchoolTourPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetSchoolVisitDetailUseCase getSchoolVisitDetailUsecase;
  DetailsViewSchoolTourPageModel(this.exceptionHandlerBinder,this.getSchoolVisitDetailUsecase);
  final PublishSubject<Resource<SchoolVisitDetail>> schoolVisitDetail = PublishSubject();
  SchoolVisitDetail? schoolVisitDetailData;

  Future<void> getSchoolVisitDetail(String enquiryID) async {
      exceptionHandlerBinder.handle(block: () {
      
      GetSchoolVisitDetailUseCaseParams params = GetSchoolVisitDetailUseCaseParams(
        enquiryID: "6685346f0386eb1f0298cd51"
      );
      schoolVisitDetail.add(Resource.loading());
      RequestManager<SchoolVisitDetailBase>(
        params,
        createCall: () => getSchoolVisitDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        schoolVisitDetail.add(Resource.success(data: result.data?.data));
        schoolVisitDetailData = result.data?.data;
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
