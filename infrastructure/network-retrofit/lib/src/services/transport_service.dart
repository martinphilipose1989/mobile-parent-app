import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/response/transport/student_attendance_response_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/transport/bus_route_response_entity.dart';
import '../model/response/transport/get_student_profile_entity_response.dart';
import '../model/response/transport/trip_response_entity.dart';

part 'transport_service.g.dart';

const String transportBaseUrl =
    "https://transport-219111640528.us-central1.run.app/";
const String _getMyDutyList = "${transportBaseUrl}transport-service/parent/route-list";
const String _getCheckList = "transport-service/mobile-app/check-list";
const String _createIncidentReport = "transport-service/mobile-app/check-list";
const String _getStudentListByRoute =
    "transport-service/mobile-app/student-list";
const String _getStudentProfile =
    "${transportBaseUrl}transport-service/parent/student-profile/{studentId}";

const String _getStudentattendance =
    "${transportBaseUrl}transport-service/parent/student-attandence/{studentId}";

const String _getBusStopsList = '${transportBaseUrl}transport-service/parent/bus-stops';

@RestApi()
abstract class TransportService {
  factory TransportService(Dio dio, {String? transportUrl}) {
    return _TransportService(dio, baseUrl: transportUrl);
  }

  // @GET(_getCheckList)
  // Future<HttpResponse<CheckListResponseEntity>> getAllCheckList(
  //     @Query("page") int page,
  //     @Query("limit") int limit,
  //     @Query("day_id") int dayId);

  @GET(_getStudentProfile)
  Future<HttpResponse<GetStudentProfileResponseEntity>> getStudentProfile(
      @Path("studentId") int studentId,
      {@Query("platform") required String platform});

  @GET(_getMyDutyList)
  Future<HttpResponse<TripResponseEntity>> getMyDutyList(
      @Query("page") int page,
      @Query("limit") int limit,
      @Query("day_id") int dayId,
      @Query("student_id") int studentId,
      @Query("platform") String app);

  @GET(_getBusStopsList)
  Future<HttpResponse<BusStopResponseEntity>> getBusStopsList(
      {@Query("route_id") required String routeId,
      @Query("day_id") required int dayId,
      @Query("platform") required String app});

  @GET(_getStudentattendance)
  Future<HttpResponse<StudentAttendanceResponseEntity>> getStudentAttendance({
    @Path("studentId") required int studentId,
    @Query("platform") required String platform,
  });
  // @GET(_fetchStopsLogs)
  // Future<HttpResponse<FetchStopLogsEntity>> fetchStopLogs(
  //     {@Query("route_id") required int routeId, required int stopId});

// @GET(_getBearerList)
// Future<HttpResponse<GetBearerListResponseEntity>> getBearerList(
//     @Path('studentId') int studentId);
//
// @GET(_getSchoolContacts)
// Future<HttpResponse<GetSchoolContactResponseEntity>> getSchoolContacts(
//     @Path('schoolId') int schoolId);
}
