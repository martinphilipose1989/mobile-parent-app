import 'package:data/data.dart';
import 'package:network_retrofit/src/model/response/get_registreation_info/preference_detail_entity.dart';
import '../../../../network_retrofit.dart';

part 'point_of_contact_entity.g.dart';

@JsonSerializable(explicitToJson: true,createPerFieldToJson: false)
class PointOfContactInfoEntity extends BaseLayerDataTransformer<PointOfContactInfoEntity,PointOfContactDetail>{

  @JsonKey(name: 'first_preference')
  PreferenceDetailEntity? firstPreference;
  @JsonKey(name: 'second_preference')
  PreferenceDetailEntity? secondPreference;
  @JsonKey(name: 'third_preference')
  PreferenceDetailEntity? thirdPreference;


  PointOfContactInfoEntity({
    this.firstPreference,
    this.secondPreference,
    this.thirdPreference,
  });

  factory PointOfContactInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$PointOfContactInfoEntityFromJson(json);

  Map<String, dynamic> toJson(){
    Map<String,dynamic> request = {};
    if(firstPreference!=null){
      request.addAll({"first_preference": firstPreference?.toJson()});
    }
    if(secondPreference!=null){
      request.addAll({"second_preference": secondPreference?.toJson()});
    }
    if(thirdPreference!=null){
      request.addAll({"third_preference": thirdPreference?.toJson()});
    }
   return request;
  }

  @override
  PointOfContactDetail transform() {
    PointOfContactDetail pointOfContactDetail = PointOfContactDetail();
    pointOfContactDetail.firstPreference = firstPreference?.transform();
    pointOfContactDetail.secondPreference = secondPreference?.transform();
    pointOfContactDetail.thirdPreference = thirdPreference?.transform(); 

    return pointOfContactDetail;
  }

  @override
  PointOfContactInfoEntity restore(PointOfContactDetail data) {
    PreferenceDetailEntity preferenceDetailEntity = PreferenceDetailEntity();
    PointOfContactInfoEntity pointOfContactInfoEntity = PointOfContactInfoEntity(
      firstPreference: preferenceDetailEntity.restore(data.firstPreference?? PreferenceDetail()),
      secondPreference: preferenceDetailEntity.restore(data.secondPreference ?? PreferenceDetail()),
      thirdPreference: preferenceDetailEntity.restore(data.thirdPreference ?? PreferenceDetail()),
          
    );
    return pointOfContactInfoEntity;
  }
}