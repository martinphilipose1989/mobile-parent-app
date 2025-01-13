import 'package:rxdart/rxdart.dart';

final BehaviorSubject<bool> logoutOnTokenExpiry = BehaviorSubject.seeded(false);

final BehaviorSubject<bool> showSideDrawer = BehaviorSubject.seeded(false);
