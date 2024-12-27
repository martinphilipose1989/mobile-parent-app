// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class GetCouponsUsecase extends BaseUseCase<BaseError, GetCouponsUsecaseParams,
    FetchCouponsListModel> {
  final AdminRepository _repository;

  GetCouponsUsecase(
    this._repository,
  );

  @override
  Future<Either<BaseError, FetchCouponsListModel>> execute(
      {required GetCouponsUsecaseParams params}) async {
    return await _repository.getCoupons(
      studentId: params.studentId,
      feeTypeIds: params.feeTypeIds,
      feeCategoryIds: params.feeCategoryIds,
      feeSubCategoryIds: params.feeSubCategoryIds,
      academicYrsId: params.academicYrsId,
      feeSubTypeIds: params.feeSubTypeIds,
    );
  }
}

class GetCouponsUsecaseParams extends Params {
  final String studentId;
  final String feeTypeIds;
  final String feeCategoryIds;
  final String feeSubCategoryIds;
  final String academicYrsId;
  final String feeSubTypeIds;

  GetCouponsUsecaseParams(
      {required this.studentId,
      required this.feeCategoryIds,
      required this.feeSubCategoryIds,
      required this.feeTypeIds,
      required this.academicYrsId,
      required this.feeSubTypeIds});

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
