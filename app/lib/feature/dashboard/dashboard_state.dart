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

  late List<GetGuardianStudentDetailsStudentModel> _selectedStudentList;

  void setValueOfSelectedStudentList(
      List<GetGuardianStudentDetailsStudentModel> value) {
    _selectedStudentList = value;
  }

  List<GetGuardianStudentDetailsStudentModel> get selectedStudentList =>
      _selectedStudentList;

  ///------- selected list --------///
  late GetGuardianStudentDetailsStudentModel _selectedStudent;

  void setValueOfSelectedStudent(GetGuardianStudentDetailsStudentModel value) {
    _selectedStudent = value;
  }

  GetGuardianStudentDetailsStudentModel get selectedStudent => _selectedStudent;
}
