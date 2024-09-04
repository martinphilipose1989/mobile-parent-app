import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'child_custody_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ChildCustodyDetailEntity extends BaseLayerDataTransformer<ChildCustodyDetailEntity,ChildCustodyDetail>{
    @JsonKey(name: 'are_parents_separated')
    String? areParentsSeparated;
    @JsonKey(name: 'child_custody')
    String? childCustody;

    ChildCustodyDetailEntity({
        this.areParentsSeparated,
        this.childCustody,
    });

    factory ChildCustodyDetailEntity.fromJson(Map<String, dynamic> json) => _$ChildCustodyDetailEntityFromJson(json);
    Map<String, dynamic> toJson() => _$ChildCustodyDetailEntityToJson(this);

    @override
    ChildCustodyDetail transform() {
        ChildCustodyDetail childCustodyDetail = ChildCustodyDetail();
        childCustodyDetail.areParentsSeparated = areParentsSeparated;
        childCustodyDetail.childCustody = childCustody;
        return childCustodyDetail;
    }

    @override
    ChildCustodyDetailEntity restore(ChildCustodyDetail data) {
    ChildCustodyDetailEntity childCustodyDetailEntity = ChildCustodyDetailEntity();
    childCustodyDetailEntity.areParentsSeparated = data.areParentsSeparated;
    childCustodyDetailEntity.childCustody = data.childCustody;
    return childCustodyDetailEntity;
  }
}