import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'file_utility_dependency_configurator.config.dart';

//global private function
@InjectableInit(initializerName: r'$initAttachmentGetIt')
_configureModuleDependencies(GetIt getIt) => $initAttachmentGetIt(getIt);

class FileUtilityDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
