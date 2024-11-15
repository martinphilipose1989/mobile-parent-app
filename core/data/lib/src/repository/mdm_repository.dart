
import 'package:data/src/out/network_port.dart';
import 'package:domain/domain.dart';

class MDMRepositoryImpl extends MDMRepository{
  final NetworkPort networkPort;

  MDMRepositoryImpl(this.networkPort);
  @override
  Future<Either<BaseError, MsgCategoryModel>> createCategory() {
    return networkPort.createCategory();
  }

  @override
  Future<Either<BaseError, MsgSubCategoryModel>> createSubCategory() {
     return networkPort.createSubCategory();
  }

}