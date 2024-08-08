import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AdmissionsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  AdmissionsViewModel(this.exceptionHandlerBinder);

  final TextEditingController _editingController = TextEditingController();




}
