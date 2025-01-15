import 'dart:developer';

import 'package:app/errors/flutter_toast_error_presenter.dart';
import 'package:app/model/resource.dart';
import 'package:app/molecules/terms_and_condition/pdf.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/api_response_handler.dart';
import 'package:app/utils/common_widgets/app_images.dart';
import 'package:app/utils/enums/parent_student_status_enum.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:services/services.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'dashboard_state.dart';

@injectable
class DashboardPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetGuardianStudentDetailsUsecase getGuardianStudentDetailsUsecase;
  final TokenresponseUsecase tokenresponseUsecase;
  final GetUserRoleBasePermissionUsecase getUserRoleBasePermissionUsecase;
  final FlutterToastErrorPresenter flutterToastErrorPresenter;

  BehaviorSubject<ParentStudentStatusEnum> statusSubject =
      BehaviorSubject.seeded(ParentStudentStatusEnum.enquiry);

  final GetUserDetailsUsecase getUserDetailsUsecase;
  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  Stream<Resource<User>> get userStream => userSubject.stream;

  var dashboardState = DashboardState();

  // Terms and Condition

  final TermsAndConditionUsecase termsAndConditionUsecase;

  DashboardPageModel(
      {required this.exceptionHandlerBinder,
      required this.getGuardianStudentDetailsUsecase,
      required this.tokenresponseUsecase,
      required this.getUserRoleBasePermissionUsecase,
      required this.getUserDetailsUsecase,
      required this.termsAndConditionUsecase,
      required this.flutterToastErrorPresenter});

  final List<String> images = [
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    AppImages.pageViewImages,
    // Add more image paths if needed
  ];

  late String mobileNo;

  final List trackerTemp = [
    {
      'name': 'SR',
      'image': AppImages.userSearch,
      'isSelected': false,
      'isActive': false,
      'key': 'sr'
    },
    // {
    //   'name': 'Order',
    //   'image': AppImages.gift,
    //   'isSelected': false,
    //   'isActive': false,
    //   'key': 'order'
    // },
    {
      'name': 'Transport',
      'image': AppImages.bus,
      'isSelected': false,
      'isActive': false,
      'key': 'transport'
    },
    {
      'name': 'View Gate Pass',
      'image': AppImages.gift,
      'isSelected': false,
      'isActive': false,
      'key': 'view_gate_pass'
    },
    {
      'name': 'Create Gate Pass',
      'image': AppImages.admissionIcon,
      'isSelected': false,
      'key': 'create_gate_pass'
    },
  ];

  final List progress = [
    {
      'name': 'Student Profile',
      'image': AppImages.personIcon,
      'isSelected': false,
      'key': 'student_profile'
    },
    // Coming Soon Features
    // {
    //   'name': 'Discipline Slips',
    //   'image': AppImages.document,
    //   'isSelected': false
    // },
    // {'name': 'Performance', 'image': AppImages.activity, 'isSelected': false},
    // {
    //   'name': 'Marksheet',
    //   'image': AppImages.documentNormal,
    //   'isSelected': false
    // }
  ];

  final List enquiryAndAdmissionTemp = [
    {'name': 'Tickets', 'image': AppImages.receiptSearch, 'isSelected': false},
    {'name': 'Application', 'image': AppImages.cube, 'isSelected': false}
  ];

  final List feesTemp = [
    {
      'name': 'Payments',
      'image': AppImages.walletAdd,
      'isSelected': false,
      'isActive': false,
      'key': 'payment'
    },
    // VAS
    {
      'name': 'New Enrollment',
      'image': AppImages.activity,
      'isSelected': false,
      'isActive': false,
      'key': 'enrollment'
    },
  ];

  final List parentServices = [
    {
      'name': 'Subject Selection',
      'image': AppImages.subjectSelectionIcon,
      'isSelected': false,
      'isActive': false,
      'key': 'subject selection'
    },
  ];

  String returnRouteValue(String routeValue) {
    switch (routeValue) {
      case 'sr':
        return RoutePaths.notification;
      case 'order':
        return '';
      case 'transport':
        return RoutePaths.myDutyPage;
      case 'tickets':
        return RoutePaths.ticketListPage;
      case 'application':
        return '';
      case 'payments':
        return RoutePaths.payments;
      case '':
        return RoutePaths.payments;
      case 'student profile':
        return RoutePaths.attendanceCalender;
      case 'discipline slips':
        return RoutePaths.disciplinarySlipPage;
      case 'view gate pass':
        return RoutePaths.visitorDetailsPage;
      case 'create gate pass':
        return RoutePaths.createEditGatePassPage;
      case 'subject selection':
        return RoutePaths.webview;
      case 'new enrollment':
        return RoutePaths.newEnrolmentPage;

      default:
        return '';
    }
  }

  List<GetGuardianStudentDetailsStudentModel>? selectedStudentId = [];

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
    if (tempList.isNotEmpty) {
      dashboardState.setValueOfSelectedStudent(tempList.first);
    }
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
            getGuardianStudentDetailsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          List<GetGuardianStudentDetailsStudentModel> tempList = [];
          tempList.add(result.data!.data!.students![0]);
          selectedStudentId = tempList;

          if (selectedStudentId == null || selectedStudentId!.isEmpty) return;
          dashboardState.setValueOfSelectedStudent(tempList.first);
          if (dashboardState.selectedStudent?.isUndertakingTaken == null ||
              dashboardState.selectedStudent?.isUndertakingTaken == false) {
            if (dashboardState.selectedStudent?.undertakingFile != null ||
                (dashboardState.selectedStudent?.undertakingFile?.isNotEmpty ??
                    false)) {
              getTermsAndConditionUrl(
                  undertakingFile:
                      dashboardState.selectedStudent?.undertakingFile ?? '');
            }
          }
        }
        _getGuardianStudentDetailsModel.add(result);
      }).onError((error) {
        // // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getUserRoleBaseDetails() async {
    await exceptionHandlerBinder.handle(block: () {
      TokenresponseUsecaseParams params = TokenresponseUsecaseParams();
      RequestManager<TokenIntrospectionResponse>(
        params,
        createCall: () => tokenresponseUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          getUserProfile(
              request: UserRolePermissionRequest(
                  email: result.data?.email, service: "mobile_app"));
        }
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getUserProfile(
      {required UserRolePermissionRequest request}) async {
    await exceptionHandlerBinder.handle(block: () {
      GetUserRoleBasePermissionParams params =
          GetUserRoleBasePermissionParams(request: request);
      RequestManager<UserRolePermissionResponse>(
        params,
        createCall: () =>
            getUserRoleBasePermissionUsecase.execute(params: params),
      ).asFlow().listen((result) async {
        if (result.status == Status.success) {
          SharedPreferenceHelper.saveString(
              mobileNumber, "${result.data?.data?.user?.mobileNo}");
          final statusId = result.data?.data?.user?.statusId ?? 0;
          final statusEnum = ParentStudentStatusEnum.fromStatus(statusId);
          getUserDetails();
          // Add the enum to the subject
          statusSubject.add(statusEnum);
          final phoneNo = await SharedPreferenceHelper.getString(mobileNumber);
          mobileNo = phoneNo;
          if (phoneNo.isNotEmpty &&
              statusEnum == ParentStudentStatusEnum.admission) {
            getStudentList(int.parse(phoneNo));
          }
        }
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  BehaviorSubject<Resource<bool>> loadAdmissionMenus =
      BehaviorSubject.seeded(Resource.none());
  void getUserDetails() {
    loadAdmissionMenus.add(Resource.loading());
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        applyActivationRules(data);

        loadAdmissionMenus.add(Resource.success(data: true));

        userSubject.add(Resource.success(data: data.data));
      }
    });
  }

  void applyActivationRules(Resource<User> data) {
    int maxLength = trackerTemp.length > feesTemp.length
        ? trackerTemp.length
        : feesTemp.length;

    for (int index = 0; index < maxLength; index++) {
      if (index < trackerTemp.length) {
        if (data.data?.statusId != 0) {
          trackerTemp[index]['isActive'] = true;
        } else {
          if (trackerTemp[index]['key'] == "create_gate_pass" ||
              trackerTemp[index]['key'] == "transport") {
            trackerTemp[index]['isActive'] = false;
          } else {
            trackerTemp[index]['isActive'] = true;
          }
        }
      }

      if (index < feesTemp.length) {
        if (data.data?.statusId != 0) {
          feesTemp[index]['isActive'] = true;
        } else {
          feesTemp[index]['isActive'] = false;
        }
      }
    }

    for (int index = 0; index < progress.length; index++) {
      if (index < progress.length) {
        if (data.data?.statusId != 0) {
          progress[index]['isActive'] = true;
        } else {
          progress[index]['isActive'] = false;
        }
      }
    }

    for (int index = 0; index < parentServices.length; index++) {
      if (index < parentServices.length) {
        if (data.data?.statusId != 0) {
          parentServices[index]['isActive'] = true;
        } else {
          parentServices[index]['isActive'] = false;
        }
      }
    }
  }

  void getTermsAndConditionUrl({required String undertakingFile}) {
    TermsAndConditionUsecaseParams params =
        TermsAndConditionUsecaseParams(url: undertakingFile);
    ApiResponseHandler.apiCallHandler(
        params: params,
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        createCall: (params) =>
            termsAndConditionUsecase.execute(params: params),
        onSuccess: (result) {
          log("getTermsAndConditionUrl");

          showPdfViewer(url: result?.data?.url ?? '');
        },
        onError: (error) {});
  }

  showPdfViewer({required String url}) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) => PDFDialog(
          pdfUrl: url, selectedStudent: dashboardState.selectedStudent),
    );
  }

  @override
  void dispose() {
    dashboardState.dispose();

    super.dispose();
  }
}

class Chips {
  final String? name;
  final String? image;
  bool isSelected;

  Chips({this.name, this.image, this.isSelected = false});
}
