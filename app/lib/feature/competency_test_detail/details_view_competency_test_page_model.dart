import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/domain.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class DetailsViewCompetencyTestPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetCompetencyTestDetailUseCase getCompetencyTestDetailUseCase;
  DetailsViewCompetencyTestPageModel(this.exceptionHandlerBinder,this.getCompetencyTestDetailUseCase);
  final PublishSubject<Resource<CompetencyTestDetails>> competencyTestDetail = PublishSubject();
  CompetencyTestDetails? competencyTestDetails;

  Future<void> getCompetencyTestDetail(String enquiryID) async {
      exceptionHandlerBinder.handle(block: () {
      
      GetCompetencyTestDetailUseCaseParams params = GetCompetencyTestDetailUseCaseParams(
        enquiryID: enquiryID
      );
      competencyTestDetail.add(Resource.loading());
      RequestManager<CompetencyTestDetailBase>(
        params,
        createCall: () => getCompetencyTestDetailUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        competencyTestDetail.add(Resource.success(data: result.data?.data));
        competencyTestDetails = result.data!.data;
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
