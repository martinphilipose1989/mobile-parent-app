import 'dart:convert';

import 'dart:typed_data';

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class CreateQrcodeViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final RequestGatepassUsecase _requestGatepassUsecase;

  final BehaviorSubject<Resource<CreateQrcodeResponseModel>> response =
      BehaviorSubject<Resource<CreateQrcodeResponseModel>>();
// Uint8List qrImageBytes = Uint8List(0)
  final BehaviorSubject<Resource<Uint8List>> qrCodeSubject =
      BehaviorSubject<Resource<Uint8List>>.seeded(Resource.none());

  Stream<Resource<Uint8List>> get qrCodeStream => qrCodeSubject.stream;

  CreateQrcodeViewModel(
      {required this.exceptionHandlerBinder,
      required RequestGatepassUsecase requestGatepassUsecase})
      : _requestGatepassUsecase = requestGatepassUsecase;

  void requestGatePass() {
    qrCodeSubject.add(Resource.loading());
    final params = RequestGatepassUsecaseParams(
      requestBody: CreateQrcodeRequestModel(
        email: "janedoe@example.com",
        mobile: "+919090901235",
        name: "John Doe",
      ),
    );
    exceptionHandlerBinder.handle(block: () {
      RequestManager<CreateQrcodeResponseModel>(
        params,
        createCall: () => _requestGatepassUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          final cleanBase64 =
              result.data?.data?.qrCode.toString().split(",").last;
          if (cleanBase64 != null) {
            qrCodeSubject
                .add(Resource.success(data: base64Decode(cleanBase64)));
          }
        }
        response.add(result);
      }).onError((error) {});
    }).execute();
  }
}
