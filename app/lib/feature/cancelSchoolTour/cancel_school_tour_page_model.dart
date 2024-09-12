import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:network_retrofit/network_retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:intl/intl.dart';

@injectable
class CancelSchoolTourPageModel extends BasePageViewModel {
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final GetMdmAttributeUsecase getMdmAttributeUsecase;
  final CancelSchoolVisitUsecase cancelSchoolVisitUsecase;
  CancelSchoolTourPageModel(this.exceptionHandlerBinder,this.cancelSchoolVisitUsecase,this.getMdmAttributeUsecase);

  final PublishSubject<Resource<SchoolVisitDetail>> schoolVisitDetail = PublishSubject();
  final PublishSubject<Resource<SchoolVisitDetailBase>> _cancelSchoolTour = PublishSubject();
  Stream<Resource<SchoolVisitDetailBase>> get cacnelSchoolTour => _cancelSchoolTour.stream;
  SchoolVisitDetail? schoolVisitDetailData;
  TextEditingController controller = TextEditingController();
  DateFormat dateFormat = DateFormat('d MMMM yyyy');
  final formKey = GlobalKey<FormState>();

  Future<void> cacnelSchoolVisit({required String enquiryID, required String schoolVisitID}) async {
      exceptionHandlerBinder.handle(block: () {
      SchoolVisitCancelRequest request = SchoolVisitCancelRequest(
        comment: controller.text.trim(),
        reason: selectedReason 
      );

      CancelSchoolVisitUsecaseParams params = CancelSchoolVisitUsecaseParams(
        enquiryID: enquiryID,
        schoolVisitCancelRequest: request,
      );
      schoolVisitDetail.add(Resource.loading());
      RequestManager<SchoolVisitDetailBase>(
        params,
        createCall: () => cancelSchoolVisitUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _cancelSchoolTour.add(result);
        if(result.status == Status.success){
          schoolVisitDetail.add(Resource.success(data: result.data?.data));
          schoolVisitDetailData = result.data?.data;
        }
        // activeStep.add()
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  Future<void> getMdmAttribute({required String infoType}) async {
    exceptionHandlerBinder.handle(block: () {
      GetMdmAttributeUsecaseParams params = GetMdmAttributeUsecaseParams(
        infoType: infoType,
      );
      RequestManager<MdmAttributeBaseModel>(
        params,
        createCall: () => getMdmAttributeUsecase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        if(result.status == Status.success){
          reasonTypes.removeRange(0, reasonTypes.length);
          result.data?.data?.forEach((element)=> reasonTypes.add(element.attributes?.reason??''));
        }
      }).onError((error) {
        exceptionHandlerBinder.showError(error!);
      });
    }).execute();
  }

  bool validateForm() {
    if (selectedReason.isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please select reason."));
      return false;
    }
    else if (controller.text.trim().isEmpty) {
      exceptionHandlerBinder.showError(Exception("Please enter your comment."));
      return false;
    }
    else {
      return true;
    }
  }

  final BehaviorSubject<bool> selectedReasonType =
  BehaviorSubject<bool>.seeded(false);
  String selectedReason = '';
  List<String> reasonTypes = [
    'Not Available',
    'No Show',
    'Not Interested'
  ];
}
