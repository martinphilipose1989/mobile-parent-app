import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:network_retrofit/network_retrofit.dart';

class SelectOptionalSubjectUsecase extends BaseUseCase<BaseError,
    SelectOptionalSubjectUsecaseParams, SubjectDetailResponse> {
  final RegistrationRepository _registrationRepository;

  SelectOptionalSubjectUsecase(
    this._registrationRepository,
  );

  @override
  Future<Either<BaseError, SubjectDetailResponse>> execute({
    required SelectOptionalSubjectUsecaseParams params,
  }) {
    return _registrationRepository.selectOptionalSubject(
      subjectSelectionRequest: params.subjectSelectionRequest,
      enquiryID: params.enquiryID,
    );
  }
}

class SelectOptionalSubjectUsecaseParams extends Params {
  final List<SubjectSelectionRequest> subjectSelectionRequest;
  final String enquiryID;
  SelectOptionalSubjectUsecaseParams({
    required this.subjectSelectionRequest,
    required this.enquiryID,
  });

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}