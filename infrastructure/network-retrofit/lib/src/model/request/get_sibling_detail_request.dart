class GetSiblingDetailRequest {
  String? enrollmentNumber;

  GetSiblingDetailRequest({this.enrollmentNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['crt_enr_on'] = enrollmentNumber;
    return data;
  }

  factory GetSiblingDetailRequest.fromJson(Map<String, dynamic> json) => GetSiblingDetailRequest(
    enrollmentNumber: json['crt_enr_on'],
  );

}