import 'package:shared/shared.dart';

class SummerCampEnrollmentDetailModel {
    List<FeeSubTypeModel>? feeSubType;
    List<BatchModel>? batches;
    List<PeriodOfServiceModel>? periodOfService;
    List<FeeSubCategoryModel>? feeSubCategory;

    SummerCampEnrollmentDetailModel({
        this.feeSubType,
        this.batches,
        this.periodOfService,
        this.feeSubCategory,
    });

}