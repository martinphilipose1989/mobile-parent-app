import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/guardian_registration_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/parent_registration_entity.dart';

part 'parent_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ParentInfoEntity extends BaseLayerDataTransformer<ParentInfoEntity,ParentInfo>{
    @JsonKey(name: 'fatherDetails')
    ParentRegistrationDetailEntity? fatherDetails;
    @JsonKey(name: 'motherDetails')
    ParentRegistrationDetailEntity? motherDetails;
    @JsonKey(name: 'guardianDetails')
    GuardianDetailsEntity? guardianDetails;

    ParentInfoEntity({
        this.fatherDetails,
        this.motherDetails,
        this.guardianDetails,
    });
  factory ParentInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentInfoEntityToJson(this);

  @override
  ParentInfo transform() {
    ParentInfo parentInfo = ParentInfo();
    parentInfo.fatherDetails=fatherDetails?.transform();
    parentInfo.motherDetails=motherDetails?.transform();
    parentInfo.guardianDetails=guardianDetails?.transform();
    return parentInfo;
  }
}