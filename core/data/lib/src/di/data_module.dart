import 'package:data/data.dart';
import 'package:data/src/repository/gatepass_repository.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  UserRepository userRepositoryProvider(
      DatabasePort databasePort, NetworkPort networkPort) {
    return UserRepositoryImpl(databasePort, networkPort);
  }

  @lazySingleton
  GatepassRepository gatepassRepositoryProvider(NetworkPort networkPort) {
    return GatepassRepositoryImpl(networkPort: networkPort);
  }
}
