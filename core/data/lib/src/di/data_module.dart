import 'package:data/data.dart';
import 'package:data/src/repository/admin_repository.dart';
import 'package:data/src/repository/attachment_repository.dart';
import 'package:data/src/repository/disciplinary_slip.dart';
import 'package:data/src/repository/finance_repository.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../repository/attendance_repository.dart';

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
 AttendanceRepository attendanceRepositoryProvider(
    NetworkPort network) {
    return AttendanceRepositoryImpl(network);
  }

  @lazySingleton
  AdminRepository adminRepositoryProvider(NetworkPort networkPort) {
    return AdminRepositoryImpl(networkPort);
  }
  @lazySingleton
  DisciplinarySlipRepository disciplinarySlipRepositoryProvider(NetworkPort networkPort) {
    return DisciplinarySlipRepositoryImpl(networkPort);
  }

}
