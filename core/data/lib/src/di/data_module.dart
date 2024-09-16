import 'package:data/data.dart';
import 'package:data/src/repository/finance_repository.dart';
import 'package:data/src/repository/gatepass_repository.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

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
  UserRepository userRepositoryProvider(DatabasePort databasePort,
      NetworkPort networkPort, AppAuthPort appAuthPort) {
    return UserRepositoryImpl(databasePort, networkPort, appAuthPort);
  }

  @lazySingleton
  AdmissionRepository admissionRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return AdmissionRepositoryImpl(networkPort);
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
  GatepassRepository gatepassRepositoryProvider(NetworkPort networkPort) {
    return GatepassRepositoryImpl(networkPort: networkPort);
  }
}
