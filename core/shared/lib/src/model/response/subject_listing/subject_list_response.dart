import 'package:shared/src/model/response/subject_listing/subject_list_detail.dart';

class SubjectListResponse {
    int? status;
    SubjectListDetail? data;
    String? message;
    bool? success;

    SubjectListResponse({
        this.status,
        this.data,
        this.message,
        this.success,
    });

}