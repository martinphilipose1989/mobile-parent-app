import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

class SchoolVisitRepositoryImpl{

  final NetworkPort _networkPort;

  SchoolVisitRepositoryImpl(this._networkPort);

  Future<Either<NetworkError,SchoolVisitCreation>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest}){
    return _networkPort.createSchoolVisit(enquiryID: enquiryID, schoolCreationRequest: schoolCreationRequest);
  }
  Future<Either<NetworkError,SchoolVisitCreation>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest}){
    return _networkPort.rescheduleSchoolVisit(schoolVisitID: schoolVisitID, schoolCreationRequest: schoolCreationRequest);
  }

  Future<Either<NetworkError,SchoolVisitCreation>> cancelSchoolVisit({required String schoolVisitID,required SchoolVisitCancelRequest cancelSchoolVisitRequest}){
    return _networkPort.cancelSchoolVisit(schoolVisitID: schoolVisitID,cancelSchoolRequest: cancelSchoolVisitRequest);
  }
}