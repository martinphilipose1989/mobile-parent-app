import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class SchoolVisitRepository{
  Future<Either<NetworkError,SchoolVisitCreation>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitCreation>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitCreation>> cancelSchoolVisit({required String schoolVisitID,required SchoolVisitCancelRequest cancelSchoolRequest});
}