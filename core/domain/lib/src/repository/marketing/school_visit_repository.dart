import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class SchoolVisitRepository{
  Future<Either<NetworkError,Slots>> getSchoolVisitSlots({required String enquiryID,required String date});
  Future<Either<NetworkError, SchoolVisitDetailBase>> getSchoolVisitDetail({required String enquiryID});
  Future<Either<NetworkError,SchoolVisitDetailBase>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> rescheduleSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest});
  Future<Either<NetworkError,SchoolVisitDetailBase>> cancelSchoolVisit({required String enquiryID,required SchoolVisitCancelRequest cancelSchoolRequest});
}