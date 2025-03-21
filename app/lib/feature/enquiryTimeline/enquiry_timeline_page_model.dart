import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
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
  final FlutterToastErrorPresenter flutterToastErrorPresenter;
  EnquiriesTimelinePageModel(this.exceptionHandlerBinder,
      this.enquiryTimeLineUseCase, this.flutterToastErrorPresenter);

  final PublishSubject<Resource<List<EnquiryTimelineDetail>>> enquiryTimeline =
      PublishSubject();

  final PublishSubject<Resource<EnquiryTimeLineBase>> _fetchEnquiryTimeline =
      PublishSubject();
  Stream<Resource<EnquiryTimeLineBase>> get fetchEnquiryTimeline =>
      _fetchEnquiryTimeline.stream;

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
        _fetchEnquiryTimeline.add(result);
        if (result.status == Status.success) {
          enquiryTimeline
              .add(Resource.success(data: result.data?.data?.timeline));
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
