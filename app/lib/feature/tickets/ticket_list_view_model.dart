import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../utils/request_manager.dart';

class TicketListViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final TicketListingUsecase _ticketListingUsecase;
  TicketListViewModel(this.exceptionHandlerBinder, this._ticketListingUsecase) {
    getTicketStatus();
  }

  late TabController tabController;
  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);
  final List<String> categoryTypes = [ 'Academic Related', 'Curriculum Related', 'Canteen Related', 'Payment Related', 'Staff Related', 'Event Related', 'Operation Related',]; //'Select Category',
  final List<String> subCategoryTypes = ['Language/Subject Change', 'Too Much Homework', 'Food Not Served Properly', 'Request For NOT To Deposit PDC', 'Appreciation Note', 'Requesting IVT', 'Requesting For Leaving Certificate']; //'Select Sub Category',

  final BehaviorSubject<Resource<CommunicationListModel>>
  _getTicketStatusModel = BehaviorSubject();

  Stream<Resource<CommunicationListModel>> get getTicketStatusModel =>
      _getTicketStatusModel.stream;

  Future<void> getTicketStatus() async {
    await exceptionHandlerBinder.handle(block: () {
      TicketListingUsecaseParams params =
      TicketListingUsecaseParams(page: 1, pageSize: 10);
      RequestManager<CommunicationListModel>(
        params,
        createCall: () => _ticketListingUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getTicketStatusModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }


  @override
  void dispose() {
    selectedValue.close();
  }
}