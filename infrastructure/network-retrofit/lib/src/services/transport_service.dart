import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/response/fetch_stops/fetch_stops_response_entity.dart';
import 'package:network_retrofit/src/model/response/transport/student_attendance_response_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../../network_retrofit.dart';
import '../model/response/bearer/get_bearer_list_response_entity.dart';
import '../model/response/transport/bus_route_response_entity.dart';
import '../model/response/transport/fetch_stops_logs_entity.dart';
import '../model/response/transport/get_student_profile_entity_response.dart';
import '../model/response/transport/trip_response_entity.dart';

part 'transport_service.g.dart';

const String _getMyDutyList = "transport-service/parent/route-list";

const String _getStudentProfile =
    "transport-service/parent/student-profile/{studentId}";
const String _getStaffList =
    'transport-service/parent/staff-contacts/{route_id}';
const String _getStudentattendance =
    "transport-service/parent/student-attandence/{student_id}/{attendance_type}";
const String _fetchStopsLogs = "transport-service/parent/fetch-stop-logs";
const String _getBusStopsList = 'transport-service/parent/bus-stops';
const String _fetchStops = "transport-service/route/fetch-stops";

const String _getBearerList =
    "transport-service/mobile-app/bearer-list/{studentId}";

@RestApi()
abstract class TransportService {
  factory TransportService(Dio dio, {String? transportUrl}) {
    return _TransportService(dio, baseUrl: transportUrl);
  }

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
    @Path("student_id") required int studentId,
    @Path("attendance_type") required int? attendanceType,
    @Query("platform") required String platform,
  });

  @GET(_getStaffList)
  Future<HttpResponse<StaffListResponseEntity>> getStaffList({
    @Path("route_id") required int schoolId,
    @Query("platform") required String platform,
  });

  @GET(_fetchStopsLogs)
  Future<HttpResponse<FetchStopLogsEntity>> fetchStopLogs({
    @Query("route_id") required int routeId,
    @Query("platform") required String platform,
  });

  @POST(_fetchStops)
  Future<HttpResponse<FetchStopResponseEntity>> fetchStops(
      {@Body() required FetchStopRequest fetchStopRequest,
      @Query('platform') required String platform});

  @GET(_getBearerList)
  Future<HttpResponse<GetBearerListResponseEntity>> getBearerList(
      @Path('studentId') int studentId,
      @Query('platform') String app);

}
