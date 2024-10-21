import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'disciplinary_list_response.g.dart';
@JsonSerializable()
class DisciplinaryListEntity extends BaseLayerDataTransformer<
    DisciplinaryListEntity, DisciplinaryListModel > {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  bool success;

  DisciplinaryListEntity({
    required this.status,
    required this.data,
    required this.message,
    required this.success,
  });

  factory DisciplinaryListEntity.fromJson(Map<String, dynamic> json) => _$DisciplinaryListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DisciplinaryListEntityToJson(this);

  @override
  DisciplinaryListModel transform() {
    return DisciplinaryListModel(status: status, data: data, message: message, success: success
    );
  }

}



@JsonSerializable()
class  DisplinaryListMeta{
  @JsonKey(name: "total")
  int total;
  @JsonKey(name: "pageSize")
  int pageSize;
  @JsonKey(name: "numOfPages")
  int numOfPages;

  DisplinaryListMeta({
    required this.total,
    required this.pageSize,
    required this.numOfPages,
  });

  factory DisplinaryListMeta.fromJson(Map<String, dynamic> json) => _$DisplinaryListMetaFromJson(json);

  Map<String, dynamic> toJson() => _$DisplinaryListMetaToJson(this);
}





