import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/parent_contact_detail_entity.dart';

part 'parent_details_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ParentDetailsEntity extends BaseLayerDataTransformer<ParentDetailsEntity,ParentDetails>{
    @JsonKey(name: 'father_details')
    ParentContactDetailEntity? fatherDetails;
    @JsonKey(name: 'mother_details')
    ParentContactDetailEntity? motherDetails;

    ParentDetailsEntity({
      this.fatherDetails,
      this.motherDetails,
    });

  factory ParentDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentDetailsEntityToJson(this);

  @override
  ParentDetails transform() {
    ParentDetails parentDetails = ParentDetails();
    parentDetails.fatherDetails = fatherDetails?.transform();
    parentDetails.motherDetails = motherDetails?.transform();
    return parentDetails;
    
  }

  @override
  ParentDetailsEntity restore(ParentDetails data) {
    ParentContactDetailEntity parentContactDetailEntity = ParentContactDetailEntity();
    ParentDetailsEntity parentDetailsEntity = ParentDetailsEntity(
      fatherDetails : parentContactDetailEntity.restore(data.fatherDetails!),
      motherDetails : parentContactDetailEntity.restore(data.motherDetails!),
    );
    return parentDetailsEntity;
  }
}