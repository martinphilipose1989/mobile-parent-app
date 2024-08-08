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
  SchoolVisitRepositoryImpl schoolVisitRepository(
      DatabasePort databasePort, NetworkPort networkPort) {
    return SchoolVisitRepositoryImpl(networkPort);
  }
}
