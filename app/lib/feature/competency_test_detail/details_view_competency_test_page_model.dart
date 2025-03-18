import 'dart:async';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class DetailsViewCompetencyTestPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetCompetencyTestDetailUseCase getCompetencyTestDetailUseCase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  DetailsViewCompetencyTestPageModel(this.exceptionHandlerBinder,
      this.getCompetencyTestDetailUseCase, this.flutterToastErrorPresenter);

  final PublishSubject<Resource<CompetencyTestDetails>> competencyTestDetail =
      PublishSubject();
  final PublishSubject<Resource<CompetencyTestDetailBase>>
      _competencyTestDetailBase = PublishSubject();
  Stream<Resource<CompetencyTestDetailBase>> get competencyTestDetailBase =>
      _competencyTestDetailBase.stream;
  BehaviorSubject<CompetencyTestDetails> competencyTestDetails =
      BehaviorSubject.seeded(CompetencyTestDetails());

  Future<void> getCompetencyTestDetail(String enquiryID) async {
    exceptionHandlerBinder.handle(block: () {
      GetCompetencyTestDetailUseCaseParams params =
          GetCompetencyTestDetailUseCaseParams(enquiryID: enquiryID);
      RequestManager<CompetencyTestDetailBase>(
        params,
        createCall: () => getCompetencyTestDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _competencyTestDetailBase.add(result);
        if (result.status == Status.success) {
          competencyTestDetails.value =
              result.data?.data ?? CompetencyTestDetails();
        }
        if (result.status == Status.error) {
          flutterToastErrorPresenter.show(
              result.dealSafeAppError!.throwable,
              navigatorKey.currentContext!,
              result.dealSafeAppError?.error.message ?? '');
        }
        // activeStep.add()
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
