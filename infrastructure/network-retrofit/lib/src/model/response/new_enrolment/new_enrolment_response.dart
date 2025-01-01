import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_enrolment_response.g.dart';

@JsonSerializable()
class NewEnrolmentResponseEntity
    implements
        BaseLayerDataTransformer<NewEnrolmentResponseEntity,
            NewEnrolmentResponse> {
  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'data')
  final Map<String, dynamic>? data;

  @JsonKey(name: 'message')
  final String? message;

  // Constructor
  NewEnrolmentResponseEntity({this.status, this.data, this.message});

  // Factory constructor for JSON deserialization
  factory NewEnrolmentResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$NewEnrolmentResponseEntityFromJson(json);

  // Method for JSON serialization
  Map<String, dynamic> toJson() => _$NewEnrolmentResponseEntityToJson(this);

  @override
  NewEnrolmentResponseEntity restore(NewEnrolmentResponse data) {
    return NewEnrolmentResponseEntity(
      status: data.status,
      data: data.data,
      message: data.message,
    );
  }

  @override
  NewEnrolmentResponse transform() {
    return NewEnrolmentResponse(status: status, data: data, message: message);
  }
}
