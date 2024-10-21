import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/batch_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_sub_category_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_sub_type_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/period_of_service_entity.dart';

part 'summer_camp_enrollment_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SummerCampEnrollmentDetailEntity extends BaseLayerDataTransformer<SummerCampEnrollmentDetailEntity,SummerCampEnrollmentDetailModel>{
    @JsonKey(name: 'feeSubType')
    List<FeeSubTypeEntity>? feeSubType;
    @JsonKey(name: 'batches')
    List<BatchEntity>? batches;
    @JsonKey(name: 'periodOfService')
    List<PeriodOfServiceEntity>? periodOfService;
    @JsonKey(name: 'feeSubCategory')
    List<FeeSubCategoryEntity>? feeSubCategory;

    SummerCampEnrollmentDetailEntity({
        this.feeSubType,
        this.batches,
        this.periodOfService,
        this.feeSubCategory,
    });

    factory SummerCampEnrollmentDetailEntity.fromJson(Map<String, dynamic> json) => _$SummerCampEnrollmentDetailEntityFromJson(json);

    Map<String, dynamic> toJson() => _$SummerCampEnrollmentDetailEntityToJson(this);

    @override
    SummerCampEnrollmentDetailModel transform() {
        return SummerCampEnrollmentDetailModel(
            feeSubType: feeSubType?.map((e) => e.transform()).toList(),
            batches: batches?.map((e) => e.transform()).toList(),
            periodOfService: periodOfService?.map((e) => e.transform()).toList(),
            feeSubCategory: feeSubCategory?.map((e) => e.transform()).toList(),
        );
    }

}