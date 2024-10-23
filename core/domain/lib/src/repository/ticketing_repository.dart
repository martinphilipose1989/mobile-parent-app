import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class TicketingRepository {
  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page});

  Future<Either<NetworkError, CreateCommunicationModel>> createCommunication();

  Future<Either<NetworkError, FindByCategorySubCategoryModel>>
      findByCategorySubCategory(
          {required int categoryId, required int subCategoryId});

  Future<Either<NetworkError, CreateCommunicationLogModel>>
      createCommunicationLog(
          {required CreateCommunicationLogRequest
              createCommunicationLogRequest});
}
