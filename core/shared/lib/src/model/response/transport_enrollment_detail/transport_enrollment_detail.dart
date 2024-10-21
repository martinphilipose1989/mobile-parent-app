import 'package:shared/shared.dart';

class TransportEnrollmentDetailModel {
    List<FeeSubTypeModel>? feeSubType;
    List<BatchModel>? batches;
    List<PeriodOfServiceModel>? periodOfService;
    List<FeeCategoryModel>? feeCategory;

    TransportEnrollmentDetailModel({
        this.feeSubType,
        this.batches,
        this.periodOfService,
        this.feeCategory,
    });

}