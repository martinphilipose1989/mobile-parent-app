
import 'package:shared/src/model/response/admission_list/admission_list_model.dart';

class AdmissionListModel {
    int? totalCount;
    bool? isNextPage;
    List<AdmissionListDetailModel>? data;

    AdmissionListModel({
        this.totalCount,
        this.isNextPage,
        this.data,
    });

}