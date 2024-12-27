import 'package:app/model/resource.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../utils/request_manager.dart';

class CreateTicketViewModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final CreateCategoryUseCase _createCategoryUseCase;
  final CreateSubCategoryUseCase _createSubCategoryUseCase;
  final FindByCategorySubCategoryUsecase _findByCategorySubCategoryUsecase;
  final CreateTicketUsecase _createTicketUsecase;
  CreateTicketViewModel(
      this.exceptionHandlerBinder,
      this._createCategoryUseCase,
      this._createSubCategoryUseCase,
      this._findByCategorySubCategoryUsecase,
      this._createTicketUsecase);

  final PublishSubject<Resource<List<MsgCategoryModelDatum>>>
      _getCategoryModelResponse = PublishSubject();
  Stream<Resource<List<MsgCategoryModelDatum>>>
      get getCategoryModelResponseStream => _getCategoryModelResponse.stream;
  final PublishSubject<Resource<List<MsgSubCategoryDatumModel>>>
      _getSubCategoryModelResponse = PublishSubject();
  Stream<Resource<List<MsgSubCategoryDatumModel>>>
      get getSubCategoryModelResponseStream =>
          _getSubCategoryModelResponse.stream;

  final PublishSubject<Resource<FindByCategorySubCategoryModel>>
      _findByCatSubCategoryResponseSubject = PublishSubject();

  Stream<Resource<FindByCategorySubCategoryModel>>
      get findByCatSubCategoryResponseStream =>
          _findByCatSubCategoryResponseSubject.stream;

  final PublishSubject<Resource<CreateTicketModel>> _createTicketModelSubject =
      PublishSubject();

  Stream<Resource<CreateTicketModel>> get createTicketModelStream =>
      _createTicketModelSubject.stream;

  final BehaviorSubject<bool> loadingIndicator =
      BehaviorSubject<bool>.seeded(true);

  final BehaviorSubject<int> selCategoryId = BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<int> selSubCategoryId = BehaviorSubject<int>.seeded(0);
  List<MsgCategoryModelDatum> categoryList = [];
  List<MsgSubCategoryDatumModel> subCcategoryList = [];
  final List<String> subCategoryTypes = [];

  final BehaviorSubject<bool> submitIsClickable =
      BehaviorSubject<bool>.seeded(false);

  TextEditingController commentController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController responseController = TextEditingController();

  late List<GetGuardianStudentDetailsStudentModel>? selectedStudentId;

  Future<void> getCategories() async {
    await exceptionHandlerBinder.handle(block: () {
      CreateCategoryUseCaseParams params = CreateCategoryUseCaseParams();
      RequestManager<MsgCategoryModel>(
        params,
        createCall: () => _createCategoryUseCase.execute(params: params),
      ).asFlow().listen((result) {
        categoryList = result.data!.data ?? [];
        _getCategoryModelResponse
            .add(Resource.success(data: result.data?.data));
      }).onError((error) {
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getSubCategories() async {
    await exceptionHandlerBinder.handle(block: () {
      CreateSubCategoryUseCaseParams params = CreateSubCategoryUseCaseParams();
      RequestManager<MsgSubCategoryModel>(
        params,
        createCall: () => _createSubCategoryUseCase.execute(params: params),
      ).asFlow().listen((result) {
        /* if(result.status == Status.success){
          loadingIndicator.add(false);
        }*/
        subCcategoryList = result.data!.data;
        _getSubCategoryModelResponse
            .add(Resource.success(data: result.data?.data));
        if (result.status == Status.success) {}
      }).onError((error) {
        //loadingIndicator.add(false);
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> findByCategorySubCategory(
      int categoryId, int subCategoryId) async {
    await exceptionHandlerBinder.handle(block: () {
      FindByCategorySubCategoryUsecaseParams params =
          FindByCategorySubCategoryUsecaseParams(
              categoryId: categoryId, subCategoryId: subCategoryId);
      RequestManager<FindByCategorySubCategoryModel>(
        params,
        createCall: () =>
            _findByCategorySubCategoryUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _findByCatSubCategoryResponseSubject.add(result);
        if ((result.data?.data?[0].navigationInstruction?.isEmpty ?? false) &&
            (result.data?.data?[0].navigationLink?.isEmpty ?? false)) {
          subjectController.text = result.data?.data?[0].subject ?? '';
          responseController.text = result.data?.data?[0].response ?? '';
          submitIsClickable.add(true);
        }
      }).onError((error) {
        //loadingIndicator.add(false);
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  getCategorId(String selName) {
    var category = categoryList
        .firstWhere((element) => element.attributes?.name == selName)
        .id;
    selCategoryId.value = category ?? 0;
  }

  getSubCategoryId(String selName) {
    var subCategory = subCcategoryList
        .firstWhere((element) => element.attributes.name == selName)
        .id;
    selSubCategoryId.value = subCategory;
    findByCategorySubCategory(selCategoryId.value, selSubCategoryId.value);
  }

  Future<void> createticket() async {
    _createTicketModelSubject.add(Resource.loading(data: null));
    await exceptionHandlerBinder.handle(block: () {
      CreateTicketUsecaseParams params = CreateTicketUsecaseParams(
          createTicketRequest: CreateTicketRequest(
        attachment: '',
        categoryId: selCategoryId.value,
        communication: commentController.text,
        parentId: 1,
        studentId: selectedStudentId?.first.id.toString(),
        subcategoryId: selSubCategoryId.value,
        ticketTitle: subjectController.text,
      ));
      RequestManager<CreateTicketModel>(
        params,
        createCall: () => _createTicketUsecase.execute(params: params),
      ).asFlow().listen((result) {
        _createTicketModelSubject.add(Resource.success(data: result.data));
      }).onError((error) {
        //loadingIndicator.add(false);
        // exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  @override
  void dispose() {
    super.dispose();
    _getCategoryModelResponse.close();
    _getSubCategoryModelResponse.close();
    _findByCatSubCategoryResponseSubject.close();
    //loadingIndicator.close();
    // selectedValue.close();
  }
}
