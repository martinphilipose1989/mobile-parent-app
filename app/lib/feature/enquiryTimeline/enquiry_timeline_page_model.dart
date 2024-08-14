import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class EnquiriesTimelinePageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetEnquiryTimeLineUseCase enquiryTimeLineUseCase;
  EnquiriesTimelinePageModel(this.exceptionHandlerBinder,this.enquiryTimeLineUseCase);

  final PublishSubject<Resource<List<EnquiryTimelineDetail>>> enquiryTimeline= PublishSubject();

  Future<void> getEnquiryTimeLine({required String enquiryID}) async {
    exceptionHandlerBinder.handle(block: () {
      
      GetEnquiryTimelineUseCaseParams params = GetEnquiryTimelineUseCaseParams(
        enquiryID: enquiryID,
      );
      enquiryTimeline.add(Resource.loading());
      RequestManager<EnquiryTimeLineBase>(
        params,
        createCall: () => enquiryTimeLineUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        enquiryTimeline.add(Resource.success(data: result.data?.data?.timeline));
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
