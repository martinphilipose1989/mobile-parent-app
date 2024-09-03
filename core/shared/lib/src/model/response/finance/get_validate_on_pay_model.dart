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
  final LastTransactionDetailModel? lastTransactionDetailModel;
  final AcademicStartDate? academicStartDate;

  GetValidateOnPayDataModel(
      {this.validationStatus,
      this.chequeInFavourDetails,
      this.lastTransactionDetailModel,
      this.academicStartDate});
}

class AcademicStartDate {
  DateTime the25;

  AcademicStartDate({
    required this.the25,
  });
}

class LastTransactionDetailModel {
  String customerBankIfsc;
  String customerBankName;

  LastTransactionDetailModel({
    required this.customerBankIfsc,
    required this.customerBankName,
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
