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
import 'package:notification/notification.dart';

import 'package:rxdart/rxdart.dart';
import 'package:services/services.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'dashboard_state.dart';

class DashboardPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetGuardianStudentDetailsUsecase getGuardianStudentDetailsUsecase;
  final TokenresponseUsecase tokenresponseUsecase;
  final Sendtokenusecase sendTokenUsecase;
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
      required this.flutterToastErrorPresenter,
      required this.sendTokenUsecase});

  final List<String> images = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
    AppImages.banner4,
    AppImages.banner5,
    AppImages.banner6,
    AppImages.banner7,
    AppImages.banner8,
    AppImages.banner9,
    AppImages.banner10,
    AppImages.banner11,
    AppImages.banner12,
    AppImages.banner13,
    AppImages.banner14,
    AppImages.banner15,
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
      'isActive': true,
      'key': 'transport'
    },
    {
      'name': 'View Gate Pass',
      'image': AppImages.gatePassIcon,
      'isSelected': false,
      'isActive': false,
      'key': 'view_gate_pass'
    },
    {
      'name': 'Create Gate Pass',
      'image': AppImages.gatePassIcon,
      'isSelected': false,
      'isActive': false,
      'key': 'create_gate_pass'
    },
  ];

  final List progress = [
    {
      'name': 'Student Profile',
      'image': AppImages.studentProfileIcon,
      'isSelected': true,
      'isActive': false,
      'key': 'student_profile'
    },
    // Coming Soon Features
    // {
    //   'name': 'Discipline Slips',
    //   'image': AppImages.document,
    //   'isSelected': false,
    //  'isActive': false,
    // },
    // {'name': 'Performance', 'image': AppImages.activity, 'isSelected': false},
    // {
    //   'name': 'Marksheet',
    //   'image': AppImages.documentNormal,
    //   'isSelected': false,
    //'isActive': true,
    // }
  ];

  final List enquiryAndAdmissionTemp = [
    {
      'name': 'Tickets',
      'image': AppImages.receiptSearch,
      'isSelected': false,
      'isActive': false
    },
    {
      'name': 'Application',
      'image': AppImages.cube,
      'isSelected': false,
      'isActive': false
    }
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
      'name': 'Value Added Services',
      'image': AppImages.valueAddedServiceIcon,
      'isSelected': false,
      'isActive': false,
      'key': 'enrollment'
    },
  ];

  final List parentServices = [
    {
      'name': 'Subject Selection',
      'image': AppImages.subjectSelectionNewIcon,
      'isSelected': false,
      'isActive': false,
      'key': 'subject selection'
    },
    {
      'name': 'Add Bearer',
      'image': AppImages.addPerson,
      'isSelected': false,
      'isActive': false,
      'key': 'add bearer'
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
      case 'value added services':
        return RoutePaths.newEnrolmentPage;
      case 'add bearer':
        return 'Add Bearer';
      default:
        return '';
    }
  }

  List<GetGuardianStudentDetailsStudentModel>? selectedStudentId = [];

  BehaviorSubject<String> selectedStudent = BehaviorSubject.seeded('');

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
          if (result.data?.data?.students?.isEmpty ?? false) {
            return;
          }
          tempList.add(result.data!.data!.students![0]);
          selectedStudentId = tempList;

          if (selectedStudentId == null || selectedStudentId!.isEmpty) return;
          dashboardState.setValueOfSelectedStudent(tempList.first);
          selectedStudent.add(tempList.first.studentDisplayName ?? '');

          processTermsAndConditionsSequentially(tempList);
          applyActivationRules(userSubject.value);
          showDrawerMenu.add(true);
          loadAdmissionMenus.add(Resource.success(data: true));
        }
        _getGuardianStudentDetailsModel.add(result);
      }).onError((error) {
        // // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> processTermsAndConditionsSequentially(
      List<GetGuardianStudentDetailsStudentModel> tempList) async {
    for (var item in tempList) {
      if ((item.isUndertakingTaken == null ||
              item.isUndertakingTaken == false) &&
          (item.undertakingFile?.isNotEmpty ?? false)) {
        await getTermsAndConditionUrl(undertakingFile: item.undertakingFile!);
      }
    }
  }

  Future<void> getTermsAndConditionUrl(
      {required String undertakingFile}) async {
    TermsAndConditionUsecaseParams params =
        TermsAndConditionUsecaseParams(url: undertakingFile);
    ApiResponseHandler.apiCallHandler(
        params: params,
        exceptionHandlerBinder: exceptionHandlerBinder,
        flutterToastErrorPresenter: flutterToastErrorPresenter,
        createCall: (params) =>
            termsAndConditionUsecase.execute(params: params),
        onSuccess: (result) async {
          await showPdfViewer(url: result?.data?.url ?? '');
        },
        onError: (error) {});
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
        if (data.data?.statusId == 0) {
          applyActivationRules(data);

          loadAdmissionMenus.add(Resource.success(data: true));
        }

        userSubject.add(Resource.success(data: data.data));

        FirebaseMessaging.instance.getToken().then((value) {
          if (value != null) {
            sendToken(userId: data.data?.id, appToken: value);
            log("FCM Token" "FCM Token: $value");
          } else {
            log("Error" "Failed to get FCM token");
          }
        }).catchError((error) {
          log("Exception" "Error getting FCM token: $error");
        });
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
      if (index < parentServices.length) {
        if (data.data?.statusId != 0) {
          parentServices[index]['isActive'] = true;
        } else {
          parentServices[index]['isActive'] = false;
        }
      }
    }
  }

  Future<void> sendToken({int? userId, String? appToken}) async {
    await exceptionHandlerBinder.handle(block: () {
      SendTokenUseCaseParams params = SendTokenUseCaseParams(
        userid: userId,
        appToken: appToken,
      );
      RequestManager(
        params,
        createCall: () => sendTokenUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {}
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> showPdfViewer({required String url}) async {
    await showDialog(
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
  final VoidCallback? onTap;

  Chips({this.name, this.image, this.isSelected = false, this.onTap});
}
