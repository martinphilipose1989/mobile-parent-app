// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared/src/model/response/finance/get_pending_fees_model.dart';

class GroupByFeeTypeModel {
  final String feeType;
  final List<GetPendingFeesFeeModel> fees;
  final String? totalAmount;
  final String? feeDisplayName;

  GroupByFeeTypeModel(
      {required this.feeType,
      required this.fees,
      this.totalAmount,
      this.feeDisplayName});

  GroupByFeeTypeModel copyWith({
    final String? feeType,
    final String? totalAmount,
    List<GetPendingFeesFeeModel>? fees,
  }) {
    return GroupByFeeTypeModel(
        feeType: feeType ?? this.feeType,
        fees: fees ?? this.fees,
        totalAmount: totalAmount ?? this.totalAmount);
  }
}
