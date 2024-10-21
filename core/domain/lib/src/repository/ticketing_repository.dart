import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class TicketingRepository {
  Future<Either<NetworkError, CommunicationListModel>> getTicketsList(
      {required int pageSize, required int page});
}
