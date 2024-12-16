import 'dart:async';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class AppViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  Timer? timer;

  AppViewModel(
    this.exceptionHandlerBinder,
  );

  final BehaviorSubject<bool> _getSessionSummary = BehaviorSubject();

  Stream<bool> get getSessionSummary => _getSessionSummary.stream;
}
