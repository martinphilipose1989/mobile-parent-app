import 'package:shared/shared.dart';

class KidsClubEnrollmentDetailModel {
  List<FeeSubTypeModel>? feeSubType;
  List<BatchModel>? batches;
  List<PeriodOfServiceModel>? periodOfService;
  List<FeeCategoryModel>? feeCategory;
  List<FeeSubCategoryModel>? feeSubCategory;

  KidsClubEnrollmentDetailModel(
      {this.feeSubType,
      this.batches,
      this.periodOfService,
      this.feeCategory,
      this.feeSubCategory});
}
