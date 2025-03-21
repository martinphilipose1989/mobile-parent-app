import 'package:app/di/app_dependency_configurator.dart';
import 'package:appauth/appauth.dart';
import 'package:attachment/attachment.dart';
import 'package:data/data.dart';
import 'package:database_floor/floor.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:notification/notification.dart';

import 'package:services/services.dart';
import 'package:themes/themes.dart';

final getIt = GetIt.instance;

// configureModulesDependencies imported from feature_module
final configurators = [
  //main app configurator
  AppDependencyConfigurator(),

  //configure themes
  ThemesDependencyConfigurator(),

  //configure database sources
  DatabaseDependencyConfigurator(),

  // secure storage
  ServiceDependenciesConfigurator(),

  //configure network sources
  NetworkDependencyConfigurator(),

  //configure data layer
  DataDependencyConfigurator(),

  //configure domain layer
  DomainDependencyConfigurator(),

  //configure attachment sources
  AttachmentDependenciesConfigurator(),

  // key cloak
  AppAuthDependenciesConfigurator(),

  NotificationDependencyConfigurator()
];

Future configureDependencies(DependencyConfigurationContext context) async {
  for (var configurator in configurators) {
    await configurator.configureDependencies(context, getIt);
  }
}
