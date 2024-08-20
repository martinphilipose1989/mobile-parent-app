//https://stackoverflow.com/a/65469596

class BaseResponse {
  dynamic message;
  late int? status;

  BaseResponse({this.message, this.status});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(status: json["status"], message: json["message"]);
  }
}

class SingleResponse<T> extends BaseResponse {
  T? data;

  SingleResponse({
    required String message,
    required int status,
    this.data,
  }) : super(message: message, status: status);

  factory SingleResponse.fromJson(Map<String, dynamic> json,
      ) {
    return SingleResponse<T>(
        message: json["message"],
        status: json["status"],
        data: json["data"] );
  }
  toJson(){
    return {
      "message":message,
      "status":status,
      "data":data
    };
  }
}

// class ListResponse<T> extends BaseResponse {
//   List<T>? data;

//   ListResponse({
//     required String message,
//     required String code,
//     this.data,
//   }) : super(message: message, code: code);

//   factory ListResponse.fromJson(Map<String, dynamic> json,
//       {T Function(Map<String, dynamic>)? create}) {
//     List<T> data = [];
//     if (create != null) {
//       json['data']?.forEach((v) {
//         data.add(create(v));
//       });
//     } else {
//       json['data']?.forEach((v) {
//         data.add(v);
//       });
//     }
//     return ListResponse<T>(code: json["code"], message: json["message"], data: data);
//   }
// }

// class ListPageResponse<T> extends BaseResponse {
//   List<T>? data;
//   int? pageToken;

//   ListPageResponse({
//     required String message,
//     required String code,
//     this.data,
//     this.pageToken,
//   }) : super(message: message, code: code);

//   factory ListPageResponse.fromJson(Map<String, dynamic> json,
//       {Function(Map<String, dynamic>)? create}) {
//     List<T> data = [];
//     int pageToken = -1;
//     if (json['data'] != null) {
//       pageToken = json['data']['page_token'];
//       if (create != null) {
//         json['data']['result']?.forEach((v) {
//           data.add(create(v));
//         });
//       } else {
//         json['data']['result']?.forEach((v) {
//           data.add(v);
//         });
//       }
//     }

//     return ListPageResponse<T>(
//         code: json["code"], message: json["message"], data: data, pageToken: pageToken);
//   }
// }

