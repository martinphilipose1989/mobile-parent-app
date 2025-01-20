import 'package:data/data.dart';
import 'package:data/src/repository/admin_repository.dart';
import 'package:data/src/repository/attachment_repository.dart';
import 'package:data/src/repository/disciplinary_slip.dart';
import 'package:data/src/repository/finance_repository.dart';
import 'package:data/src/repository/mdm_repository.dart';
import 'package:data/src/repository/ticketing_repository.dart';
import 'package:data/src/repository/gatepass_repository.dart';
import 'package:data/src/repository/transport_repo_impl.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../repository/attendance_repository.dart';
import '../repository/notification_repository.dart';

@module
abstract class DataModule {
  @lazySingleton
  EnquiryRepository enquiryRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return EnquiryRepositoryImpl(networkPort);
  }

  @lazySingleton
  SchoolVisitRepository schoolVisitRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return SchoolVisitRepositoryImpl(networkPort);
  }

  @lazySingleton
  UserRepository userRepositoryProvider(
    DatabasePort databasePort,
    NetworkPort networkPort,
    AppAuthPort appAuthPort,
    @Named("ClientId") String clientId,
    @Named("ClientSecret") String clientSecret,
  ) {
    return UserRepositoryImpl(
        databasePort, networkPort, appAuthPort, clientId, clientSecret);
  }

  @lazySingleton
  AdmissionRepository admissionRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return AdmissionRepositoryImpl(networkPort);
  }

  @lazySingleton
  TransportRepository transportRepository(NetworkPort networkPort) {
    return TransportRepositoryimpl(networkPort);
  }

  @lazySingleton
  CompetencyTestRepository competencyTestRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return CompetencyTestRepositoryImpl(networkPort);
  }

  @lazySingleton
  RegistrationRepository registrationRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return RegistrationRepositoryImpl(networkPort);
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
  AttendanceRepository attendanceRepositoryProvider(NetworkPort network) {
    return AttendanceRepositoryImpl(network);
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
  MDMRepository mdmRepository(NetworkPort networkPort) {
    return MDMRepositoryImpl(networkPort);
  }

  @lazySingleton
  DisciplinarySlipRepository disciplinarySlipRepositoryProvider(
      NetworkPort networkPort) {
    return DisciplinarySlipRepositoryImpl(networkPort);
  }

  @lazySingleton
  GatepassRepository gatepassRepositoryProvider(NetworkPort networkPort) {
    return GatepassRepositoryImpl(networkPort: networkPort);
  }

  @lazySingleton
  NotificationRepository notificationrepository(NetworkPort networkPort) {
    return NotificationRepositoryImpl(networkPort: networkPort);
  }
}
