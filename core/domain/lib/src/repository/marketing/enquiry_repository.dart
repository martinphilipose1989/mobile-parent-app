import 'package:domain/domain.dart';

abstract class EnquiryRepository{
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10});
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID});
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID});
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID});
  Future<Either<NetworkError,  IVTBase>> getIvtDetail({required String enquiryID});
}