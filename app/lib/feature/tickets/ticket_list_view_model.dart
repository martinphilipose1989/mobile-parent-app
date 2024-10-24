import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';
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
  final List<String> categoryTypes = [
    'Academic Related',
    'Curriculum Related',
    'Canteen Related',
    'Payment Related',
    'Staff Related',
    'Event Related',
    'Operation Related',
  ]; //'Select Category',
  final List<String> subCategoryTypes = [
    'Language/Subject Change',
    'Too Much Homework',
    'Food Not Served Properly',
    'Request For NOT To Deposit PDC',
    'Appreciation Note',
    'Requesting IVT',
    'Requesting For Leaving Certificate'
  ]; //'Select Sub Category',

  final BehaviorSubject<Resource<List<DataValue>>> _getTicketStatusModel =
      BehaviorSubject();

  Stream<Resource<List<DataValue>>> get getTicketStatusModel =>
      _getTicketStatusModel.stream;

  Future<void> getTicketStatus() async {
    _getTicketStatusModel.add(Resource.loading(data: []));
    await exceptionHandlerBinder.handle(block: () {
      TicketListingUsecaseParams params =
          TicketListingUsecaseParams(page: 1, pageSize: 10);
      RequestManager<CommunicationListModel>(
        params,
        createCall: () => _ticketListingUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          for (var value in result.data!.data!.data!) {
            value.formattedDateAndTime = formatDateTime(
                date: value.date.toString(), time: value.time ?? '');
          }
          _getTicketStatusModel
              .add(Resource.success(data: result.data?.data?.data));
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  String formatDateTime({required String date, required String time}) {
    // Parse the date part (ISO 8601 format)
    DateTime parsedDate = DateTime.parse(date);

    // Parse the time part (split by ':')
    List<String> timeParts = time.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    int seconds = int.parse(timeParts[2]);

    // Combine the parsed date and time
    DateTime combinedDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      hours,
      minutes,
      seconds,
    );

    // Format the combined date and time
    String formattedDate =
        DateFormat('hh:mm a dd MMM yyyy').format(combinedDateTime);

    return formattedDate;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
