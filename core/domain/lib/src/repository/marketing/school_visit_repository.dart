import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class SchoolVisitRepository{
  Future<Either<NetworkError, SchoolVisitDetailBase>> getSchoolVisitDetail({required String enquiryID});
  Future<Either<NetworkError,SchoolVisitDetailBase>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> cancelSchoolVisit({required String schoolVisitID,required SchoolVisitCancelRequest cancelSchoolRequest});
}