import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/batch_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_category_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/fee_sub_type_entity.dart';
import 'package:network_retrofit/src/model/response/psa_enrollment_detail/period_of_service_entity.dart';

part 'transport_enrollment_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class TransportEnrollmentDetailEntity extends BaseLayerDataTransformer<TransportEnrollmentDetailEntity,TransportEnrollmentDetailModel>{
    @JsonKey(name: 'feeSubType')
    List<FeeSubTypeEntity>? feeSubType;
    @JsonKey(name: 'batches')
    List<BatchEntity>? batches;
    @JsonKey(name: 'periodOfService')
    List<PeriodOfServiceEntity>? periodOfService;
    @JsonKey(name: 'feeCategory')
    List<FeeCategoryEntity>? feeCategory;

    TransportEnrollmentDetailEntity({
        this.feeSubType,
        this.batches,
        this.periodOfService,
        this.feeCategory,
    });

    factory TransportEnrollmentDetailEntity.fromJson(Map<String, dynamic> json) => _$TransportEnrollmentDetailEntityFromJson(json);

    Map<String, dynamic> toJson() => _$TransportEnrollmentDetailEntityToJson(this);

    @override
    TransportEnrollmentDetailModel transform() {
        return TransportEnrollmentDetailModel(
            feeSubType: feeSubType?.map((e) => e.transform()).toList(),
            batches: batches?.map((e) => e.transform()).toList(),
            periodOfService: periodOfService?.map((e) => e.transform()).toList(),
            feeCategory: feeCategory?.map((e) => e.transform()).toList(),
        );
    }

}