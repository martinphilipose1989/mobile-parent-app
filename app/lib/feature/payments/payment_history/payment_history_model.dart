// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class PaymentHistoryModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  final GetAcademicYearUsecase _getAcademicYearUsecase;

  PaymentHistoryModel(
    this.exceptionHandlerBinder,
    this._getAcademicYearUsecase,
  );

  final List paymentHistoryTypes = [
    {'name': 'Transaction Type', 'isSelected': false},
    {'name': 'Fees Type', 'isSelected': false},
    {'name': 'Student Ledger', 'isSelected': false},
  ];

  final BehaviorSubject<int> switchTabsPaymentHistory =
      BehaviorSubject<int>.seeded(0);

  // Calling academic year api

  final PublishSubject<Resource<GetAcademicYearModel>> _getAcademicYearModel =
      PublishSubject();

  Stream<Resource<GetAcademicYearModel>> get getAcademicYearModel =>
      _getAcademicYearModel.stream;

  Future<void> getAcademicYear() async {
    await exceptionHandlerBinder.handle(block: () {
      GetAcademicYearUsecaseParams params =
          GetAcademicYearUsecaseParams(students: [2], type: 'collected');
      RequestManager<GetAcademicYearModel>(
        params,
        createCall: () => _getAcademicYearUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _getAcademicYearModel.add(result);
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  // end
}
