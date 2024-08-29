import 'dart:async';

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class DetailsViewSchoolTourPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetSchoolVisitDetailUseCase getSchoolVisitDetailUsecase;
  DetailsViewSchoolTourPageModel(this.exceptionHandlerBinder,this.getSchoolVisitDetailUsecase);
  final PublishSubject<Resource<SchoolVisitDetail>> schoolVisitDetail = PublishSubject();
  final PublishSubject<Resource<SchoolVisitDetailBase>> _schoolVisitDetailResponse = PublishSubject();
  Stream<Resource<SchoolVisitDetailBase>> get schoolVisitDetailResponse => _schoolVisitDetailResponse.stream;
  BehaviorSubject<SchoolVisitDetail> schoolVisitDetailData = BehaviorSubject.seeded(SchoolVisitDetail());

  Future<void> getSchoolVisitDetail(String enquiryID) async {
      exceptionHandlerBinder.handle(block: () {
      
      GetSchoolVisitDetailUseCaseParams params = GetSchoolVisitDetailUseCaseParams(
        enquiryID: enquiryID
      );
      
      RequestManager<SchoolVisitDetailBase>(
        params,
        createCall: () => getSchoolVisitDetailUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _schoolVisitDetailResponse.add(result);
        if(result.status == Status.success){
          schoolVisitDetail.add(Resource.success(data: result.data?.data));
          schoolVisitDetailData.value = result.data?.data??SchoolVisitDetail();
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
