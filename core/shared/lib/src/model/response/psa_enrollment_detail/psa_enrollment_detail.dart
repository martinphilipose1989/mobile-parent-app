

import 'package:shared/shared.dart';

class PsaEnrollmentDetailModel{
  List<FeeSubTypeModel>? feeSubType;
  List<FeeCategoryModel>? feeCategory;
  List<FeeSubCategoryModel>? feeSubCategory;
  List<BatchModel>? batches;
  List<PeriodOfServiceModel>? periodOfService;

  PsaEnrollmentDetailModel({
    this.feeSubType,
    this.feeCategory,
    this.feeSubCategory,
    this.batches,
    this.periodOfService,
  });
}