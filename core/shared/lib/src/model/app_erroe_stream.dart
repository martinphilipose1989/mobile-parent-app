import 'package:rxdart/rxdart.dart';

final BehaviorSubject<bool> logoutOnTokenExpiry = BehaviorSubject.seeded(false);
