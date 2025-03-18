import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:notification/notification_adapter.dart';

@module
abstract class NotificationModule {
  @lazySingleton
  NotificationPort providerNotificationAdapter() {
    return NotificationAdapter();
  }
}
