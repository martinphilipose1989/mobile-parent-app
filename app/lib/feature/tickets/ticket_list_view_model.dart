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
  final SendCommunicationUsecase _sendCommunicationUsecase;
  final GetUserDetailsUsecase _getUserDetailsUsecase;
  TicketListViewModel(this.exceptionHandlerBinder, this._ticketListingUsecase,
      this._sendCommunicationUsecase, this._getUserDetailsUsecase) {
    getUserDetails();
    getTicketStatus();
  }

  TextEditingController closeCommentController = TextEditingController();
  TextEditingController reopenCommentController = TextEditingController();

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
        // exceptionHandlerBinder.showError(error!);
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

  void isReopenedCliked(int index) {
    List<DataValue> tempList = _getTicketStatusModel.value.data ?? [];
    tempList[index].isReOpenedClicked = !tempList[index].isReOpenedClicked;
    _getTicketStatusModel.add(Resource.success(data: tempList));
  }

  void isMarkAsClosedCliked(int index) {
    List<DataValue> tempList = _getTicketStatusModel.value.data ?? [];
    tempList[index].isMarkAsClosedCliked =
        !tempList[index].isMarkAsClosedCliked;
    _getTicketStatusModel.add(Resource.success(data: tempList));
  }

  final BehaviorSubject<Resource<SendCommunicationModel>>
      _sendCommunicationModelSubject =
      BehaviorSubject<Resource<SendCommunicationModel>>();

  Stream<Resource<SendCommunicationModel>> get sendCommunicationModelStream =>
      _sendCommunicationModelSubject.stream;

  void sendCommunication(
      String communocationId, String comment, String status) {
    _sendCommunicationModelSubject.add(Resource.loading(data: null));
    exceptionHandlerBinder.handle(block: () {
      SendCommunicationUsecaseParams params = SendCommunicationUsecaseParams(
          createCommunicationLogRequest: CreateCommunicationLogRequest(
              comment: comment,
              communicationId: communocationId,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              status: status,
              userId: userSubject.value.data?.id.toString()));
      RequestManager<SendCommunicationModel>(
        params,
        createCall: () => _sendCommunicationUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _sendCommunicationModelSubject
              .add(Resource.success(data: result.data));
          getTicketStatus();
        }
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();
  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => _getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(Resource.success(data: data.data));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
