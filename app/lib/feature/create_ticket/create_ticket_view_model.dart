import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateTicketViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  CreateTicketViewModel(this.exceptionHandlerBinder);
 // final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  final List<String> categoryTypes = [ 'Academic Related', 'Curriculum Related', 'Canteen Related', 'Payment Related', 'Staff Related', 'Event Related', 'Operation Related',]; //'Select Category',
  final List<String> subCategoryTypes = ['Language/Subject Change', 'Too Much Homework', 'Food Not Served Properly', 'Request For NOT To Deposit PDC', 'Appreciation Note', 'Requesting IVT', 'Requesting For Leaving Certificate']; //'Select Sub Category',

  @override
  void dispose() {

   // selectedValue.close();
  }
}