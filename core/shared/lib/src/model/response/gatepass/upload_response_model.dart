class UploadFileResponseModel {
  int? status;
  UploadFileResponseData? data;
  String? message;

  UploadFileResponseModel({
    this.status,
    this.data,
    this.message,
  });
}

class UploadFileResponseData {
  String? filePath;
  String? url;
  String? fileName;

  UploadFileResponseData({this.filePath, this.url, this.fileName});
}
