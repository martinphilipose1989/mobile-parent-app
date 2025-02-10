import 'package:shared/shared.dart';

class CafeteriaEnrollmentDetailModel {
  List<FeeCategoryModel>? feeCategory;
  List<FeeCategoryModel>? feeSubType;
  List<PeriodOfServiceModel>? periodOfService;

  CafeteriaEnrollmentDetailModel(
      {this.feeCategory, this.periodOfService, this.feeSubType});
}
