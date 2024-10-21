import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'stop_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class StopDetailEntity extends BaseLayerDataTransformer<StopDetailEntity,StopDetail>{
    int? id;
    String? stopName;
    String? zoneName;
    int? schoolId;

    StopDetailEntity({
        this.id,
        this.stopName,
        this.zoneName,
        this.schoolId,
    });

    factory StopDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$StopDetailEntityFromJson(json);

    Map<String, dynamic> toJson() => _$StopDetailEntityToJson(this);

    @override
  StopDetail transform() {
    StopDetail stopDetail = StopDetail(
      id: id,
      schoolId: schoolId,
      stopName: stopName,
      zoneName: zoneName,
    );
    return stopDetail;
  }
}