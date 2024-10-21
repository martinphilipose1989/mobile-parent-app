import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'appauth_dependency_configurator.config.dart';

//global private function
@InjectableInit(initializerName: r'$initAppAuthGetIt')
_configureModuleDependencies(GetIt getIt) => $initAppAuthGetIt(getIt);

class AppAuthDependenciesConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
