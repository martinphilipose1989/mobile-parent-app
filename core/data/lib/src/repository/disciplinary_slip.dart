
import 'package:data/data.dart';

class DisciplinarySlipRepositoryImpl extends DisciplinarySlipRepository {
  final NetworkPort networkPort;

  DisciplinarySlipRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, DisciplinaryListModel>> getdiscplinarySlipList({required int studentId, int? academicYearId,  DateTime? date}) {
    return networkPort.getDisciplinaryList(studentId: studentId, academicYearID: academicYearId, time: date);
    //
  }

  @override
  Future<Either<NetworkError, AcknowlegementResponseModel>> createAcknowledgeMent({required AcknowlegementRequestModel model}) {
   return networkPort.acknowledge(acknowledgementRequestModel: model);
  }

  @override
  Future<Either<NetworkError, CoReasonsListResponseModel>> getCoReasons() {
  return networkPort.getCoReasons();
  }




}