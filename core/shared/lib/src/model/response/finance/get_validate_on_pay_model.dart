class GetValidateOnPayModel {
  final int? status;
  final GetValidateOnPayDataModel? data;
  final String? message;

  GetValidateOnPayModel({
    this.status,
    this.data,
    this.message,
  });
}

class GetValidateOnPayDataModel {
  final bool? validationStatus;
  final ChequeInFavourDetails? chequeInFavourDetails;
  final dynamic lastTransactionDetail;

  GetValidateOnPayDataModel({
    this.validationStatus,
    this.chequeInFavourDetails,
    this.lastTransactionDetail,
  });
}

class ChequeInFavourDetails {
  final int? chequeInFavourId;
  final String? chequeInFavour;

  ChequeInFavourDetails({
    this.chequeInFavourId,
    this.chequeInFavour,
  });
}
