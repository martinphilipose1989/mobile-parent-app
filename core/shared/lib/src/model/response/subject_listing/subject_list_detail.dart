import 'package:shared/src/model/response/subject_listing/page_detail.dart';
import 'package:shared/src/model/response/subject_listing/subject.dart';

class SubjectListDetail{
  List<SubjectModel>? data;
  PageDetail? meta;

  SubjectListDetail({
    this.data,
    this.meta,
  });
}