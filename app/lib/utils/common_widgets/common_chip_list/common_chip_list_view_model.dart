import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CommonChipListViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  CommonChipListViewModel(this.exceptionHandlerBinder);

  final BehaviorSubject<int> highlightIndex = BehaviorSubject<int>.seeded(0);
}

class CommonChips {
  final String? name;
  bool isSelected;
  CommonChips({this.name, this.isSelected = false});
}
