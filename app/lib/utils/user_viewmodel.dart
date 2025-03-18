import 'package:app/model/resource.dart';
import 'package:app/myapp.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserViewModel extends BasePageViewModel {
  final GetUserDetailsUsecase _getUserDetailsUsecase;
  final LogoutUsecase _logoutUsecase;
  final BehaviorSubject<Resource<User>> userSubject = BehaviorSubject();

  Stream<Resource<User>> get userStream => userSubject.stream;

  UserViewModel(
      {required GetUserDetailsUsecase getUserDetailsUsecase,
      required LogoutUsecase logoutUsecase})
      : _getUserDetailsUsecase = getUserDetailsUsecase,
        _logoutUsecase = logoutUsecase {
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

  void logOut() {
    final LogoutUsecaseParams params = LogoutUsecaseParams();
    RequestManager(params,
            createCall: () => _logoutUsecase.execute(params: params))
        .asFlow()
        .listen((data) {
      if (data.status == Status.success) {
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(RoutePaths.splash, (route) => false);
      }
    }, onDone: () {}, onError: (error) {});
  }
}
