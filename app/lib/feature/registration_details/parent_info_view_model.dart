// import 'package:app/model/resource.dart';
// import 'package:app/utils/request_manager.dart';
// import 'package:domain/domain.dart';
// import 'package:flutter_errors/flutter_errors.dart';
// import 'package:network_retrofit/network_retrofit.dart';
// import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

// class ParentInfoViewModel extends BasePageViewModel{
//   final FlutterExceptionHandlerBinder exceptionHandlerBinder;
//   final GetRegistrationDetailUsecase getRegistrationDetailUsecase;
//   ParentInfoViewModel(
//     this.exceptionHandlerBinder,
//     this.getRegistrationDetailUsecase
//   );

//   Future<void> fetchParentDetail(String enquiryID, String infoType) async {
//     exceptionHandlerBinder.handle(block: () {
//       GetRegistrationDetailUsecaseParams params =
//           GetRegistrationDetailUsecaseParams(
//               enquiryID: enquiryID, infoType: infoType);

//       RequestManager<SingleResponse>(
//         params,
//         createCall: () => getRegistrationDetailUsecase.execute(params: params),
//       ).asFlow().listen((result) {
//         if (result.status == Status.success) {
//           if (infoType == 'ParentInfo') {
//             parentDetail.add(Resource.success(data: result.data?.data));
//             parentInfo = result.data?.data;
//             addParentDetails(result.data?.data ?? ParentInfo());
//           } 
//           isLoading.value = false;
//         }
//         if (result.status == Status.error) {
//           if (infoType == 'ParentInfo') {
//             parentDetail.add(Resource.error());
//           } else if (infoType == 'ContactInfo') {
//             contactDetail.add(Resource.error());
//           } else if (infoType == 'MedicalInfo') {
//             medicalDetail.add(Resource.error());
//           } else if (infoType == 'BankInfo') {
//             bankDetail.add(Resource.error());
//           }
//           isLoading.value = false;
//           flutterToastErrorPresenter.show(
//               result.dealSafeAppError!.throwable,
//               navigatorKey.currentContext!,
//               result.dealSafeAppError?.error.message ?? '');
//         }
//       });
//     }).execute();
//   }
// }