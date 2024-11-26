// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class RatePageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  final SendCommunicationUsecase _sendCommunicationUsecase;
  final GetUserDetailsUsecase _getUserDetailsUsecase;

  RatePageModel(this.exceptionHandlerBinder, this._sendCommunicationUsecase,
      this._getUserDetailsUsecase);

  BehaviorSubject<int> selectedRatingValue = BehaviorSubject<int>.seeded(0);

  void updateRatingValue(int value) {
    selectedRatingValue.add(value);
  }

  TextEditingController commentController = TextEditingController();

  late String chatId;

  final BehaviorSubject<Resource<SendCommunicationModel>>
      _sendCommunicationModelSubject =
      BehaviorSubject<Resource<SendCommunicationModel>>();

  Stream<Resource<SendCommunicationModel>> get sendCommunicationModelStream =>
      _sendCommunicationModelSubject.stream;

  void sendCommunication(String communocationId) {
    _sendCommunicationModelSubject.add(Resource.loading(data: null));
    exceptionHandlerBinder.handle(block: () {
      SendCommunicationUsecaseParams params = SendCommunicationUsecaseParams(
          createCommunicationLogRequest: CreateCommunicationLogRequest(
              comment: commentController.text,
              attachmentDetails: null,
              rating: selectedRatingValue.value == 0
                  ? 1
                  : selectedRatingValue.value == 1
                      ? 2
                      : selectedRatingValue.value == 2
                          ? 3
                          : selectedRatingValue.value == 3
                              ? 4
                              : 5,
              communicationId: communocationId,
              createdAt: DateTime.now(),
              isDraft: false,
              updatedAt: DateTime.now(),
              status: "closed",
              userId: userSubject.value.data?.id.toString()));
      RequestManager<SendCommunicationModel>(
        params,
        createCall: () => _sendCommunicationUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _sendCommunicationModelSubject
              .add(Resource.success(data: result.data));
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
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
}
