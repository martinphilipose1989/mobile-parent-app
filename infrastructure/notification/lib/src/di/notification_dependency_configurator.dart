//global private function
import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'notification_dependency_configurator.config.dart';

@InjectableInit(initializerName: r'$initNotificationGetIt')
_configureModuleDependencies(GetIt getIt) => $initNotificationGetIt(getIt);

class NotificationDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
