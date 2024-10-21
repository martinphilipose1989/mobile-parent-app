import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/child_custody_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/guardian_registration_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/parent_registration_entity.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/sibling_registration_entity.dart';

part 'parent_info_entity.g.dart';

@JsonSerializable(explicitToJson: true,createToJson: false)
class ParentInfoEntity extends BaseLayerDataTransformer<ParentInfoEntity,ParentInfo>{
    @JsonKey(name: 'fatherDetails')
    ParentRegistrationDetailEntity? fatherDetails;
    @JsonKey(name: 'motherDetails')
    ParentRegistrationDetailEntity? motherDetails;
    @JsonKey(name: 'guardianDetails')
    GuardianDetailsEntity? guardianDetails;
    @JsonKey(name: 'siblingDetails')
    List<SiblingDetailEntity>? siblingDetails;
    @JsonKey(name: 'other_details')
    ChildCustodyDetailEntity? childCustodyDetail;

    ParentInfoEntity({
        this.fatherDetails,
        this.motherDetails,
        this.guardianDetails,
        this.siblingDetails,
        this.childCustodyDetail
    });
  factory ParentInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => {
    "parent_details": {
      "father_details": fatherDetails?.toJson(),
      "mother_details": motherDetails?.toJson(),
      "guardian_details": guardianDetails?.toJson(),
    },
    "sibling_details": (siblingDetails??[]).map((e) => e.toJson()).toList(),
    "other_details": childCustodyDetail?.toJson()
  };

  @override
  ParentInfo transform() {
    ParentInfo parentInfo = ParentInfo();
    parentInfo.fatherDetails=fatherDetails?.transform();
    parentInfo.motherDetails=motherDetails?.transform();
    parentInfo.guardianDetails=guardianDetails?.transform();
    parentInfo.siblingDetails = (siblingDetails??[]).map((e) => e.transform()).toList();
    parentInfo.childCustodyDetail = childCustodyDetail?.transform();
    return parentInfo;
  }

  @override
  ParentInfoEntity restore(ParentInfo data) {
    ParentRegistrationDetailEntity parentRegistrationDetailEntity = ParentRegistrationDetailEntity();
    SiblingDetailEntity siblingDetailEntity = SiblingDetailEntity();
    ChildCustodyDetailEntity childCustodyDetailEntity = ChildCustodyDetailEntity();
    GuardianDetailsEntity guardianDetailsEntity = GuardianDetailsEntity();
    ParentInfoEntity parentInfoEntity = ParentInfoEntity(
      fatherDetails: parentRegistrationDetailEntity.restore(data.fatherDetails!),
      motherDetails: parentRegistrationDetailEntity.restore(data.motherDetails!),
      guardianDetails: guardianDetailsEntity.restore(data.guardianDetails!),
      siblingDetails: (data.siblingDetails??[]).map((e)=> siblingDetailEntity.restore(e)).toList(),
      childCustodyDetail: childCustodyDetailEntity.restore(data.childCustodyDetail!)
    );
    return parentInfoEntity;
  }
}