import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';

@injectable
class CancelCompetencyPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CancelCompetencyTestUsecase cancelCompetencyTestUsecase;
  CancelCompetencyPageModel(this.exceptionHandlerBinder,this.cancelCompetencyTestUsecase);


  final PublishSubject<Resource<CompetencyTestDetails>> competencyTestDetail = PublishSubject();
  CompetencyTestDetails? competencyTestDetailsData;
  TextEditingController controller = TextEditingController();
  DateFormat dateFormat = DateFormat('d MMMM yyyy');

  Future<void> cancelCompetencyTest({required String enquiryID, required String competencyTestID}) async {
      exceptionHandlerBinder.handle(block: () {
      CancelCompetencyTestRequest request = CancelCompetencyTestRequest(
        comment: controller.text.trim(),
        reason: selectedReason 
      );

      CancelCompetencyTestUsecaseParams params = CancelCompetencyTestUsecaseParams(
        enquiryID: enquiryID,
        cancelCompetencyTestRequest: request,
        
      );
      competencyTestDetail.add(Resource.loading());
      RequestManager<CompetencyTestDetailBase>(
        params,
        createCall: () => cancelCompetencyTestUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        competencyTestDetail.add(Resource.success(data: result.data?.data));
        competencyTestDetailsData = result.data?.data;
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