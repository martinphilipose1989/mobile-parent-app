import 'package:data/data.dart';

class TicketingRepositoryImpl extends TicketingRepository {
  final NetworkPort networkPort;

  TicketingRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page}) {
    return networkPort.getTicketsList(pageSize: pageSize, page: page);
  }
}
