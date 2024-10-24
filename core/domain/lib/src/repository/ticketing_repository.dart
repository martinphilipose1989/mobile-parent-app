import 'package:domain/domain.dart';

abstract class TicketingRepository {
  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page});

  Future<Either<NetworkError, CreateCommunicationModel>> createCommunication();

  Future<Either<NetworkError, FindByCategorySubCategoryModel>>
      findByCategorySubCategory(
          {required int categoryId, required int subCategoryId});

  Future<Either<NetworkError, GetCommunicationDetails>> createCommunicationLog(
      {required String communocationId});

  Future<Either<NetworkError, SendCommunicationModel>> sendCommunication(
      {required CreateCommunicationLogRequest createCommunicationLogRequest});
}
