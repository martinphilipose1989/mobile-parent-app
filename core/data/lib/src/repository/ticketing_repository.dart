import 'package:data/data.dart';

class TicketingRepositoryImpl extends TicketingRepository {
  final NetworkPort networkPort;

  TicketingRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page}) {
    return networkPort.getTicketsList(pageSize: pageSize, page: page);
  }

  @override
  Future<Either<NetworkError, CreateCommunicationModel>> createCommunication() {
    return networkPort.createCommunication();
  }

  @override
  Future<Either<NetworkError, FindByCategorySubCategoryModel>>
      findByCategorySubCategory(
          {required int categoryId, required int subCategoryId}) {
    return networkPort.findByCategorySubCategory(
        categoryId: categoryId, subCategoryId: subCategoryId);
  }

  @override
  Future<Either<NetworkError, GetCommunicationDetails>> createCommunicationLog(
      {required String communocationId}) {
    return networkPort.createCommunicationLog(communocationId: communocationId);
  }

  @override
  Future<Either<NetworkError, SendCommunicationModel>> sendCommunication(
      {required CreateCommunicationLogRequest createCommunicationLogRequest}) {
    return networkPort.sendCommunication(
        createCommunicationLogRequest: createCommunicationLogRequest);
  }

  @override
  Future<Either<NetworkError, CreateTicketModel>> createTicket(
      {required CreateTicketRequest createTicketRequest}) {
    return networkPort.createTicket(createTicketRequest: createTicketRequest);
  }
}
