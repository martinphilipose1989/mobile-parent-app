import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'student_fee_request.g.dart';

@JsonSerializable()
class StudentFeeRequest
    extends BaseLayerDataTransformer<StudentFeeRequest, StudentFee> {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "fee_id")
  final int? feeId;
  @JsonKey(name: "amount")
  final String? amount;

  StudentFeeRequest({
    this.id,
    this.feeId,
    this.amount,
  });

  factory StudentFeeRequest.fromJson(Map<String, dynamic> json) =>
      _$StudentFeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StudentFeeRequestToJson(this);

  @override
  StudentFeeRequest restore(StudentFee data) {
    // TODO: implement restore
    return StudentFeeRequest(amount: amount, feeId: feeId, id: id);
  }
}
