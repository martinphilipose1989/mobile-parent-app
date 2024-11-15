// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:intl/intl.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class CommunicationPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CreateCommunicationLogUsecase _createCommunicationLogUsecase;
  final SendCommunicationUsecase _sendCommunicationUsecase;

  CommunicationPageModel(this.exceptionHandlerBinder,
      this._createCommunicationLogUsecase, this._sendCommunicationUsecase);

  BehaviorSubject<int> selectedRatingValue = BehaviorSubject<int>.seeded(0);

  void updateRatingValue(int value) {
    selectedRatingValue.add(value);
  }

  TextEditingController commentController = TextEditingController();

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

  String formatIsoDateTime(String isoDateTime) {
    // Parse the ISO 8601 date-time string
    DateTime parsedDateTime = DateTime.parse(isoDateTime);

    // Format the date and time with the short month name
    String formattedDate =
        DateFormat('hh:mm a dd MMM yyyy').format(parsedDateTime);

    return formattedDate;
  }

  late String chatId;

  String userId = '1';
  // calling validate on pay api

  final BehaviorSubject<Resource<GetCommunicationDetails>>
      _getCommunicationDetailsSubject =
      BehaviorSubject<Resource<GetCommunicationDetails>>();

  Stream<Resource<GetCommunicationDetails>> get getCommunicationDetailsStream =>
      _getCommunicationDetailsSubject.stream;

  void getCommunicationDetails(String communocationId) {
    _getCommunicationDetailsSubject.add(Resource.loading(data: null));
    exceptionHandlerBinder.handle(block: () {
      CreateCommunicationLogUsecaseParams params =
          CreateCommunicationLogUsecaseParams(communocationId: communocationId);
      RequestManager<GetCommunicationDetails>(
        params,
        createCall: () =>
            _createCommunicationLogUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _getCommunicationDetailsSubject
              .add(Resource.success(data: result.data));
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  final BehaviorSubject<Resource<SendCommunicationModel>>
      _sendCommunicationModelSubject =
      BehaviorSubject<Resource<SendCommunicationModel>>();

  Stream<Resource<SendCommunicationModel>> get sendCommunicationModelStream =>
      _sendCommunicationModelSubject.stream;

  void sendCommunication(String communocationId) {
    _getCommunicationDetailsSubject.add(Resource.loading(data: null));
    exceptionHandlerBinder.handle(block: () {
      SendCommunicationUsecaseParams params = SendCommunicationUsecaseParams(
          createCommunicationLogRequest: CreateCommunicationLogRequest(
              comment: commentController.text,
              attachmentDetails: '',
              rating: null,
              communicationId: communocationId,
              createdAt: DateTime.now(),
              isDraft: false,
              updatedAt: DateTime.now(),
              status: "open",
              userId: "1"));
      RequestManager<SendCommunicationModel>(
        params,
        createCall: () => _sendCommunicationUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _sendCommunicationModelSubject
              .add(Resource.success(data: result.data));
          getCommunicationDetails(communocationId);
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }
}
