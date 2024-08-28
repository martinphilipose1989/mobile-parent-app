import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';

@injectable
class CancelSchoolTourPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CancelSchoolVisitUsecase cancelSchoolVisitUsecase;
  CancelSchoolTourPageModel(this.exceptionHandlerBinder,this.cancelSchoolVisitUsecase);

  final PublishSubject<Resource<SchoolVisitDetail>> schoolVisitDetail = PublishSubject();
  SchoolVisitDetail? schoolVisitDetailData;
  TextEditingController controller = TextEditingController();
  DateFormat dateFormat = DateFormat('d MMMM yyyy');

  Future<void> cacnelSchoolVisit({required String enquiryID, required String schoolVisitID}) async {
      exceptionHandlerBinder.handle(block: () {
      SchoolVisitCancelRequest request = SchoolVisitCancelRequest(
        comment: controller.text.trim(),
        reason: selectedReason 
      );

      CancelSchoolVisitUsecaseParams params = CancelSchoolVisitUsecaseParams(
        enquiryID: enquiryID,
        schoolVisitCancelRequest: request,
      );
      schoolVisitDetail.add(Resource.loading());
      RequestManager<SchoolVisitDetailBase>(
        params,
        createCall: () => cancelSchoolVisitUsecase.execute(
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

  bool validateForm() {
    if (selectedReason.isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please select reason."));
      return false;
    }
    else if (controller.text.trim().isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please enter your comment."));
      return false;
    }
    else {
      return true;
    }
  }

  final BehaviorSubject<bool> selectedReasonType =
  BehaviorSubject<bool>.seeded(false);
  String selectedReason = '';
  final List<String> reasonTypes = [
    'Reason 1',
    'Reason 2',
    'Reason 3'
  ];
}
