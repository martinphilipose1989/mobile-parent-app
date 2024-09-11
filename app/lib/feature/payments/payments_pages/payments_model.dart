// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentsModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetGuardianStudentDetailsUsecase _getGuardianStudentDetailsUsecase;
  final GetAcademicYearUsecase _getAcademicYearUsecase;
  final GetPendingFeesUsecase _getPendingFeesUsecase;
  final GetSchoolNamesUsecase _getSchoolNamesUsecase;

  PaymentsModel(
      this.exceptionHandlerBinder,
      this._getGuardianStudentDetailsUsecase,
      this._getAcademicYearUsecase,
      this._getPendingFeesUsecase,
      this._getSchoolNamesUsecase);

  late TabController tabController;

  final BehaviorSubject<int> selectedValue = BehaviorSubject<int>.seeded(0);

  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent;

  late int phoneNo;

  BehaviorSubject<bool> paymentsLoader = BehaviorSubject<bool>.seeded(true);

// Calling students list

  final BehaviorSubject<Resource<GetGuardianStudentDetailsModel>>
      _getGuardianStudentDetailsModel = BehaviorSubject();

  Stream<Resource<GetGuardianStudentDetailsModel>>
      get getGuardianStudentDetailsModel =>
          _getGuardianStudentDetailsModel.stream;

  Future<void> getStudentList(int parentMobileNo) async {
    await exceptionHandlerBinder.handle(block: () {
      GetGuardianStudentDetailsUsecaseParams params =
          GetGuardianStudentDetailsUsecaseParams(mobileNo: parentMobileNo);
      RequestManager<GetGuardianStudentDetailsModel>(
        params,
        createCall: () =>
            _getGuardianStudentDetailsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _getGuardianStudentDetailsModel.add(result);
          getAcademicYear();
        }
      }).onError((error) {
        paymentsLoader.add(false);
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  // Calling academic year api

  final BehaviorSubject<Resource<GetAcademicYearModel>> _getAcademicYearModel =
      BehaviorSubject();

  Stream<Resource<GetAcademicYearModel>> get getAcademicYearModel =>
      _getAcademicYearModel.stream;

  Future<void> getAcademicYear() async {
    await exceptionHandlerBinder.handle(block: () {
      GetAcademicYearUsecaseParams params =
          GetAcademicYearUsecaseParams(students: studentIDs, type: 'pending');
      RequestManager<GetAcademicYearModel>(
        params,
        createCall: () => _getAcademicYearUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _getAcademicYearModel.add(result);
          if (academicYearIds.isEmpty) {
            academicYearIds.add(result.data!.data![0].id!);
          }

          getSchoolNames();
        }
      }).onError((error) {
        paymentsLoader.add(false);
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  // Calling school names api

  final BehaviorSubject<Resource<SchoolNamesModel>> _getSchoolNamesModel =
      BehaviorSubject<Resource<SchoolNamesModel>>();

  Stream<Resource<SchoolNamesModel>> get getSchoolNamesModel =>
      _getSchoolNamesModel.stream;

  Future<void> getSchoolNames() async {
    await exceptionHandlerBinder.handle(block: () {
      GetSchoolNamesUsecaseParams params = GetSchoolNamesUsecaseParams(
          academicYearIds: academicYearIds, studentIds: studentIDs);
      RequestManager<SchoolNamesModel>(
        params,
        createCall: () => _getSchoolNamesUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          _getSchoolNamesModel.add(result);
          if (result.data?.data?.brandCodes?.isNotEmpty ?? false) {
            selectSchoolBrand = result.data?.data?.brandCodes?[0];
          } else {
            selectSchoolBrand = null;
          }
          filterPendingFeeList(
              academicYear: academicYearIds, studentIDs: studentIDs);
        }
      }).onError((error) {
        paymentsLoader.add(false);
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  // filtering pending list as per student id and academic year

  final BehaviorSubject<GetPendingFeesModel> _getPendingFeesModel =
      BehaviorSubject();

  BrandCode? selectSchoolBrand;

  void onSelectBrandCode({required BrandCode brandCode}) {
    selectSchoolBrand = brandCode;
    filterPendingFeeList(academicYear: academicYearIds, studentIDs: studentIDs);
  }

  Future<void> filterPendingFeeList(
      {List<int>? studentIDs, List<int>? academicYear}) async {
    await exceptionHandlerBinder.handle(block: () {
      GetPendingFeesUsecaseParams params = GetPendingFeesUsecaseParams(
          academicYear: academicYear ?? [],
          applicableTo: 2,
          students: studentIDs ?? [],
          brandId: selectSchoolBrand?.brandCode?.toInt(),
          entityId: int.tryParse(selectSchoolBrand?.legalIdentity ?? ''),
          type: 'pending');
      RequestManager<GetPendingFeesModel>(
        params,
        createCall: () => _getPendingFeesUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getPendingFeesModel.add(result.data!);
        if (result.status == Status.success) {
          paymentsLoader.add(false);
          int tempTotalAmount = 0;

          for (var i = 0; i < (result.data?.data?.fees?.length ?? 0); i++) {
            if (result.data?.data?.fees?[i].isOverdue == 1) {
              result.data?.data?.fees?[i].isSelected =
                  !(result.data?.data?.fees?[i].isSelected ?? false);
              tempTotalAmount += int.parse(
                  result.data?.data?.fees?[i].pending?.split('.')[0] ?? '');
            }
          }

          totalAmount.add(tempTotalAmount);
          pendingFeesFilteredById.add(Resource.success(data: []));
          createANewListAsPerStudentId(result.data!);
          calculateTotalAmount();
        }
      }).onError((error) {
        paymentsLoader.add(false);
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  // Used to get the total pending amount

  final BehaviorSubject<int> exactPendingAmountToBePaid =
      BehaviorSubject<int>.seeded(0);

  void calculateTotalAmount() {
    int receivedValue = 0;
    final currentList = _getPendingFeesModel.value;
    for (var i = 0; i < (currentList.data?.fees?.length ?? 0); i++) {
      receivedValue +=
          int.parse(currentList.data?.fees![i].pending?.split('.')[0] ?? '');
    }
    exactPendingAmountToBePaid.add(receivedValue);
  }

  // end

  // filtering fees api as per student id

  List<int> studentIDs = [];
  List<int> academicYearIds = [];
  void getSelectedStudentIds(
      {required List<String> selectedValues,
      required List<GetGuardianStudentDetailsStudentModel> students}) {
    List<int> tempList = [];
    for (var student in students) {
      for (var studentName in selectedValues) {
        if (student.studentDisplayName == studentName) {
          tempList.add(student.id!);
        }
      }
    }
    studentIDs = tempList;
    getAcademicYear();
  }

  // end

  // filtering fees api as per academic year

  void getSelectedAcademicYear(
      {required List<String> selectedValues, required List<YearData> data}) {
    List<int> tempList = [];
    for (var value in data) {
      for (var selectedValue in selectedValues) {
        if (value.name == selectedValue) {
          tempList.add(value.id!);
        }
      }
    }
    academicYearIds = tempList;
    getSchoolNames();
  }

  // end

  // Creating a new list as per our requirment to display pending fees data

  BehaviorSubject<Resource<List<PendingFeesAsPerStudentIds>>>
      pendingFeesFilteredById =
      BehaviorSubject<Resource<List<PendingFeesAsPerStudentIds>>>();

  List<PendingFeesAsPerStudentIds> abc = [];
  void createANewListAsPerStudentId(GetPendingFeesModel data) {
    List<PendingFeesAsPerStudentIds> abc = [];
    for (var i = 0; i < studentIDs.length; i++) {
      abc.add(PendingFeesAsPerStudentIds(
          studentId: studentIDs[i],
          studentName: _getGuardianStudentDetailsModel
                  .value.data?.data?.students
                  ?.firstWhere((e) => e.id == studentIDs[i])
                  .studentDisplayName ??
              "",
          fees: data.data?.fees!
                  .where((e) => e.studentId == studentIDs[i])
                  .toList() ??
              []));
    }
    pendingFeesFilteredById.add(Resource.success(data: abc));
  }

  // end

  //amount calculation on tap of checkbox

  BehaviorSubject<int> totalAmount = BehaviorSubject<int>.seeded(0);
  void isFeesSelectable(
      {required int studentId,
      required int feeIndex,
      required int studentIdIndex,
      required String pendingAmount,
      required int feeId,
      required Function(bool) onCallBack}) {
    if (pendingFeesFilteredById
        .value.data![studentIdIndex].fees[feeIndex].isSelected) {
      pendingFeesFilteredById
              .value.data![studentIdIndex].fees[feeIndex].isSelected =
          !(pendingFeesFilteredById
              .value.data![studentIdIndex].fees[feeIndex].isSelected);
      pendingFeesFilteredById.add(pendingFeesFilteredById.value);

      int receivedValue = int.tryParse(pendingAmount.split('.')[0]) ?? 0;

      totalAmount.add(totalAmount.value - receivedValue);
    } else {
      pendingFeesFilteredById
              .value.data![studentIdIndex].fees[feeIndex].isSelected =
          !(pendingFeesFilteredById
              .value.data![studentIdIndex].fees[feeIndex].isSelected);
      pendingFeesFilteredById.add(pendingFeesFilteredById.value);
      int receivedValue = int.tryParse(pendingAmount.split('.')[0]) ?? 0;

      // Get the current list
      List<int> currentList = [];

      if (currentList.contains(receivedValue)) {
        currentList.remove(receivedValue);
      } else {
        currentList.add(receivedValue);
      }

      int tempHold = 0;
      for (var i = 0; i < currentList.length; i++) {
        tempHold += currentList[i];
      }
      totalAmount.add(totalAmount.value + tempHold);
    }
  }

  // end

  // checking if selected pending fees support list of paymentmodes

  List<GetPendingFeesPaymentModeModel> finalPaymentModelList = [];
  List<GetPendingFeesFeeModel> selectedPendingFessList = [];

  void checkWhetherfeesIdExistInPayments() {
    List<GetPendingFeesFeeModel>? fees = _getPendingFeesModel.value.data!.fees;
    List<GetPendingFeesPaymentModeModel> paymentModes =
        _getPendingFeesModel.value.data!.paymentModes ?? [];
    List<int> selectedFees = [];
    List<GetPendingFeesFeeModel> tempList = [];
    List<GetPendingFeesPaymentModeModel> tempList2 = [];
    for (var i = 0; i < (fees?.length ?? 0); i++) {
      if (fees![i].isSelected) {
        selectedFees.add(fees[i].feeId ?? 0);
        tempList.add(fees[i]);
      }
    }
    selectedPendingFessList = tempList;

    for (var fee in selectedFees) {
      for (var paymentMode in paymentModes) {
        if (paymentMode.feeIds!.contains(fee)) {
          if (!tempList2.contains(paymentMode)) {
            tempList2.add(paymentMode);
          }
        }
      }
    }
    finalPaymentModelList = tempList2;
  }

  // end

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
