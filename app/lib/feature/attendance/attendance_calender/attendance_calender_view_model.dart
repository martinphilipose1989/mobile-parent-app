import 'package:app/utils/date_formatter.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../model/resource.dart';
import '../../../utils/request_manager.dart';

class AttendanceCalenderViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final AttendanceCountUsecase attendanceCountUsecase;
  final StudentDetailUseCase studentDetailsUsecase;
  AttendanceCalenderViewModel(this.exceptionHandlerBinder,
      this.attendanceCountUsecase, this.studentDetailsUsecase);

  final BehaviorSubject<Resource<AttendanceCountResponseModel>>
      _getAttendancelist =
      BehaviorSubject<Resource<AttendanceCountResponseModel>>();

  Stream<Resource<AttendanceCountResponseModel>> get getAttendancelist =>
      _getAttendancelist;

  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent;
  DateTime selectedmonth = DateTime.now();
  // DateTime.parse(DateFormat('yyyy-MM').format(DateTime.now()));
  late int? academicId;
  void getAttendanceList({required AttendanceCountRequestModel model}) {
    exceptionHandlerBinder.handle(block: () {
      AttendanceCountUsecaseParams params = AttendanceCountUsecaseParams(
        attendanceCountRequestModel: model,
      );
      RequestManager<AttendanceCountResponseModel>(
        params,
        createCall: () => attendanceCountUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getAttendancelist.add(result);
        if (result.status == Status.error) {}
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  final BehaviorSubject<Resource<StudentDetailsResponseModel>> _studentDetails =
      BehaviorSubject<Resource<StudentDetailsResponseModel>>();

  Stream<Resource<StudentDetailsResponseModel>> get studentDetails =>
      _studentDetails;

  void getStudentDetail({required int? id}) {
    exceptionHandlerBinder.handle(block: () {
      StudentDetailUseCaseParams params = StudentDetailUseCaseParams(id!);
      RequestManager<StudentDetailsResponseModel>(
        params,
        createCall: () => studentDetailsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _studentDetails.add(result);

          academicId = result.data?.data?.profile?.academicYearId;
          getAttendanceList(
              model: AttendanceCountRequestModel(
                  studentId: selectedStudent?.first.id,
                  attendanceDate:
                      DateFormatter.convertDateToYearMonth(selectedmonth),
                  academicYearId:
                      result?.data?.data?.profile!.academicYearId ?? 26));
        }

        if (result.status == Status.error) {}
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
