import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class UpdateContactDetailsUsecase extends BaseUseCase<BaseError,
    UpdateContactDetailsUsecaseParams, SingleResponse> {
  final RegistrationRepository _registrationRepository;

  UpdateContactDetailsUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, SingleResponse>> execute({
    required UpdateContactDetailsUsecaseParams params,
  }) {
    return _registrationRepository.updateContactDetails(
      enquiryID: params.enquiryID,contactDetails: params.contactDetails
    );
  }
}

class UpdateContactDetailsUsecaseParams extends Params {
  final String enquiryID;
  final ContactDetailsEntity contactDetails;
  UpdateContactDetailsUsecaseParams({
    required this.enquiryID,
    required this.contactDetails
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}