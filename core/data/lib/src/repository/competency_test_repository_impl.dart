import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

class CompetencyTestRepositoryImpl extends CompetencyTestRepository{

  final NetworkPort _networkPort;

  CompetencyTestRepositoryImpl(this._networkPort);

  @override
  Future<Either<NetworkError, Slots>> getCompetencyTestSlots({required String enquiryID, required date}) {
    return _networkPort.getCompetencyTestSlots(enquiryID: enquiryID, date: date);
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> getCompetencyTestDetail({required String enquiryID}) {
    return _networkPort.getCompetencyTestDetail(enquiryID: enquiryID);
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> createCompetencyTest({required String enquiryID, required CompetencyTestCreationRequest competencyTestCreationRequest}) {
    return _networkPort.createCompetencyTest(enquiryID: enquiryID, competencyTestCreationRequest: competencyTestCreationRequest);
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> rescheduleCompetencyTest({required String enquiryID, required CompetencyTestRescheduleRequest competencyTestCreationRequest}) {
    return _networkPort.rescheduleCompetencyTest(enquiryID: enquiryID, competencyTestCreationRequest: competencyTestCreationRequest);
  }

  @override
  Future<Either<NetworkError, CompetencyTestDetailBase>> cancelCompetencyTest({required String enquiryID, required CancelCompetencyTestRequest cancelCompetencyTestRequest}) {
    return _networkPort.cancelCompetencyTest(enquiryID: enquiryID, cancelCompetencyTestRequest: cancelCompetencyTestRequest);    
  }
}