import '../../../domain.dart';
import '../../repository/disciplinary_slip_repository.dart';
import '../base/base_usecase.dart';

class DisciplinarySlipListUsecase extends BaseUseCase<BaseError,
    DisciplinarySlipListUsecaseParams, DisciplinaryListModel> {
  final DisciplinarySlipRepository disciplinarySlipRepository;

  DisciplinarySlipListUsecase(this.disciplinarySlipRepository);

  @override
  Future<Either<BaseError, DisciplinaryListModel>> execute(
      {required DisciplinarySlipListUsecaseParams params}) async {
    return disciplinarySlipRepository.getdiscplinarySlipList(
        studentId: params.studentId,
        academicYearId: params.academicYearId,
        date: params.date);
  }
}

class DisciplinarySlipListUsecaseParams extends Params {
  int academicYearId;
  int studentId;
  DateTime date;

  DisciplinarySlipListUsecaseParams(
      {required this.date,
      required this.academicYearId,
      required this.studentId});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
