import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../model/resource.dart';
import '../../../utils/request_manager.dart';

class AttendanceDetailsViewModel extends BasePageViewModel {

  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final AttendanceDetailUsecase attendanceDetailsUseCase;

  AttendanceDetailsViewModel(this.exceptionHandlerBinder,
      this.attendanceDetailsUseCase);


  final BehaviorSubject<Resource<AttendanceDetailsResponseModel>>
  _getAttendanceDetail =
  BehaviorSubject<Resource<AttendanceDetailsResponseModel>>();

  Stream<Resource<AttendanceDetailsResponseModel>> get getAttendanceDetail =>
      _getAttendanceDetail;


  void getAttendance(
      {required AttendanceDetailsRequestModel model}
      ){
    exceptionHandlerBinder.handle(block: () {

      AttendanceDetailUsecaseParams params=     AttendanceDetailUsecaseParams( model);
      RequestManager<AttendanceDetailsResponseModel>(
        params,
        createCall: () => attendanceDetailsUseCase.execute(params: params),
      ).asFlow().listen((result) {
        _getAttendanceDetail.add(result);
        if (result.status == Status.error) {}

      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();



  }



}