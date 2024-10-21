import 'package:shared/src/model/response/subject_selection/subject_detail.dart';

class SubjectDetailResponse{
  int? status;
  SubjectDetail? data;
  String? message;

  SubjectDetailResponse({
    this.status,
    this.data,
    this.message,
  });

}