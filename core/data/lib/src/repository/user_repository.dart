
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:services/services.dart';

import '../out/app_auth_port.dart';
import '../out/database_port.dart';
import '../out/network_port.dart';

class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;
  final AppAuthPort appAuthPort;
  final String clientId;
  final String clientSecret;

  final SecureStorageService secureStorageService =
      GetIt.I<SecureStorageService>();

  UserRepositoryImpl(this.databaseProvider, this.networkPort, this.appAuthPort,
      this.clientId, this.clientSecret);

  @override
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password}) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, AuthResponse>> login() async {
    try {
      final result = await appAuthPort.login();
      if (result.accessToken != null) {
        return Right(
          AuthResponse(
              accessToken: result.accessToken,
              accessTokenExpirationDateTime:
                  result.accessTokenExpirationDateTime,
              idToken: result.idToken,
              refreshToken: result.refreshToken),
        );
      }

      return Left(LocalError(
          cause: Exception(),
          errorType: ErrorType.unknown,
          message: "Unable to login"));
    } catch (exception) {
      switch (exception.runtimeType) {
        case LocalError:
          if (exception is LocalError) {
            return Left(
              LocalError(
                cause: Exception(
                  exception.toString(),
                ),
                message: exception.toString(),
                errorType: exception.errorType,
              ),
            );
          } else {
            return Left(
              LocalError(
                  cause: Exception(
                    exception.toString(),
                  ),
                  message: exception.toString(),
                  errorType: ErrorType.unknown),
            );
          }
        default:
          return Left(
            LocalError(
                cause: Exception(
                  exception.toString(),
                ),
                message: exception.toString(),
                errorType: ErrorType.unknown),
          );
      }
    }
  }

  @override
  Future<Either<BaseError, bool>> storeAccessToken(
      AuthResponse authResponse) async {
    try {
      await Future.wait([
        secureStorageService.saveToDisk(
            secureStorageService.accessTokenKey, authResponse.accessToken),
        secureStorageService.saveToDisk(
            secureStorageService.idTokenKey, authResponse.idToken),
        secureStorageService.saveToDisk(
            secureStorageService.refreshTokenKey, authResponse.refreshToken),
        secureStorageService.saveToDisk(
          secureStorageService.expirationDateTimeKey,
          authResponse.accessTokenExpirationDateTime?.toIso8601String() ?? '',
        ),
      ]);
      return Right(true);
    } catch (error) {
      // Log the error or handle it as needed
      return Left(
        LocalError(
            errorType: ErrorType.storageError,
            message: error.toString(),
            cause: Exception()),
      );
    }
  }

  @override
  Future<Either<NetworkError, TokenIntrospectionResponse>>
      getTokenResponse() async {
    final token = await secureStorageService
        .getFromDisk(secureStorageService.accessTokenKey);

    return await networkPort.getTokenResponse(
        token: token, clientId: clientId, clientSecret: clientSecret);
  }
}
