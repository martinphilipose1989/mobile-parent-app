import 'package:shared/shared.dart';
import 'package:shared/src/model/response/new_admission/common_data_class.dart';

class ExistingSchoolDetails {
  String? name;
  CommonDataClass? board;
  CommonDataClass? grade;

  ExistingSchoolDetails({this.name, this.board, this.grade});

  @override
  String toString() {
    return 'ExistingSchoolDetails(name: $name, board: $board, grade: $grade)';
  }
}
