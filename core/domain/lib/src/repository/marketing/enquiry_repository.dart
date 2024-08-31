import 'dart:io';

import 'package:domain/domain.dart';
import 'package:network_retrofit/network_retrofit.dart';

abstract class EnquiryRepository{
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10});
  Future<Either<NetworkError, EnquiryDetailBase>> getEnquiryDetail({required String enquiryID});
  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline({required String enquiryID});
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID,required String type});
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID});
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID});
  Future<Either<NetworkError,  IVTBase>> getIvtDetail({required String enquiryID});
  Future<Either<NetworkError,  NewAdmissionBase>> updateNewAdmissionDetail({required String enquiryID, required NewAdmissionDetailEntity newAdmissionDetail});
  Future<Either<NetworkError,  IVTBase>> updateIvtDetail({required String enquiryID,required IvtDetailResponseEntity ivtDetails});
  Future<Either<NetworkError,  PsaResponse>> updatePsaDetail({required String enquiryID, required PsaDetailResponseEntity psaDetail});
  Future<Either<NetworkError,EnquiryFileUploadBase>> uploadEnquiryDocument({required String enquiryID,required String documentID,required File file});
  Future<Either<NetworkError,DownloadEnquiryFileBase>> downloadEnquiryDocument({required String enquiryID,required String documentID});
  Future<Either<NetworkError,DeleteEnquiryFileBase>> deleteEnquiryDocument({required String enquiryID,required String documentID});
  Future<Either<NetworkError,MdmAttributeBaseModel>> getMdmAttribute({required String infoType});
}