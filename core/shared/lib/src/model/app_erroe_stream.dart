import 'package:rxdart/rxdart.dart';

final BehaviorSubject<bool> logoutOnTokenExpiry = BehaviorSubject.seeded(false);
final BehaviorSubject<bool> showDrawerMenu = BehaviorSubject.seeded(false);
