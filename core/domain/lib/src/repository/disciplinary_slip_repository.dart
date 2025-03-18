import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

abstract class DisciplinarySlipRepository{
  Future<Either<NetworkError,DisciplinaryListModel>> getdiscplinarySlipList(
      {required int studentId,  int? academicYearId , DateTime? date});

  Future<Either<NetworkError,AcknowlegementResponseModel>> createAcknowledgeMent(
      {required AcknowlegementRequestModel model}

  );
     Future<Either<NetworkError,CoReasonsListResponseModel>> getCoReasons();



}