import 'package:shared/src/model/response/finance/get_pending_fees_model.dart';

class PendingFeesAsPerStudentIds {
  final int studentId;
  final String studentName;
  final bool? isSelected;
  final List<GetPendingFeesFeeModel> fees;

  PendingFeesAsPerStudentIds({
    required this.studentId,
    required this.studentName,
    required this.fees,
    this.isSelected = false,
  });

  PendingFeesAsPerStudentIds copyWith({
    int? studentId,
    String? studentName,
    bool? isSelected,
    List<GetPendingFeesFeeModel>? fees,
  }) {
    return PendingFeesAsPerStudentIds(
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      isSelected: isSelected ?? this.isSelected,
      fees: fees ?? this.fees,
    );
  }
}
