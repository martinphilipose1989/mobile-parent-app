// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetUserRoleBasePermissionUsecase extends BaseUseCase<BaseError,
    GetUserRoleBasePermissionParams, UserRolePermissionResponse> {
  final UserRepository userRepository;

  GetUserRoleBasePermissionUsecase({required this.userRepository});

  @override
  Future<Either<BaseError, UserRolePermissionResponse>> execute(
      {required GetUserRoleBasePermissionParams params}) async {
    return Future.value(
      (await userRepository.getUserRolePermissions(body: params.request))
          .fold((l) => Left(l), (result) async {
        if (result.success == true) {
          return userRepository.storeUserResponse(result);
        } else {
          logoutOnTokenExpiry.add(true);
          return Left(NetworkError(
              httpError: 401, cause: Exception(), message: "Unauthorized"));
        }
      }),
    );
  }
}

class GetUserRoleBasePermissionParams extends Params {
  UserRolePermissionRequest request;
  GetUserRoleBasePermissionParams({required this.request});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
