import 'package:shared/shared.dart';

class KidsClubEnrollmentDetailModel {
    List<FeeSubTypeModel>? feeSubType;
    List<BatchModel>? batches;
    List<PeriodOfServiceModel>? periodOfService;
    List<FeeCategoryModel>? feeCategory;

    KidsClubEnrollmentDetailModel({
        this.feeSubType,
        this.batches,
        this.periodOfService,
        this.feeCategory,
    });

}