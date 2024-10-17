import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class DashboardPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetGuardianStudentDetailsUsecase _getGuardianStudentDetailsUsecase;

  DashboardPageModel(
      this.exceptionHandlerBinder, this._getGuardianStudentDetailsUsecase);

  final List<String> images = [
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    // Add more image paths if needed
  ];

  late String mobileNo;

  final List<String> dropdownValues = [
    'Vipul patel EN1437465346',
    'Amit patel EN1437465346'
  ];

  final List trackerTemp = [
    {'name': 'SR', 'image': AppImages.userSearch, 'isSelected': false},
    {'name': 'Order', 'image': AppImages.gift, 'isSelected': false},
    {'name': 'Transport', 'image': AppImages.bus, 'isSelected': false}
  ];

  final List enquiryAndAdmissionTemp = [
    {
      'name': 'Enquiries',
      'image': AppImages.receiptSearch,
      'isSelected': false
    },
    {'name': 'Application', 'image': AppImages.cube, 'isSelected': false}
  ];

  final List feesTemp = [
    {'name': 'Payments', 'image': AppImages.walletAdd, 'isSelected': false},
    {
      'name': 'New Enrollment',
      'image': AppImages.activity,
      'isSelected': false
    },
  ];

  String returnRouteValue(String routeValue) {
    switch (routeValue) {
      case 'sr':
        return '';
      case 'order':
        return '';
      case 'transport':
        return  RoutePaths.attendanceCalender;
      case 'enquires':
        return '';
      case 'application':
        return RoutePaths.disciplinarySlipPage;
      case 'payments':
        return RoutePaths.payments;
      case 'new enrollments':
        return ""
            ;
      default:
        return '';
    }
  }

  List<GetGuardianStudentDetailsStudentModel>? selectedStudentId;

  void getSelectedStudentid(List<String> names) {
    List<GetGuardianStudentDetailsStudentModel> tempList = [];
    for (var student
        in _getGuardianStudentDetailsModel.value.data!.data!.students!) {
      for (var name in names) {
        if (student.studentDisplayName == name) {
          tempList.add(student);
        }
      }
    }
    selectedStudentId = tempList;
  }

  // Calling students list

  final BehaviorSubject<Resource<GetGuardianStudentDetailsModel>>
      _getGuardianStudentDetailsModel = BehaviorSubject();

  Stream<Resource<GetGuardianStudentDetailsModel>>
      get getGuardianStudentDetailsModel =>
          _getGuardianStudentDetailsModel.stream;

  Future<void> getStudentList(int mobileNo) async {
    await exceptionHandlerBinder.handle(block: () {
      GetGuardianStudentDetailsUsecaseParams params =
          GetGuardianStudentDetailsUsecaseParams(
              mobileNo: mobileNo); // 6380876483
      RequestManager<GetGuardianStudentDetailsModel>(
        params,
        createCall: () =>
            _getGuardianStudentDetailsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          List<GetGuardianStudentDetailsStudentModel> tempList = [];
          tempList.add(result.data!.data!.students![0]);
          selectedStudentId = tempList;
        }
        _getGuardianStudentDetailsModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end
}

class Chips {
  final String? name;
  final String? image;
  bool isSelected;

  Chips({this.name, this.image, this.isSelected = false});
}
