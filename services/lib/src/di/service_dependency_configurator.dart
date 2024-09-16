import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_dependency_configurator.config.dart';

//global private function
@InjectableInit(initializerName: r'$initServiceGetIt')
_configureModuleDependencies(GetIt getIt) => $initServiceGetIt(getIt);

class ServiceDependenciesConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
