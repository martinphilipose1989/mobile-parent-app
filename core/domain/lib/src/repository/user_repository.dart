import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class UserRepository {
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password});

  Future<Either<DatabaseError, User>> saveUser(User user);

  Future<Either<BaseError, AuthResponse>> login();

  Future<Either<BaseError, bool>> storeAccessToken(AuthResponse authResponse);

  Future<Either<NetworkError, TokenIntrospectionResponse>> getTokenResponse();

  Future<Either<NetworkError, UserRolePermissionResponse>>
      getUserRolePermissions({required UserRolePermissionRequest body});

  Future<Either<LocalError, UserRolePermissionResponse>> storeUserResponse(
      UserRolePermissionResponse userRolePermissionResponse);

  Future<Either<LocalError, User>> getUserDetails();

  Future<Either<LocalError, LogoutResponse>> logOut();

  Future<Either<LocalError, bool>> clearSession();
}
