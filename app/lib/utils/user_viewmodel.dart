import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserViewModel extends BasePageViewModel {
  final GetUserDetailsUsecase _getUserDetailsUsecase;
  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  Stream<Resource<User>> get userStream => userSubject.stream;

  UserViewModel({required GetUserDetailsUsecase getUserDetailsUsecase})
      : _getUserDetailsUsecase = getUserDetailsUsecase {
    getUserDetails();
  }

  void getUserDetails() {
    final GetUserDetailsUsecaseParams params = GetUserDetailsUsecaseParams();
    RequestManager(
      params,
      createCall: () => _getUserDetailsUsecase.execute(params: params),
    ).asFlow().listen((data) {
      if (data.status == Status.success) {
        userSubject.add(Resource.success(data: data.data));
      }
    });
  }
}
