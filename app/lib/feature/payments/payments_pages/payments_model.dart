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

  final List<String> academicYearDropdownValues = [
    'AY 2023 - 2024',
    'AY 2024 - 2025',
  ];

  final List paymentHistoryTypes = [
    {'name': 'Transaction Type', 'isSelected': false},
    {'name': 'Fees Type', 'isSelected': false},
    {'name': 'Student Ledger', 'isSelected': false},
  ];

// executing all api call sequentially

  Future<void> executeTasksSequentially() async {
    await getStudentList();
    await getAcademicYear();

    Future.delayed(
      const Duration(seconds: 5),
      () => getSchoolNames(),
    );

    Future.delayed(
        const Duration(seconds: 5),
        () => filterPendingFeeList(
            academicYear: academicYearIds, studentIDs: studentIDs));
  }

//end

// Calling students list

  final PublishSubject<Resource<GetGuardianStudentDetailsModel>>
      _getGuardianStudentDetailsModel = PublishSubject();

  Stream<Resource<GetGuardianStudentDetailsModel>>
      get getGuardianStudentDetailsModel =>
          _getGuardianStudentDetailsModel.stream;

  Future<void> getStudentList() async {
    await exceptionHandlerBinder.handle(block: () {
      GetGuardianStudentDetailsUsecaseParams params =
          GetGuardianStudentDetailsUsecaseParams(mobileNo: 9986070926);
      RequestManager<GetGuardianStudentDetailsModel>(
        params,
        createCall: () =>
            _getGuardianStudentDetailsUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.data?.data != null) {
          studentIDs.add(result.data!.data!.students![0].id!);
        }
        _getGuardianStudentDetailsModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end

  // Calling academic year api

  final PublishSubject<Resource<GetAcademicYearModel>> _getAcademicYearModel =
      PublishSubject();

  Stream<Resource<GetAcademicYearModel>> get getAcademicYearModel =>
      _getAcademicYearModel.stream;

  Future<void> getAcademicYear() async {
    await exceptionHandlerBinder.handle(block: () {
      GetAcademicYearUsecaseParams params =
          GetAcademicYearUsecaseParams(students: [1], type: 'pending');
      RequestManager<GetAcademicYearModel>(
        params,
        createCall: () => _getAcademicYearUsecase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.data?.data != null) {
          academicYearIds.add(result.data!.data![0].id!);
        }

        _getAcademicYearModel.add(result);
      }).onError((error) {
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
        _getSchoolNamesModel.add(result);
        selectSchoolBrand = result.data?.data?.brandCodes?[0];
      }).onError((error) {
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
        if (result.status == Status.success) {
          _getPendingFeesModel.add(result.data!);
          createANewListAsPerStudentId(result.data!);
          calculateTotalAmount();
        }
      }).onError((error) {
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
    filterPendingFeeList(studentIDs: studentIDs, academicYear: academicYearIds);
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
    filterPendingFeeList(studentIDs: studentIDs, academicYear: academicYearIds);
  }

  // end

  // filtering pending fees as per school brand

  void filterPendingFeesAsPerSchoolBrand({required int brandCode}) {
    //  var currentList = pendingFeesFilteredById;

    // List<PendingFeesAsPerStudentIds> tempList = [];

    // for (var i = 0; i < (currentList?.length ?? 0); i++) {
    //   if (currentList![i].) {

    //   }
    // }
  }

  // end

  // Creating a new list as per our requirment to display pending fees data

  BehaviorSubject<Resource<List<PendingFeesAsPerStudentIds>>>
      pendingFeesFilteredById =
      BehaviorSubject<Resource<List<PendingFeesAsPerStudentIds>>>();

  List<PendingFeesAsPerStudentIds> abc = [];
  void createANewListAsPerStudentId(GetPendingFeesModel data) {
    for (var i = 0; i < studentIDs.length; i++) {
      if (abc.isNotEmpty) {
        abc.clear();
      }
      abc.add(PendingFeesAsPerStudentIds(
          studentId: studentIDs[i],
          studentName: '',
          fees: data.data?.fees!
                  .where((e) => e.studentId == studentIDs[i])
                  .toList() ??
              []));
    }
    pendingFeesFilteredById.add(Resource.success(data: abc));
  }

  // end

  //amount calculation on tap of checkbox

  BehaviorSubject<List<int>> amountToBeCalculated =
      BehaviorSubject<List<int>>.seeded([]);

  BehaviorSubject<int> totalAmount = BehaviorSubject<int>.seeded(0);
  void isFeesSelectable(
      {required int studentId,
      required int feeIndex,
      required int studentIdIndex,
      required String pendingAmount,
      required int feeId,
      required Function(bool) onCallBack}) {
    pendingFeesFilteredById
            .value.data![studentIdIndex].fees[feeIndex].isSelected =
        !(pendingFeesFilteredById
            .value.data![studentIdIndex].fees[feeIndex].isSelected);
    pendingFeesFilteredById.add(pendingFeesFilteredById.value);
    int receivedValue = int.tryParse(pendingAmount.split('.')[0]) ?? 0;

    // Get the current list
    List<int> currentList = amountToBeCalculated.value;

    if (currentList.contains(receivedValue)) {
      currentList.remove(receivedValue);
    } else {
      currentList.add(receivedValue);
    }
    amountToBeCalculated.add(currentList);
    int tempHold = 0;
    for (var i = 0; i < currentList.length; i++) {
      tempHold += currentList[i];
    }
    totalAmount.add(tempHold);
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

    for (var i = 0; i < fees!.length; i++) {
      if (fees[i].isSelected == true) {
        if (selectedFees.contains(fees[i].feeId ?? 0)) {
          selectedFees.remove(fees[i].feeId ?? 0);
        } else {
          selectedFees.add(fees[i].feeId ?? 0);
        }

        if (selectedPendingFessList.contains(fees[i])) {
          selectedPendingFessList.remove(fees[i]);
        } else {
          selectedPendingFessList.add(fees[i]);
        }
      }
    }
    for (var fee in selectedFees) {
      for (var paymentMode in paymentModes) {
        if (paymentMode.feeIds!.contains(fee)) {
          if (finalPaymentModelList.contains(paymentMode)) {
            finalPaymentModelList.remove(paymentMode);
          } else {
            finalPaymentModelList.add(paymentMode);
          }
        }
      }
    }

    print(selectedFees);
    print(selectedPendingFessList.map((e) => print(e.id)));
    print(finalPaymentModelList);
  }

  // end

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
