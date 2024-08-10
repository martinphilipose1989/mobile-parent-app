import 'package:data/data.dart';
import 'package:domain/domain.dart';
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
  AdmissionRepository admissionRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return AdmissionRepositoryImpl(networkPort);
  }

  @lazySingleton
  CompetencyTestRepository competencyTestRepository(
    DatabasePort databasePort, NetworkPort networkPort){
      return CompetencyTestRepositoryImpl(networkPort);
  }

  @lazySingleton
  RegistrationRepository registrationRepository(
    DatabasePort databasePort, NetworkPort networkPort) {
      return RegistrationRepositoryImpl(networkPort);
  }
}
