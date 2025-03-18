import 'package:data/data.dart';

import '../../../../network_retrofit.dart';
part 'staff_list_response_entity.g.dart';
@JsonSerializable()
class StaffListResponseEntity implements BaseLayerDataTransformer<StaffListResponseEntity,StaffListResponseModel>{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "data")
  List<StaffEntity>? data;
  @JsonKey(name: "message")
  String? message;

  StaffListResponseEntity ({
    this.status,
    this.data,
    this.message,
  });

  factory StaffListResponseEntity .fromJson(Map<String, dynamic> json) => _$StaffListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StaffListResponseEntityToJson(this);

  @override
  StaffListResponseEntity restore(StaffListResponseModel data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  StaffListResponseModel transform() {
  return StaffListResponseModel(status: status,data: data?.map((element)=> element.transform()).toList(),
      message: message);
  }
}

@JsonSerializable()
class StaffEntity implements BaseLayerDataTransformer<StaffEntity,Staff> {
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "mobile")
  String? mobile;

 StaffEntity({
    this.userId,
    this.fullName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobile,
  });

  factory StaffEntity.fromJson(Map<String, dynamic> json) => _$StaffEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StaffEntityToJson(this);

  @override
  StaffEntity restore(Staff data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Staff transform() {
return Staff(userId: userId,fullName: fullName,firstName: firstName,middleName: middleName,lastName: lastName,mobile: mobile)
;  }
}
