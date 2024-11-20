class UploadIntimationFileResponseModel {
  int? status;
  IntimationFile? data;
  String? message;
  bool? success;

  UploadIntimationFileResponseModel({
    this.status,
    this.data,
    this.message,
    this.success,
  });

}

class   IntimationFile {
  String? fileAttachment;

  IntimationFile({
    this.fileAttachment,
  });

}
