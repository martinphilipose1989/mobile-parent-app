import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

abstract class DisciplinarySlipRepository{
  Future<Either<NetworkError,DisciplinaryListModel>> getdiscplinarySlipList(
      {required int studentId, required  int academicYearId ,required DateTime date});

  Future<Either<NetworkError,AcknowlegementResponseModel>> createAcknowledgeMent(
      {required AcknowlegementRequestModel model}

  );



}