import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../utils/request_manager.dart';

class DisplinaryDetailsViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
 final DisciplinarySlipListUsecase disciplinarySlipListUsecase;
 final CreateAcknowledgementUsecase  createAcknowledgementUsecase;
 final CoReasonsListUsecase coReasonsListUsecase;
 final StudentDetailUseCase studentDetailUsecase;

  DisplinaryDetailsViewModel(this.exceptionHandlerBinder, this.disciplinarySlipListUsecase, this.createAcknowledgementUsecase, this.coReasonsListUsecase, this.studentDetailUsecase);


  BehaviorSubject<bool> showExpansion =
  BehaviorSubject<bool>.seeded(false);


  final BehaviorSubject<Resource<DisciplinaryListModel>>
  _getDisciplinarySlipModel =
  BehaviorSubject<Resource<DisciplinaryListModel>>();

  Stream<Resource<DisciplinaryListModel>> get   getDisciplinarySlipModel =>
      _getDisciplinarySlipModel.stream;


  final BehaviorSubject<Resource<AcknowlegementResponseModel>>
  _acknowledgeSlipModel =
  BehaviorSubject<Resource<AcknowlegementResponseModel>>();

  Stream<Resource<AcknowlegementResponseModel>> get  acknowledgeSlipModel  =>
      _acknowledgeSlipModel.stream;

  late List<GetGuardianStudentDetailsStudentModel>? selectedStudent;
  final BehaviorSubject<Resource<CoReasonsListResponseModel>>
  _coReasonsListModel =
  BehaviorSubject<Resource<CoReasonsListResponseModel>>();

  Stream<Resource<CoReasonsListResponseModel>> get  coReasonsListModel  =>
      _coReasonsListModel.stream;



  void acknowledgeSlip(
  {required AcknowlegementRequestModel model}
      ){
   exceptionHandlerBinder.handle(block: () {

    CreateAcknowledgementUsecaseParams params= CreateAcknowledgementUsecaseParams(model);
    RequestManager<AcknowlegementResponseModel>(
     params,
     createCall: () => createAcknowledgementUsecase.execute(params: params),
    ).asFlow().listen((result) {
     _acknowledgeSlipModel.add(result);
     if (result.status == Status.error) {}

    }).onError((error) {
     exceptionHandlerBinder.showError(error!);
    });
   }).execute();



  }

void getCoReasonList() {
 exceptionHandlerBinder.handle(block: () {
  CoReasonsListParams params = CoReasonsListParams();
  RequestManager<CoReasonsListResponseModel>(
   params,
   createCall: () => coReasonsListUsecase.execute(params: params),
  ).asFlow().listen((result) {
   _coReasonsListModel.add(result);
   if (result.status == Status.error) {}
  }).onError((error) {
   exceptionHandlerBinder.showError(error!);
  });
 }
 )
 .
 execute
 (
 );
}

void getSlipList({required int studentId, int? academicYearId, DateTime? date}){
   exceptionHandlerBinder.handle(block: () {

 DisciplinarySlipListUsecaseParams params =  DisciplinarySlipListUsecaseParams(  studentId: studentId);
    // GetValidatePayNowUseCaseParams params = GetValidatePayNowUseCaseParams(
    //     paymentMode: paymentMode, studentFeeIds: studentFeeids);
    //
 RequestManager<DisciplinaryListModel>(
  params,
  createCall: () => disciplinarySlipListUsecase.execute(params: params),
 ).asFlow().listen((result) {
  _getDisciplinarySlipModel.add(result);
  if (result.status == Status.error) {}

 }).onError((error) {
  exceptionHandlerBinder.showError(error!);
 });
   }).execute();



  }



  final BehaviorSubject<Resource<StudentDetailsResponseModel>> _studentDetails =
  BehaviorSubject<Resource<StudentDetailsResponseModel>>();

  Stream<Resource<StudentDetailsResponseModel>> get studentDetails =>
      _studentDetails;

  void getStudentDetail({required int? id}) {
   exceptionHandlerBinder.handle(block: () {
    StudentDetailUseCaseParams params = StudentDetailUseCaseParams(id!);
    RequestManager<StudentDetailsResponseModel>(
     params,
     createCall: () => studentDetailUsecase.execute(params: params),
    ).asFlow().listen((result) {
     _studentDetails.add(result);
     if (result.status == Status.error) {}
    }).onError((error) {
     exceptionHandlerBinder.showError(error!);
    });
   }).execute();
  }
}



