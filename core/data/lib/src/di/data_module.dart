import 'package:data/data.dart';
import 'package:data/src/repository/admin_repository.dart';
import 'package:data/src/repository/attachment_repository.dart';
import 'package:data/src/repository/finance_repository.dart';
import 'package:data/src/repository/mdm_repository.dart';
import 'package:data/src/repository/ticketing_repository.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  UserRepository userRepositoryProvider(
      DatabasePort databasePort, NetworkPort networkPort) {
    return UserRepositoryImpl(databasePort, networkPort);
  }

  @lazySingleton
  FinanceRepository financeRepositoryProvider(NetworkPort networkPort) {
    return FinanceRepositoryImpl(networkPort);
  }

  @lazySingleton
  AttachmentRepository attachmentRepositoryProvider(
      AttachmentPort attachmentPort) {
    return AttachmentRepositoryImpl(attachmentPort);
  }

  @lazySingleton
  AdminRepository adminRepositoryProvider(NetworkPort networkPort) {
    return AdminRepositoryImpl(networkPort);
  }

  @lazySingleton
  TicketingRepository ticketingRepository(NetworkPort networkPort) {
    return TicketingRepositoryImpl(networkPort);
  }

  @lazySingleton
  MDMRepository mdmRepository(NetworkPort networkPort){
    return MDMRepositoryImpl(networkPort);
  }
}
