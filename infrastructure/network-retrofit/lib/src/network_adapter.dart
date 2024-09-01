import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/src/model/request/gatepass/create_qrcode_request.dart';
import 'package:network_retrofit/src/util/safe_api_call.dart';

import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  Future<Either<NetworkError, CreateQrcodeResponseModel>> requestGatePass(
      {required CreateQrcodeRequestModel requestBody}) async {
    final response = await safeApiCall(
      apiService.requestGatePass(CreateQrcodeRequestEntity(
          email: requestBody.email,
          mobile: requestBody.mobile,
          name: requestBody.name,
          profileImage: requestBody.profileImage)),
    );

    return response.fold(
        (error) => Left(error), (data) => Right(data.data.transform()));
  }
}
