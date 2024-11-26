import 'package:app/base/base_singleton_state.dart';
import 'package:data/data.dart';

class DashboardState extends BaseSingletonState {
  // Constructor
  DashboardState._();

  static final DashboardState _instance = DashboardState._();

  factory DashboardState() {
    return _instance;
  }

  ///------- selected Student List --------///

  List<GetGuardianStudentDetailsStudentModel>? _selectedStudentList;

  void setValueOfSelectedStudentList(
      List<GetGuardianStudentDetailsStudentModel> value) {
    _selectedStudentList = value;
  }

  List<GetGuardianStudentDetailsStudentModel> get selectedStudentList =>
      _selectedStudentList ?? [];

  ///------- selected list --------///
  GetGuardianStudentDetailsStudentModel? _selectedStudent =
      GetGuardianStudentDetailsStudentModel();

  void setValueOfSelectedStudent(GetGuardianStudentDetailsStudentModel value) {
    _selectedStudent = value;
  }

  GetGuardianStudentDetailsStudentModel? get selectedStudent =>
      _selectedStudent;

  @override
  void dispose() {
    _selectedStudent = null;
    _selectedStudentList = null;
    super.dispose();
  }
}
