import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../model/resource.dart';
import '../../../utils/request_manager.dart';

class AttendanceCalenderViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
 final  AttendanceCountUsecase attendanceCountUsecase;
  AttendanceCalenderViewModel(this.exceptionHandlerBinder, this.attendanceCountUsecase);



  final BehaviorSubject<Resource<AttendanceCountResponseModel>>
  _getAttendancelist =
  BehaviorSubject<Resource<AttendanceCountResponseModel>>();

  Stream<Resource<AttendanceCountResponseModel>> get   getAttendancelist =>
      _getAttendancelist;


  void getAttendanceList(
      {required AttendanceCountRequestModel model}
      ){
    exceptionHandlerBinder.handle(block: () {

      AttendanceCountUsecaseParams params=  AttendanceCountUsecaseParams( attendanceCountRequestModel: model,);
      RequestManager<AttendanceCountResponseModel>(
        params,
        createCall: () => attendanceCountUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getAttendancelist.add(result);
        if (result.status == Status.error) {}

      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();



  }



}