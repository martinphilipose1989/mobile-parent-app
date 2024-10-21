// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class RatePageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  RatePageModel(this.exceptionHandlerBinder);

  BehaviorSubject<int> selectedRatingValue = BehaviorSubject<int>.seeded(0);

  void updateRatingValue(int value) {
    selectedRatingValue.add(value);
  }
}
