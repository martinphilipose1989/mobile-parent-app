import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

class SchoolVisitRepositoryImpl extends SchoolVisitRepository{

  final NetworkPort _networkPort;

  SchoolVisitRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, Slots>> getSchoolVisitSlots({required String enquiryID, required String date}) {
    return _networkPort.getSchoolVisitSlots(enquiryID: enquiryID, date: date);
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> getSchoolVisitDetail({required String enquiryID}) {
    return _networkPort.getSchoolVisitDetail(enquiryID: enquiryID);
  }

  @override
  Future<Either<NetworkError,SchoolVisitDetailBase>> createSchoolVisit({required String enquiryID,required SchoolCreationRequest schoolCreationRequest}){
    return _networkPort.createSchoolVisit(enquiryID: enquiryID, schoolCreationRequest: schoolCreationRequest);
  }
  @override
  Future<Either<NetworkError,SchoolVisitDetailBase>> rescheduleSchoolVisit({required String schoolVisitID,required SchoolCreationRequest schoolCreationRequest}){
    return _networkPort.rescheduleSchoolVisit(schoolVisitID: schoolVisitID, schoolCreationRequest: schoolCreationRequest);
  }

  @override
  Future<Either<NetworkError, SchoolVisitDetailBase>> cancelSchoolVisit({required String schoolVisitID, required SchoolVisitCancelRequest cancelSchoolRequest}) {
    return _networkPort.cancelSchoolVisit(schoolVisitID: schoolVisitID, cancelSchoolRequest: cancelSchoolRequest);
  }
}