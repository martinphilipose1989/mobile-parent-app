import '../../../domain.dart';
import '../base/base_usecase.dart';

class CreateIntimationUsecase extends BaseUseCase<NetworkError,
    CreateIntimationUseCaseParams, CreateIntimationResponseModel> {
  final TransportRepository transportRepository;

  CreateIntimationUsecase({required this.transportRepository});

  @override
  Future<Either<NetworkError, CreateIntimationResponseModel>> execute(
      {required CreateIntimationUseCaseParams params}) {
    return transportRepository.createIntimation(
        createIntimationUseCase: params);
  }
}

class CreateIntimationUseCaseParams extends Params {
  int? globalUserId;
  int? globalStudentId;
  String? fromDate;
  String? toDate;
  int? status;
  int? initimationType;
  String? note;
  String? fileAttachment;
  String? approvalFlag;
  int? approvedById;

  CreateIntimationUseCaseParams(
      {this.globalUserId,
      this.globalStudentId,
      this.fromDate,
      this.toDate,
      this.status,
      this.initimationType,
      this.note,
      this.fileAttachment,
      this.approvalFlag,
      this.approvedById});

  @override
  Either<AppError, bool> verify() {
    return right(true);
  }
}
